<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" 
    exclude-result-prefixes="xs tei"
    version="2.0">
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    <!-- l'omission de strip-space est volontaire, cette balise supprimait tous les espaces entre les fins de balise TEI et les mots -->
    
    <!-- squelette du HTML de sortie -->
    <xsl:template match="/">
        <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                <title>
                    <xsl:value-of select="//titleStmt/title"/>
                </title>
            </head>
            <body>
                <h2><xsl:value-of select="//titleStmt/title"/></h2>
                <span>
                    <a href="{//body/div/@facs}">lien vers le manuscrit</a>
                </span>       
                <div>
                    <h2>Transcription facsimilaire</h2>
                    <div>
                        <p>
                            <xsl:apply-templates select="//text" mode="orig"/></p>
                    </div>
                </div>
                <div>
                    <h2>Transcription normalisée</h2>
                    <div><p>
                        <xsl:apply-templates select="//text" mode="reg"/></p>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
    
    <!-- pour tous les modes -->
    
    <!-- les sauts de ligne: gestion partout sauf dans les vers -->
    <xsl:template match="p/lb" mode="#all">
        <xsl:element name="br"></xsl:element>
    </xsl:template>
    
    <xsl:template match="said/lb" mode="#all">
        <xsl:element name="br"></xsl:element>
    </xsl:template>
    
    <xsl:template match="p/persName/lb" mode="#all">
        <xsl:element name="br"></xsl:element>
    </xsl:template>
    
    <xsl:template match="head//lb" mode="#all">
        <xsl:element name="br"></xsl:element>
    </xsl:template>
    
    <!-- les vers -->
    <xsl:template match="lg" mode="#all">
        <xsl:element name="ul">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="l" mode="#all">
        <li>
            <xsl:value-of select="hi//text() | choice/reg/text() | reg//text() | ./text()"/>
        </li>
    </xsl:template>


    <!-- gestion de la partie originale -->
    <xsl:template match="choice" mode="orig">
        <xsl:value-of select=".//orig/text() |
            .//abbr/text()"/>
    </xsl:template>
    
    <!-- gestion de la partie régularisée -->
    <!-- les paragraphes -->
    
    <xsl:template match="reg[@type='ponctuation']" mode="reg">
        <xsl:value-of select="./text() | ./pc/text()"/>
    </xsl:template>
    
    <xsl:template match="choice" mode="reg">
        <xsl:value-of select=".//reg/text() |
            .//expan//text()"/>
    </xsl:template>
    
</xsl:stylesheet>