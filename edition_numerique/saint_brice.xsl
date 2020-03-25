<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs tei"
    version="2.0">
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    <!-- l'omission de strip-space est volontaire, cette balise supprimait tous les espaces entre les fins de balise TEI et les mots -->

    <!-- configuration des sorties -->
    <xsl:template match="/">
        
        <xsl:variable name="file">
            <xsl:value-of select="replace(base-uri(./edition_numerique), '.xml', '')"/>
            <!-- récupération du nom et du chemin du fichier courant -->
        </xsl:variable>
        
        <xsl:variable name="pathAccueil">
            <xsl:value-of select="concat($file,'index','.html')"/>
        </xsl:variable>
        <xsl:variable name="pathAlloNorm">
            <xsl:value-of select="concat($file,'comparaison','.html')"/>
        </xsl:variable>
        
        <!-- pour l'édition allographétique -->
        <xsl:variable name="pathAllo1">
            <xsl:value-of select="concat($file,'allographe169r','.html')"/>
        </xsl:variable>
        <xsl:variable name="pathAllo2">
            <xsl:value-of select="concat($file,'allographe169v','.html')"/>
        </xsl:variable>
        
        <!-- pour l'édition normalisée -->
        <xsl:variable name="pathNorm1">
            <xsl:value-of select="concat($file,'normalise169r','.html')"/>
        </xsl:variable>
        <xsl:variable name="pathNorm2">
            <xsl:value-of select="concat($file,'normalise169v','.html')"/>
        </xsl:variable>
        
        <xsl:result-document href="{$pathAlloNorm}"  method="html" indent="yes">
        <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                <link rel="stylesheet" href="static/css/bootstrap.min.css"/>
                <link rel="stylesheet" href="static/css/css.css"/>
                <title>
                    <xsl:value-of select="//titleStmt/title[1]"/>
                </title>
            </head>
            <body class="container">
                <div class="row">
                    <div class="col-sm-12" style="text-align: center;">
                        <h1 style="color: #be122a;">
                            <xsl:value-of select="//titleStmt/title[1]"/>
                        </h1>
                        <p>Edition réalisée à partir du manuscrit Français 411 de la Bibliothèque Nationale de France : 
                            <a href="{//body/div/@facs}">lien vers le manuscrit numérisé de Gallica</a>. </p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <h2 style="color: #be122a;">Transcription facsimilaire des folios
                                <xsl:for-each select="//pb">
                                <xsl:variable name="foliosN">
                                    <xsl:value-of select="replace(@facs, '#', '')"/>
                                </xsl:variable>
                                <a href="{ancestor::TEI//surface[@xml:id=$foliosN]/graphic/@url}">
                                    <xsl:value-of select="@n"/>
                                </a>
                                <xsl:text> </xsl:text>
                            </xsl:for-each>
                        </h2>
                        <div class="col-sm-12" style=" text-align: right;">
                            <p>
                            <xsl:apply-templates select="//text" mode="orig"/>
                        </p>
                            </div>
                    </div>
                    <div class="col-sm-6">
                        <h2 style="color: #be122a;">Transcription normalisée des folios
                                <xsl:for-each select="//pb">
                                <xsl:variable name="foliosN">
                                    <xsl:value-of select="replace(@facs, '#', '')"/>
                                </xsl:variable>
                                <a href="{ancestor::TEI//surface[@xml:id=$foliosN]/graphic/@url}">
                                    <xsl:value-of select="@n"/>
                                </a>
                                <xsl:text> </xsl:text>
                            </xsl:for-each></h2>
                        <p>
                            <xsl:apply-templates select="//text" mode="reg"/>
                        </p>
                    </div>
                </div>
                <!-- utilitaires Bootstrap -->
                <script src="static/js/jquery-3.4.1.slim.min.js"/>
                <script src="static/js/popper.min.js"/>
                <script src="static/js/bootstrap.min.js"/>
            </body>
            <footer class="blog-footer">
                <div class="container" style="padding: 1em; text-align: center">
                    <p>© <a href="https://www.chartes.psl.eu">Ecole nationale des Chartes</a> - Maxime Challon</p>
                </div>
            </footer>
        </html>
        </xsl:result-document>
        
    </xsl:template>

    <!-- pour tous les modes -->

    <!-- les sauts de ligne: gestion partout sauf dans les vers -->
    <xsl:template match="p/lb" mode="#all">
        <xsl:element name="br"/>
    </xsl:template>

    <xsl:template match="said/lb" mode="#all">
        <xsl:element name="br"/>
    </xsl:template>

    <xsl:template match="p/persName/lb" mode="#all">
        <xsl:element name="br"/>
    </xsl:template>

    <xsl:template match="head//lb" mode="#all">
        <xsl:element name="br"/>
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
        <xsl:value-of select="
                .//orig/text() |
                .//abbr/text() |
                .//orig/hi/text()"/>
    </xsl:template>

    <!-- gestion de la partie régularisée -->
    <!-- les paragraphes -->

    <xsl:template match="reg[@type = 'ponctuation']" mode="reg">
        <xsl:value-of select="./text() | ./pc/text()"/>
    </xsl:template>

    <xsl:template match="choice" mode="reg">
        <xsl:value-of select="
                .//reg/text() |
                .//expan//text()"/>
    </xsl:template>

</xsl:stylesheet>