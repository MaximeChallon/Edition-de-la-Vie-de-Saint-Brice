<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs tei"
    version="2.0">
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>

    <!-- configuration des sorties HTML. Chaque page HTML dispose de son xsl:result-document ce qui explique la longueur du template match="/". -->
    <!-- L'XSL ayant été faite en mars, elle contient du JavaScript, ce que vous avez dit de ne pas mettre dans votre dernier mail. J'ai choisi de le laisser. -->
    <xsl:template match="/">

        <xsl:variable name="file">
            <xsl:value-of select="replace(base-uri(./edition_numerique), '.xml', '')"/>
            <!-- récupération du nom et du chemin du fichier courant -->
        </xsl:variable>

        <!-- chemin de la page d'accueil; seule cette page n'est pas dans le sous-dossier "pages" -->
        <xsl:variable name="pathAccueil">
            <xsl:value-of select="concat($file, 'accueil', '.html')"/>
        </xsl:variable>
        <!-- chemin de la page de comparaison entre les éditions allographétiques et normalisées -->
        <xsl:variable name="pathAlloNorm">
            <xsl:value-of select="concat($file, 'pages/comparaison', '.html')"/>
        </xsl:variable>

        <!-- pages des index de personnages et de lieux -->
        <xsl:variable name="pathIndexPers">
            <xsl:value-of select="concat($file, 'pages/personnages', '.html')"/>
        </xsl:variable>
        <xsl:variable name="pathIndexLieux">
            <xsl:value-of select="concat($file, 'pages/lieux', '.html')"/>
        </xsl:variable>

        <!-- pages de l'édition allographétique -->
        <xsl:variable name="pathAllo1">
            <xsl:value-of select="concat($file, 'pages/allographe169r', '.html')"/>
        </xsl:variable>
        <xsl:variable name="pathAllo2">
            <xsl:value-of select="concat($file, 'pages/allographe169v', '.html')"/>
        </xsl:variable>

        <!-- pages de l'édition normalisée -->
        <xsl:variable name="pathNorm1">
            <xsl:value-of select="concat($file, 'pages/normalise169r', '.html')"/>
        </xsl:variable>
        <xsl:variable name="pathNorm2">
            <xsl:value-of select="concat($file, 'pages/normalise169v', '.html')"/>
        </xsl:variable>


        <!-- page d'accueil -->
        <xsl:result-document href="{$pathAccueil}" method="html" indent="yes">
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

                    <!-- barre de menu -->
                    <nav class="navbar navbar-expand-lg navbar-light bg-light">
                        <a class="navbar-brand" href="{//titleStmt/title[1]}"
                            style="color: #be122a;font-weight:bold;">
                            <xsl:value-of select="//titleStmt/title[1]"/>
                        </a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse"
                            data-target="#navbarSupportedContent"
                            aria-controls="navbarSupportedContent" aria-expanded="false"
                            aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"/>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav mr-auto">
                                <li class="nav-item">
                                    <a class="nav-link" href="{$pathAccueil}">Accueil</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="{$pathAlloNorm}">Comparaison</a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                                        role="button" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false">Edition allographétique</a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="{$pathAllo1}">f169r</a>
                                        <a class="dropdown-item" href="{$pathAllo2}">f169v</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                                        role="button" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false">Edition normalisée</a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="{$pathNorm1}">f169r</a>
                                        <a class="dropdown-item" href="{$pathNorm2}">f169v</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                                        role="button" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false">Index</a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="{$pathIndexPers}"
                                            >Personnages</a>
                                        <a class="dropdown-item" href="{$pathIndexLieux}">Lieux</a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </nav>

                    <div class="row" style="margin:20px;">
                        <div class="col-sm-4" style="text-align:center;">
                            <img alt="f169r" src="static/img/f174_demi.jpg"
                                style="width:300px; height:auto;"/>
                        </div>
                        <div class="col-sm-8">
                            <!-- à partir des informations du TeiHeader, création d'une page d'informations générales sur le manuscrit en page d'accueil -->
                            <!-- toutes les informatiosn du TeiHeader ne sont pas présentes dans cette page d'accueil, seules les plus pertinentes y sont. -->
                            <h4 style="color:#be122a;">Informations générales sur le manuscrit</h4>
                            <ul>
                                <li><span style="color:#be122a;">Titre</span>: <xsl:value-of
                                        select="//titleStmt/title[1]/text()"/></li>
                                <li><span style="color:#be122a;">Auteur</span>: <xsl:value-of
                                        select="//titleStmt/author/forename/text()"
                                        /><xsl:text> </xsl:text><xsl:value-of
                                        select="//titleStmt/author/surname/text()"/></li>
                                <li><span style="color:#be122a;">Langue</span>: <xsl:value-of
                                        select="//langUsage/language/text()"/></li>
                                <li><span style="color:#be122a;">Lieu de conservation</span>:
                                        <xsl:value-of
                                        select="concat(//msIdentifier/repository/text(), ', ', //msIdentifier/collection/text(), ', ', //msIdentifier/settlement/text(), ', ', //msIdentifier/country/text())"
                                    />
                                </li>
                                <li><span style="color:#be122a;">Date</span>: <xsl:value-of
                                        select="//origDate/text()"/>
                                </li>
                                <li><span style="color:#be122a;">Description codicologique</span>:
                                        <xsl:value-of select="//foliation/p[1]/text()"/> sur
                                        <xsl:value-of select="//support/material[2]/text()"/></li>
                                <li><span style="color:#be122a;">Marges</span>:<ul>
                                        <xsl:for-each select="//layoutDesc/summary/p">
                                            <li><xsl:value-of select=".//text()"/></li>
                                        </xsl:for-each>
                                        <li><xsl:value-of select="//layout/note/text()"/></li>
                                    </ul>
                                </li>
                                <li><span style="color:#be122a;">Ecriture</span>: <xsl:value-of
                                        select="//scriptDesc//p//text()"/></li>
                            </ul>
                        </div>
                    </div>

                    <div class="row" style="margin:20px;">
                        <div class="col-sm-8">
                            <h4 style="color:#be122a;">La décoration du manuscrit</h4>
                            <p>
                                <xsl:value-of select="//decoNote/note[2]/text()"/>
                            </p>
                            <p>Pour les feuillets 169r et 169v, la décoration (absente mais dont la
                                place a été laissée) est la suivante: <ul>
                                    <li><span style="color:#be122a;">Miniature</span> de
                                            <xsl:value-of
                                            select="//decoNote[@type = 'miniature']/dimensions/height/text()"
                                        /> lignes de haut</li>
                                    <li><span style="color:#be122a;">Grande initiale</span> de
                                            <xsl:value-of
                                            select="//decoNote[@type = 'grande_initiale']/dimensions/height/text()"
                                        /> lignes de haut</li>
                                    <li><span style="color:#be122a;">Moyenne initiale</span> de
                                            <xsl:value-of
                                            select="//decoNote[@type = 'moyenne_initiale']/dimensions/height/text()"
                                        /> lignes de haut</li>
                                    <li><span style="color:#be122a;">Petite initiale</span> de
                                            <xsl:value-of
                                            select="//decoNote[@type = 'petite_initiale']/dimensions/height/text()"
                                        /> lignes de haut</li>
                                    <li><span style="color:#be122a;">Majuscule</span> de
                                            <xsl:value-of
                                            select="//decoNote[@type = 'majuscule']/dimensions/height/text()"
                                        /> ligne de haut</li>
                                    <li><span style="color:#be122a;">Lettre d'attente</span>:
                                            <xsl:value-of
                                            select="//decoNote[@type = 'lettre_attente']/note[1]//text()"
                                        /></li>
                                </ul>
                            </p>
                        </div>
                        <div class="col-sm-4" style="text-align:center;">
                            <img alt="f23r" src="static/img/f23_demi.jpg"
                                style="width:300px; height:auto;"/>
                        </div>
                    </div>

                    <div class="row" style="margin:20px;">
                        <div class="col-sm-4" style="text-align:center;">
                            <img alt="f169v" src="static/img/f175_demi.jpg"
                                style="width:300px; height:auto;"/>
                        </div>
                        <div class="col-sm-8">
                            <h4 style="color:#be122a;">Edition numérique réalisée à partir du
                                manuscrit Français 411 de la Bibliothèque nationale de France,
                                numérisé sur <a href="{//body/div/@facs}">Gallica</a>.</h4>
                            <p>
                                <ul>
                                    <li>Index <ul>
                                            <li><a href="{$pathIndexPers}">Index des noms de
                                                  personnages</a></li>
                                            <li><a href="{$pathIndexLieux}">Index des noms de
                                                  lieux</a></li>
                                        </ul>
                                    </li>
                                    <li>Transcriptions allographétiques <ul>
                                            <li><a href="{$pathAllo1}">Transcription allographétique
                                                  du folio 169r</a></li>
                                            <li><a href="{$pathAllo2}">Transcription allographétique
                                                  du folio 169v</a></li>
                                        </ul>
                                    </li>
                                    <li>Transcriptions normalisées <ul>
                                            <li><a href="{$pathNorm1}">Transcription normalisée du
                                                  folio 169r</a></li>
                                            <li><a href="{$pathNorm2}">Transcription normalisée du
                                                  folio 169v</a></li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="{$pathAlloNorm}">Comparaison entre le texte
                                            d'origine et celui normalisé</a>
                                    </li>
                                </ul>
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
                        <p>© <a href="https://www.chartes.psl.eu">Ecole nationale des Chartes</a> -
                            Maxime Challon</p>
                    </div>
                </footer>
            </html>
        </xsl:result-document>

        <!-- page des personnages -->
        <!-- à partir de cette page, la plupart des chemins mis prennent "../" avant eux pour correspondre à l'arborescence de la sortie HTML due au sous-dossier "pages" -->
        <xsl:result-document href="{$pathIndexPers}" method="html" indent="yes">
            <html>
                <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                    <link rel="stylesheet" href="../static/css/bootstrap.min.css"/>
                    <link rel="stylesheet" href="../static/css/css.css"/>
                    <title>
                        <xsl:value-of select="//titleStmt/title[1]"/>
                    </title>
                </head>
                <body class="container">

                    <!-- barre de menu -->
                    <nav class="navbar navbar-expand-lg navbar-light bg-light">
                        <a class="navbar-brand" href="{//titleStmt/title[1]}"
                            style="color: #be122a;font-weight:bold;">
                            <xsl:value-of select="//titleStmt/title[1]"/>
                        </a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse"
                            data-target="#navbarSupportedContent"
                            aria-controls="navbarSupportedContent" aria-expanded="false"
                            aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"/>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav mr-auto">
                                <li class="nav-item">
                                    <a class="nav-link" href="{concat('../', $pathAccueil)}"
                                        >Accueil</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="{concat('../', $pathAlloNorm)}"
                                        >Comparaison</a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                                        role="button" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false">Edition allographétique</a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="{concat('../',$pathAllo1)}"
                                            >f169r</a>
                                        <a class="dropdown-item" href="{concat('../',$pathAllo2)}"
                                            >f169v</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                                        role="button" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false">Edition normalisée</a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="{concat('../',$pathNorm1)}"
                                            >f169r</a>
                                        <a class="dropdown-item" href="{concat('../',$pathNorm2)}"
                                            >f169v</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                                        role="button" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false">Index</a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item"
                                            href="{concat('../',$pathIndexPers)}">Personnages</a>
                                        <a class="dropdown-item"
                                            href="{concat('../',$pathIndexLieux)}">Lieux</a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </nav>

                    <div class="row" style="color: #be122a;text-align: center;">
                        <h1>Index des personnages des folios 169r et 169v</h1>
                    </div>
                    <div class="row">
                        <xsl:for-each select="//person">
                            <!-- ce xsl:for-each créé à la fois une page HTML pour chaque personnage avec toutes les informations le concernant, et une card BootStrap pour la page d'index des personnages -->
                            <!-- création d'une variable ayant le chemin vers le fichier HTML du personnage -->
                            <xsl:variable name="pathPersonne">
                                <xsl:value-of
                                    select="concat($file, 'personnages/', persName/forename[1]/text(), '.html')"
                                />
                            </xsl:variable>
                            <!-- création d'une page par personnage d'abord -->
                            <xsl:result-document
                                href="{concat($file, 'pages/personnages/', persName/forename[1]/text(), '.html')}"
                                method="html" indent="yes">
                                <!-- dans ce href, je n'ai pas pu mettre la variable précédement créée en raison du sous-dossier pages -->
                                <html>
                                    <head>
                                        <meta http-equiv="Content-Type"
                                            content="text/html; charset=UTF-8"/>
                                        <link rel="stylesheet"
                                            href="../../static/css/bootstrap.min.css"/>
                                        <link rel="stylesheet" href="../../static/css/css.css"/>
                                        <title>
                                            <xsl:value-of select="//titleStmt/title[1]"/>
                                        </title>
                                    </head>
                                    <body class="container">

                                        <!-- barre de menu -->
                                        <nav class="navbar navbar-expand-lg navbar-light bg-light">
                                            <a class="navbar-brand" href="{//titleStmt/title[1]}"
                                                style="color: #be122a;font-weight:bold;">
                                                <xsl:value-of select="//titleStmt/title[1]"/>
                                            </a>
                                            <button class="navbar-toggler" type="button"
                                                data-toggle="collapse"
                                                data-target="#navbarSupportedContent"
                                                aria-controls="navbarSupportedContent"
                                                aria-expanded="false" aria-label="Toggle navigation">
                                                <span class="navbar-toggler-icon"/>
                                            </button>
                                            <div class="collapse navbar-collapse"
                                                id="navbarSupportedContent">
                                                <ul class="navbar-nav mr-auto">
                                                  <li class="nav-item">
                                                  <a class="nav-link"
                                                  href="{concat('../../', $pathAccueil)}"
                                                  >Accueil</a>
                                                  </li>
                                                  <li class="nav-item">
                                                  <a class="nav-link"
                                                  href="{concat('../../', $pathAlloNorm)}"
                                                  >Comparaison</a>
                                                  </li>
                                                  <li class="nav-item dropdown">
                                                  <a class="nav-link dropdown-toggle" href="#"
                                                  id="navbarDropdown" role="button"
                                                  data-toggle="dropdown" aria-haspopup="true"
                                                  aria-expanded="false">Edition allographétique</a>
                                                  <div class="dropdown-menu"
                                                  aria-labelledby="navbarDropdown">
                                                  <a class="dropdown-item"
                                                  href="{concat('../../', $pathAllo1)}">f169r</a>
                                                  <a class="dropdown-item"
                                                  href="{concat('../../', $pathAllo2)}">f169v</a>
                                                  </div>
                                                  </li>
                                                  <li class="nav-item dropdown">
                                                  <a class="nav-link dropdown-toggle" href="#"
                                                  id="navbarDropdown" role="button"
                                                  data-toggle="dropdown" aria-haspopup="true"
                                                  aria-expanded="false">Edition normalisée</a>
                                                  <div class="dropdown-menu"
                                                  aria-labelledby="navbarDropdown">
                                                  <a class="dropdown-item"
                                                  href="{concat('../../', $pathNorm1)}">f169r</a>
                                                  <a class="dropdown-item"
                                                  href="{concat('../../', $pathNorm2)}">f169v</a>
                                                  </div>
                                                  </li>
                                                  <li class="nav-item dropdown">
                                                  <a class="nav-link dropdown-toggle" href="#"
                                                  id="navbarDropdown" role="button"
                                                  data-toggle="dropdown" aria-haspopup="true"
                                                  aria-expanded="false">Index</a>
                                                  <div class="dropdown-menu"
                                                  aria-labelledby="navbarDropdown">
                                                  <a class="dropdown-item"
                                                  href="{concat('../../', $pathIndexPers)}"
                                                  >Personnages</a>
                                                  <a class="dropdown-item"
                                                  href="{concat('../../', $pathIndexLieux)}"
                                                  >Lieux</a>
                                                  </div>
                                                  </li>
                                                </ul>
                                            </div>
                                        </nav>

                                        <!-- utilisation des informations de listPerson pour chacun des personnages -->
                                        <div class="row" style="margin-top:20px;">
                                            <div class="col-sm-4">
                                                <h2 style="color:#be122a; font-weight:bold;">
                                                    <!-- indication du premier foreName dont on dispose, qui est systématiquement indiqué, peu importe la langue -->
                                                  <xsl:value-of select="persName/forename[1]/text()"
                                                  />
                                                </h2>
                                                <!-- gestion des noms des personnes en fonction des langues dont on dispose -->
                                                <xsl:if test="persName/forename[@xml:lang = 'lat']">
                                                  <p>Variantes des noms de <xsl:value-of
                                                  select="persName/forename[1]/text()"/>: <ul>
                                                  <li>En français: <ul>
                                                      <!-- indication des variantes de nom en français -->
                                                  <li><xsl:value-of
                                                  select="persName/roleName[@xml:lang = 'fre']/text()"
                                                  /><xsl:text> </xsl:text><xsl:value-of
                                                  select="persName/forename[@xml:lang = 'fre']/text()"
                                                  /></li>
                                                  <xsl:for-each
                                                  select="persName/addName[@xml:lang = 'fre']">
                                                  <li><xsl:value-of select="text()"/></li>
                                                  </xsl:for-each>
                                                  </ul>
                                                  </li>
                                                  <li>En latin: <ul>
                                                  <li><xsl:value-of
                                                  select="persName/roleName[@xml:lang = 'lat']/text()"
                                                  /><xsl:text> </xsl:text><xsl:value-of
                                                  select="persName/forename[@xml:lang = 'lat']/text()"
                                                  /></li>
                                                  </ul>
                                                  </li>
                                                  </ul>
                                                  </p>
                                                </xsl:if>
                                            </div>
                                            <!-- indication des informations de mort et de naissance si elles existent dans la TEI -->
                                            <div class="col-sm-4" style="margin-top:3em;">
                                                <xsl:if test="birth">
                                                  <p>
                                                  <xsl:text>Né en/le </xsl:text>
                                                  <xsl:value-of select="birth/date/@when"/>
                                                  <xsl:text> à </xsl:text>
                                                  <xsl:value-of
                                                  select="birth/placeName/settlement/text()"/>
                                                  <xsl:text> en </xsl:text>
                                                  <xsl:value-of
                                                  select="birth/placeName/country/text()"/>
                                                  </p>
                                                </xsl:if>
                                                <xsl:if test="death">
                                                  <p>
                                                  <xsl:text>Mort en/le </xsl:text>
                                                  <xsl:value-of select="death/date/@when"/>
                                                  <xsl:text> à </xsl:text>
                                                  <xsl:value-of
                                                  select="death/placeName/settlement/text()"/>
                                                  <xsl:text> en </xsl:text>
                                                  <xsl:value-of
                                                  select="death/placeName/country/text()"/>
                                                  </p>
                                                </xsl:if>
                                                <xsl:if test="faith[@type = 'practicing']">
                                                  <p><xsl:value-of
                                                  select="persName/forename[1]/text()"/> est
                                                  pratiquant <xsl:value-of select="faith/text()"/>
                                                  </p>
                                                </xsl:if>
                                                <xsl:if test="faith[@type = 'convert']">
                                                  <p><xsl:value-of
                                                  select="persName/forename[1]/text()"/> est
                                                  <xsl:value-of select="faith/text()"/> converti
                                                  depuis <xsl:value-of select="faith/@when"/></p>
                                                </xsl:if>
                                            </div>
                                            <!-- dans cette colonne se trouvent les activités de chaque personnage, si elles ont été renseignées -->
                                            <div class="col-sm-4" style="margin-top:3em;">
                                                <xsl:if test="occupation">
                                                  <p style="font-weight:bold;">Activités: <ul>
                                                  <xsl:for-each select="occupation">
                                                  <li><xsl:value-of select="text()"/>
                                                  <xsl:if test="@from">
                                                  <xsl:text> à partir de </xsl:text><xsl:value-of
                                                  select="@from"/>
                                                  </xsl:if>
                                                  <xsl:if test="@to">
                                                  <xsl:text> jusqu'en </xsl:text><xsl:value-of
                                                  select="@to"/>
                                                  </xsl:if>
                                                  </li>
                                                  </xsl:for-each>
                                                  </ul>
                                                  </p>
                                                </xsl:if>
                                            </div>
                                        </div>

                                        <!-- si une description existe dans la TEI, elle est insérée ici, avec le lien vers la source (Wikipédia)-->
                                        <div class="row">
                                            <xsl:if test="note/@source">
                                                <h5 style="color:#be122a;">Une courte description
                                                  tirée de <a href="{note/@source}"
                                                  >Wikipédia</a></h5>
                                                <xsl:value-of select="note/text()"/>
                                            </xsl:if>
                                        </div>

                                        <!-- gestion des lieux de résidence, s'ils existent -->
                                        <xsl:if test="residence">
                                            <div class="row" style="margin-top:20px;">
                                                <div class="row">
                                                  <h5 style="color:#be122a;">Lieux de résidence de
                                                  <xsl:value-of select="persName/forename[1]/text()"
                                                  /></h5>
                                                </div>
                                                <div class="row">
                                                  <xsl:for-each select="residence">
                                                  <div class="card" style="width: 14rem;">
                                                  <div class="card-body">
                                                  <h5 class="card-title">
                                                  <xsl:value-of select="placeName/settlement/text()"/>
                                                  <xsl:if test="placeName/country">
                                                  <xsl:text> en </xsl:text>
                                                  <xsl:value-of select="placeName/country/text()"/>
                                                  </xsl:if>
                                                  </h5>
                                                  <h6 class="card-subtitle mb-2 text-muted">
                                                  <xsl:if test="@type = 'primary'">
                                                  <xsl:text>Résidence principale de </xsl:text>
                                                  <xsl:value-of select="@from"/>
                                                  <xsl:text> à </xsl:text>
                                                  <xsl:value-of select="@to"/>
                                                  </xsl:if>
                                                  <xsl:if test="@type = 'temporary'">
                                                  <xsl:text>Résidence temporaire de </xsl:text>
                                                  <xsl:value-of select="@notBefore | @from"/>
                                                  <xsl:text> à </xsl:text>
                                                  <xsl:value-of select="@notAfter | @to"/>
                                                  </xsl:if>
                                                  <xsl:if test="@type = 'secondary'">
                                                  <xsl:text>Résidence secondaire de </xsl:text>
                                                  <xsl:value-of select="@from"/>
                                                  <xsl:text> à </xsl:text>
                                                  <xsl:value-of select="@to"/>
                                                  </xsl:if>
                                                  </h6>
                                                  <p/>
                                                  </div>
                                                  </div>
                                                  </xsl:for-each>
                                                </div>
                                            </div>
                                        </xsl:if>
                                        
                                        <!-- utilitaires Bootstrap -->
                                        <script src="../../static/js/jquery-3.4.1.slim.min.js"/>
                                        <script src="../../static/js/popper.min.js"/>
                                        <script src="../../static/js/bootstrap.min.js"/>
                                    </body>
                                </html>
                            </xsl:result-document>

                            <!-- ensuite, création de cartes de personnes, dans le xsl:for-each, renvoyant vers les pages individuelles -->
                            <div class="card" style="width: 14rem;">
                                <div class="card-body">
                                    <h5 class="card-title">
                                        <xsl:value-of select="persName/forename[1]/text()"/>
                                    </h5>
                                    <h6 class="card-subtitle mb-2 text-muted">
                                        <xsl:choose>
                                            <xsl:when test="persName/roleName[@xml:lang = 'fre']">
                                                <xsl:value-of
                                                  select="persName/roleName[@xml:lang = 'fre']/text()"/>
                                                <xsl:text> </xsl:text>
                                                <xsl:value-of
                                                  select="persName/forename[@xml:lang = 'fre']/text()"/>
                                                <xsl:text> </xsl:text>
                                                <xsl:value-of
                                                  select="persName/addName[@xml:lang = 'fre']/text()"
                                                />
                                            </xsl:when>
                                            <xsl:when test="birth/placeName/settlement">
                                                <xsl:value-of
                                                  select="birth/placeName/settlement/text()"/>
                                            </xsl:when>
                                            <xsl:when test="occupation">
                                                <xsl:value-of select="occupation/text()"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="note/text()"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </h6>
                                    <xsl:if test="birth">
                                        <p>
                                            <xsl:text>Né en/le </xsl:text>
                                            <xsl:value-of select="birth/date/@when"/>
                                            <xsl:text> à </xsl:text>
                                            <xsl:value-of select="birth/placeName/settlement/text()"/>
                                            <xsl:text> en </xsl:text>
                                            <xsl:value-of select="birth/placeName/country/text()"/>
                                        </p>
                                    </xsl:if>
                                    <xsl:if test="death">
                                        <p>
                                            <xsl:text>Mort en/le </xsl:text>
                                            <xsl:value-of select="death/date/@when"/>
                                            <xsl:text> à </xsl:text>
                                            <xsl:value-of select="death/placeName/settlement/text()"/>
                                            <xsl:text> en </xsl:text>
                                            <xsl:value-of select="death/placeName/country/text()"/>
                                        </p>
                                    </xsl:if>
                                    <a href="{$pathPersonne}" class="card-link">Voir la fiche</a>
                                    <xsl:if test="persName/@ref">
                                        <a href="{persName/@ref}" class="card-link">Wikipédia</a>
                                    </xsl:if>
                                </div>
                            </div>
                        </xsl:for-each>
                    </div>

                    <!-- utilitaires Bootstrap -->
                    <script src="../static/js/jquery-3.4.1.slim.min.js"/>
                    <script src="../static/js/popper.min.js"/>
                    <script src="../static/js/bootstrap.min.js"/>
                    <script src="../static/js/fontawesome.js"/>
                </body>
                <footer class="blog-footer">
                    <div class="container" style="padding: 1em; text-align: center">
                        <p>© <a href="https://www.chartes.psl.eu">Ecole nationale des Chartes</a> -
                            Maxime Challon</p>
                    </div>
                </footer>
            </html>
        </xsl:result-document>

        <!-- page des lieux -->
        <xsl:result-document href="{$pathIndexLieux}" method="html" indent="yes">
            <html>
                <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                    <link rel="stylesheet" href="../static/css/bootstrap.min.css"/>
                    <link rel="stylesheet" href="../static/css/css.css"/>
                    <title>
                        <xsl:value-of select="//titleStmt/title[1]"/>
                    </title>
                </head>
                <body class="container">

                    <!-- menu de navigation -->
                    <nav class="navbar navbar-expand-lg navbar-light bg-light">
                        <a class="navbar-brand" href="{//titleStmt/title[1]}"
                            style="color: #be122a;font-weight:bold;">
                            <xsl:value-of select="//titleStmt/title[1]"/>
                        </a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse"
                            data-target="#navbarSupportedContent"
                            aria-controls="navbarSupportedContent" aria-expanded="false"
                            aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"/>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav mr-auto">
                                <li class="nav-item">
                                    <a class="nav-link" href="{concat('../', $pathAccueil)}"
                                        >Accueil</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="{concat('../', $pathAlloNorm)}"
                                        >Comparaison</a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                                        role="button" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false">Edition allographétique</a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="{concat('../', $pathAllo1)}"
                                            >f169r</a>
                                        <a class="dropdown-item" href="{concat('../', $pathAllo2)}"
                                            >f169v</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                                        role="button" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false">Edition normalisée</a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="{concat('../', $pathNorm1)}"
                                            >f169r</a>
                                        <a class="dropdown-item" href="{concat('../', $pathNorm2)}"
                                            >f169v</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                                        role="button" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false">Index</a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item"
                                            href="{concat('../', $pathIndexPers)}">Personnages</a>
                                        <a class="dropdown-item"
                                            href="{concat('../', $pathIndexLieux)}">Lieux</a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </nav>

                    <div class="row" style="color: #be122a;text-align: center;">
                        <h1>Index des lieux des folios 169r et 169v</h1>
                    </div>
                    <div class="row">
                        <xsl:for-each select="//place">
                            <div class="card" style="width: 18rem;">
                                <div class="card-body">
                                    <h5 class="card-title">
                                        <xsl:value-of
                                            select="placeName/settlement/text() | placeName/addName/text()"
                                        />
                                    </h5>
                                    <xsl:if test="placeName[contains(@ref, 'wikipedia')]">
                                        <a href="{placeName/@ref}" class="card-link">Wikipédia</a>
                                    </xsl:if>
                                </div>
                            </div>
                        </xsl:for-each>
                    </div>

                    <!-- utilitaires Bootstrap -->
                    <script src="../static/js/jquery-3.4.1.slim.min.js"/>
                    <script src="../static/js/popper.min.js"/>
                    <script src="../static/js/bootstrap.min.js"/>
                    <script src="../static/js/fontawesome.js"/>
                </body>
                <footer class="blog-footer">
                    <div class="container" style="padding: 1em; text-align: center">
                        <p>© <a href="https://www.chartes.psl.eu">Ecole nationale des Chartes</a> -
                            Maxime Challon</p>
                    </div>
                </footer>
            </html>
        </xsl:result-document>

        <!-- page de comparaison entre les deux textes -->
        <xsl:result-document href="{$pathAlloNorm}" method="html" indent="yes">
            <html>
                <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                    <link rel="stylesheet" href="../static/css/bootstrap.min.css"/>
                    <link rel="stylesheet" href="../static/css/css.css"/>
                    <title>
                        <xsl:value-of select="//titleStmt/title[1]"/>
                    </title>
                </head>
                <body class="container">

                    <!-- menu de navigation -->
                    <nav class="navbar navbar-expand-lg navbar-light bg-light">
                        <a class="navbar-brand" href="{//titleStmt/title[1]}"
                            style="color: #be122a;font-weight:bold;">
                            <xsl:value-of select="//titleStmt/title[1]"/>
                        </a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse"
                            data-target="#navbarSupportedContent"
                            aria-controls="navbarSupportedContent" aria-expanded="false"
                            aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"/>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav mr-auto">
                                <li class="nav-item">
                                    <a class="nav-link" href="{concat('../', $pathAccueil)}"
                                        >Accueil</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="{concat('../', $pathAlloNorm)}"
                                        >Comparaison</a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                                        role="button" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false">Edition allographétique</a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="{concat('../', $pathAllo1)}"
                                            >f169r</a>
                                        <a class="dropdown-item" href="{concat('../', $pathAllo2)}"
                                            >f169v</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                                        role="button" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false">Edition normalisée</a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="{concat('../', $pathNorm1)}"
                                            >f169r</a>
                                        <a class="dropdown-item" href="{concat('../', $pathNorm2)}"
                                            >f169v</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                                        role="button" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false">Index</a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item"
                                            href="{concat('../', $pathIndexPers)}">Personnages</a>
                                        <a class="dropdown-item"
                                            href="{concat('../', $pathIndexLieux)}">Lieux</a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </nav>

                    <div class="row">
                        <div class="col-sm-6">
                            <!-- le h2 permet de récupérer les noms des folios transcrits et de mettre un lien vers son image Gallica -->
                            <h2 style="color: #be122a;text-align: right;">Transcription facsimilaire
                                des folios <xsl:for-each select="//div[@type = 'folio']">
                                    <xsl:variable name="foliosN">
                                        <xsl:value-of select="replace(@facs, '#', '')"/>
                                    </xsl:variable>
                                    <a
                                        href="{ancestor::TEI//surface[@xml:id=$foliosN]/graphic/@url}">
                                        <xsl:value-of select="@n"/>
                                    </a>
                                    <xsl:text> </xsl:text>
                                </xsl:for-each>
                            </h2>
                            <!-- pour la transcription facsimilaire, c'est le mode orig qui s'applique (voir les règles en bas de l'XSL) -->
                            <div class="col-sm-12" style="text-align: right;">
                                <p>
                                    <xsl:apply-templates select="//text" mode="orig"/>
                                </p>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <h2 style="color: #be122a;">Transcription normalisée des folios
                                    <xsl:for-each select="//div[@type = 'folio']">
                                    <xsl:variable name="foliosN">
                                        <xsl:value-of select="replace(@facs, '#', '')"/>
                                    </xsl:variable>
                                    <a
                                        href="{ancestor::TEI//surface[@xml:id=$foliosN]/graphic/@url}">
                                        <xsl:value-of select="@n"/>
                                    </a>
                                    <xsl:text> </xsl:text>
                                    </xsl:for-each></h2>
                            <!-- pour la transcription normalisée, c'est le mode reg qui s'applique (voir les règles en bas de l'XSL) -->
                            <p>
                                <xsl:apply-templates select="//text" mode="reg"/>
                            </p>
                        </div>
                    </div>
                    <!-- utilitaires Bootstrap -->
                    <script src="../static/js/jquery-3.4.1.slim.min.js"/>
                    <script src="../static/js/popper.min.js"/>
                    <script src="../static/js/bootstrap.min.js"/>
                </body>
                <footer class="blog-footer">
                    <div class="container" style="padding: 1em; text-align: center">
                        <p>© <a href="https://www.chartes.psl.eu">Ecole nationale des Chartes</a> -
                            Maxime Challon</p>
                    </div>
                </footer>
            </html>
        </xsl:result-document>

        <!-- page de présentation de l'édition allographétique du f.169r -->
        <xsl:result-document href="{$pathAllo1}" method="html" indent="yes">
            <html>
                <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                    <link rel="stylesheet" href="../static/css/bootstrap.min.css"/>
                    <link rel="stylesheet" href="../static/css/css.css"/>
                    <title>
                        <xsl:value-of select="//titleStmt/title[1]"/>
                    </title>
                </head>
                <body class="container page_img">

                    <!-- barre de navigation -->
                    <nav class="navbar navbar-expand-lg navbar-light bg-light">
                        <a class="navbar-brand" href="{//titleStmt/title[1]}"
                            style="color: #be122a;font-weight:bold;">
                            <xsl:value-of select="//titleStmt/title[1]"/>
                        </a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse"
                            data-target="#navbarSupportedContent"
                            aria-controls="navbarSupportedContent" aria-expanded="false"
                            aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"/>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav mr-auto">
                                <li class="nav-item">
                                    <a class="nav-link" href="{concat('../', $pathAccueil)}"
                                        >Accueil</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="{concat('../', $pathAlloNorm)}"
                                        >Comparaison</a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                                        role="button" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false">Edition allographétique</a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="{concat('../', $pathAllo1)}"
                                            >f169r</a>
                                        <a class="dropdown-item" href="{concat('../', $pathAllo2)}"
                                            >f169v</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                                        role="button" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false">Edition normalisée</a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="{concat('../', $pathNorm1)}"
                                            >f169r</a>
                                        <a class="dropdown-item" href="{concat('../', $pathNorm2)}"
                                            >f169v</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                                        role="button" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false">Index</a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item"
                                            href="{concat('../', $pathIndexPers)}">Personnages</a>
                                        <a class="dropdown-item"
                                            href="{concat('../', $pathIndexLieux)}">Lieux</a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </nav>

                    <div class="row">
                        <h2 style="color:#be122a; margin-top:20px;">Edition allographétique
                            numérique du feuillet 169r</h2>
                    </div>

                    <div class="row">
                        <div class="col-sm-8">
                            <!-- image interactive inspirée d'après un bout de code javascript trouvé sur le site de l'Ecole des Chartes -->
                            <!-- les explications qui suivent sont valables pour $pathAllo1, $pathAllo2, $pathNorm1 et $pathNorm2 -->
                            <img usemap="#mapfax.jpg" src="../static/img/f174_demi.jpg" border="0"
                                style="width: 800px;height: auto;"/>
                            <map name="mapfax.jpg">
                                <!-- le but de cette balise map est de pouvoir présenter une image interactive basée sur les coordonnées stockées dans la TEI et la transcription liée à ces coordonnées -->
                                <xsl:for-each select="//div[@n = '169r']//seg">
                                    <!-- récupération de chaque l'id de chaque segment dans la varibale idSeg, pour pouvoir le faire correspondre avec son facsimile -->
                                    <xsl:variable name="idSeg">
                                        <xsl:value-of select="replace(@facs, '#', '')"/>
                                    </xsl:variable>
                                    <!-- récupération du texte à insérer dans la variable texte, dans le popup javascript -->
                                    <xsl:variable name="texte">
                                        <xsl:apply-templates select="." mode="orig"/>
                                    </xsl:variable>
                                    <!-- création des variables de chaque coordonnée qui est à calculer en focntion de la taille de l'image dans la page html -->
                                    <!-- l'image affichée dans le HTML n'est que la moitié de celle IIIF téléchargée sur Gallica. Or l'encodage TEI a été réalisé avec -->
                                    <!-- l'image entière: pour l'axe x, on retire 4341px (ce qui a été rogné de la photo originale) des <zone ulx lrx>.  -->
                                    <!-- pour les abscisses: 800 est le nombre de pixels de l'image finale dans le html -->
                                    <!-- (ancestor::TEI//zone[@xml:id=$idSeg]/@ulx - 4341) est l'abscisse gauche du rectangle recalculée en fonction de la partie rognée  -->
                                    <!-- la division par 4341 est la largeur de la photo rognée nécessaire au produit en croix -->
                                    <xsl:variable name="ulx">
                                        <xsl:value-of
                                            select="800 * (ancestor::TEI//zone[@xml:id = $idSeg]/@ulx - 4341) div 4341"
                                        />
                                    </xsl:variable>
                                    <!-- pour les ordonnées: 800 est le nombre de pixels de l'image finale dans le html -->
                                    <!-- ancestor::TEI//zone[@xml:id=$idSeg]/@uly est l'orodnnée gauche du rectangle  -->
                                    <!-- la division par 8682 est la hauteur de la photo nécessaire au produit en croix -->
                                    <!-- le *2 final s'explique par le rognage en largeur de la photo -->
                                    <xsl:variable name="uly">
                                        <xsl:value-of
                                            select="800 * ancestor::TEI//zone[@xml:id = $idSeg]/@uly div 8682 * 2"
                                        />
                                    </xsl:variable>
                                    <xsl:variable name="lrx">
                                        <xsl:value-of
                                            select="800 * (ancestor::TEI//zone[@xml:id = $idSeg]/@lrx - 4341) div 4341"
                                        />
                                    </xsl:variable>
                                    <xsl:variable name="lry">
                                        <xsl:value-of
                                            select="800 * ancestor::TEI//zone[@xml:id = $idSeg]/@lry div 8682 * 2"
                                        />
                                    </xsl:variable>

                                    <area shape="rect" coords="{$ulx},{$uly},{$lrx},{$lry}" href="#"
                                        OnMouseOver="AffBulle(' {$texte}',{$ulx})"
                                        OnMouseOut="HideBulle()" OnClick="return false"/>
                                </xsl:for-each>
                            </map>
                            <a href="{concat('../', $pathAllo2)}">Page suivante</a>
                        </div>
                        <div class="col-sm-4" style="padding-left:75px;">
                            <xsl:apply-templates select="//div[@n = '169r']" mode="orig"/>
                        </div>
                    </div>

                    <!-- utilitaires Bootstrap -->
                    <script src="../static/js/jquery-3.4.1.slim.min.js"/>
                    <script src="../static/js/popper.min.js"/>
                    <script src="../static/js/bootstrap.min.js"/>
                    <script src="../static/js/js.js"/>
                </body>
                <footer class="blog-footer">
                    <div class="container" style="padding: 1em; text-align: center">
                        <p>© <a href="https://www.chartes.psl.eu">Ecole nationale des Chartes</a> -
                            Maxime Challon</p>
                    </div>
                </footer>
            </html>
        </xsl:result-document>

        <!-- page de présentation de l'édition allographétique du f169v selon la manière strcuture que $pathAllo1-->
        <xsl:result-document href="{$pathAllo2}" method="html" indent="yes">
            <html>
                <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                    <link rel="stylesheet" href="../static/css/bootstrap.min.css"/>
                    <link rel="stylesheet" href="../static/css/css.css"/>
                    <title>
                        <xsl:value-of select="//titleStmt/title[1]"/>
                    </title>
                </head>
                <body class="container page_img">

                    <nav class="navbar navbar-expand-lg navbar-light bg-light">
                        <a class="navbar-brand" href="{//titleStmt/title[1]}"
                            style="color: #be122a;font-weight:bold;">
                            <xsl:value-of select="//titleStmt/title[1]"/>
                        </a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse"
                            data-target="#navbarSupportedContent"
                            aria-controls="navbarSupportedContent" aria-expanded="false"
                            aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"/>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav mr-auto">
                                <li class="nav-item">
                                    <a class="nav-link" href="{concat('../', $pathAccueil)}"
                                        >Accueil</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="{concat('../', $pathAlloNorm)}"
                                        >Comparaison</a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                                        role="button" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false">Edition allographétique</a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="{concat('../', $pathAllo1)}"
                                            >f169r</a>
                                        <a class="dropdown-item" href="{concat('../', $pathAllo2)}"
                                            >f169v</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                                        role="button" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false">Edition normalisée</a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="{concat('../', $pathNorm1)}"
                                            >f169r</a>
                                        <a class="dropdown-item" href="{concat('../', $pathNorm2)}"
                                            >f169v</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                                        role="button" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false">Index</a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item"
                                            href="{concat('../', $pathIndexPers)}">Personnages</a>
                                        <a class="dropdown-item"
                                            href="{concat('../', $pathIndexLieux)}">Lieux</a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </nav>

                    <div class="row">
                        <h2 style="color:#be122a; margin-top:20px;">Edition allographétique
                            numérique du feuillet 169v</h2>
                    </div>

                    <div class="row">
                        <div class="col-sm-8">
                            <img usemap="#mapfax.jpg" src="../static/img/f175_demi.jpg" border="0"
                                style="width: 800px;height: auto;"/>
                            <map name="mapfax.jpg">
                                <xsl:for-each select="//div[@n = '169v']//seg">
                                    <xsl:variable name="idSeg">
                                        <xsl:value-of select="replace(@facs, '#', '')"/>
                                    </xsl:variable>
                                    <xsl:variable name="texte">
                                        <xsl:apply-templates select="." mode="orig"/>
                                    </xsl:variable>
                                    <xsl:variable name="ulx">
                                        <xsl:value-of
                                            select="800 * ancestor::TEI//zone[@xml:id = $idSeg]/@ulx div 4349"
                                        />
                                    </xsl:variable>
                                    <xsl:variable name="uly">
                                        <xsl:value-of
                                            select="800 * ancestor::TEI//zone[@xml:id = $idSeg]/@uly div 8697 * 2"
                                        />
                                    </xsl:variable>
                                    <xsl:variable name="lrx">
                                        <xsl:value-of
                                            select="800 * ancestor::TEI//zone[@xml:id = $idSeg]/@lrx div 4349"
                                        />
                                    </xsl:variable>
                                    <xsl:variable name="lry">
                                        <xsl:value-of
                                            select="800 * ancestor::TEI//zone[@xml:id = $idSeg]/@lry div 8697 * 2"
                                        />
                                    </xsl:variable>

                                    <area shape="rect" coords="{$ulx},{$uly},{$lrx},{$lry}" href="#"
                                        OnMouseOver="AffBulle(' {$texte}',{$ulx})"
                                        OnMouseOut="HideBulle()" OnClick="return false"/>
                                </xsl:for-each>
                            </map>
                            <a href="{concat('../', $pathAllo1)}">Page précédente</a>
                        </div>
                        <div class="col-sm-4" style="padding-left:75px;">
                            <xsl:apply-templates select="//div[@n = '169v']" mode="orig"/>
                        </div>
                    </div>

                    <!-- utilitaires Bootstrap -->
                    <script src="../static/js/jquery-3.4.1.slim.min.js"/>
                    <script src="../static/js/popper.min.js"/>
                    <script src="../static/js/bootstrap.min.js"/>
                    <script src="../static/js/js.js"/>
                </body>
                <footer class="blog-footer">
                    <div class="container" style="padding: 1em; text-align: center">
                        <p>© <a href="https://www.chartes.psl.eu">Ecole nationale des Chartes</a> -
                            Maxime Challon</p>
                    </div>
                </footer>
            </html>
        </xsl:result-document>

        <!-- page de présentation de l'édition normalisée du f169r, sur la même base que le $pathAllo1, seules les dimensions de l'image peuvent variées -->
        <xsl:result-document href="{$pathNorm1}" method="html" indent="yes">
            <html>
                <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                    <link rel="stylesheet" href="../static/css/bootstrap.min.css"/>
                    <link rel="stylesheet" href="../static/css/css.css"/>
                    <title>
                        <xsl:value-of select="//titleStmt/title[1]"/>
                    </title>
                </head>
                <body class="container page_img">

                    <nav class="navbar navbar-expand-lg navbar-light bg-light">
                        <a class="navbar-brand" href="{//titleStmt/title[1]}"
                            style="color: #be122a;font-weight:bold;">
                            <xsl:value-of select="//titleStmt/title[1]"/>
                        </a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse"
                            data-target="#navbarSupportedContent"
                            aria-controls="navbarSupportedContent" aria-expanded="false"
                            aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"/>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav mr-auto">
                                <li class="nav-item">
                                    <a class="nav-link" href="{concat('../', $pathAccueil)}"
                                        >Accueil</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="{concat('../', $pathAlloNorm)}"
                                        >Comparaison</a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                                        role="button" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false">Edition allographétique</a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="{concat('../', $pathAllo1)}"
                                            >f169r</a>
                                        <a class="dropdown-item" href="{concat('../', $pathAllo2)}"
                                            >f169v</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                                        role="button" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false">Edition normalisée</a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="{concat('../', $pathNorm1)}"
                                            >f169r</a>
                                        <a class="dropdown-item" href="{concat('../', $pathNorm2)}"
                                            >f169v</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                                        role="button" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false">Index</a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item"
                                            href="{concat('../', $pathIndexPers)}">Personnages</a>
                                        <a class="dropdown-item"
                                            href="{concat('../', $pathIndexLieux)}">Lieux</a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </nav>

                    <div class="row">
                        <h2 style="color:#be122a; margin-top:20px;">Edition normalisée numérique du
                            feuillet 169r</h2>
                    </div>

                    <div class="row">
                        <div class="col-sm-8">
                            <img usemap="#mapfax.jpg" src="../static/img/f174_demi.jpg" border="0"
                                style="width: 800px;height: auto;"/>
                            <map name="mapfax.jpg">
                                <xsl:for-each select="//div[@n = '169r']//seg">
                                    <xsl:variable name="idSeg">
                                        <xsl:value-of select="replace(@facs, '#', '')"/>
                                    </xsl:variable>
                                    <xsl:variable name="texte">
                                        <xsl:apply-templates select="." mode="reg"/>
                                    </xsl:variable>
                                    <!-- création des variables de chaque coordonnée qui est à calculer en focntion de la taille de l'image dans la page html -->
                                    <!-- l'image affichée dans le HTML n'est que la moitié de celle IIIF téléchargée sur Gallica. Or l'encodage TEI a été réalisé avec -->
                                    <!-- l'image entière: pour l'axe x, on retire 4341px (ce qui a été rogné de la photo originale) des <zone ulx lrx>.  -->
                                    <!-- pour les abscisses: 800 est le nombre de pixels de l'image finale dans le html -->
                                    <!-- (ancestor::TEI//zone[@xml:id=$idSeg]/@ulx - 4341) est l'abscisse gauche du rectangle recalculée en fonction de la partie rognée  -->
                                    <!-- la division par 4341 est la largeur de la photo rognée nécessaire au produit en croix -->
                                    <xsl:variable name="ulx">
                                        <xsl:value-of
                                            select="800 * (ancestor::TEI//zone[@xml:id = $idSeg]/@ulx - 4341) div 4341"
                                        />
                                    </xsl:variable>
                                    <!-- pour les ordonnées: 800 est le nombre de pixels de l'image finale dans le html -->
                                    <!-- ancestor::TEI//zone[@xml:id=$idSeg]/@uly est l'orodnnée gauche du rectangle  -->
                                    <!-- la division par 8682 est la hauteur de la photo nécessaire au produit en croix -->
                                    <!-- le *2 final s'explique par le rognage en largeur de la photo -->
                                    <xsl:variable name="uly">
                                        <xsl:value-of
                                            select="800 * ancestor::TEI//zone[@xml:id = $idSeg]/@uly div 8682 * 2"
                                        />
                                    </xsl:variable>
                                    <xsl:variable name="lrx">
                                        <xsl:value-of
                                            select="800 * (ancestor::TEI//zone[@xml:id = $idSeg]/@lrx - 4341) div 4341"
                                        />
                                    </xsl:variable>
                                    <xsl:variable name="lry">
                                        <xsl:value-of
                                            select="800 * ancestor::TEI//zone[@xml:id = $idSeg]/@lry div 8682 * 2"
                                        />
                                    </xsl:variable>

                                    <area shape="rect" coords="{$ulx},{$uly},{$lrx},{$lry}" href="#"
                                        OnMouseOver="AffBulle(' {$texte}',{$ulx})"
                                        OnMouseOut="HideBulle()" OnClick="return false"/>
                                </xsl:for-each>
                            </map>

                            <a href="{concat('../', $pathNorm2)}">Page suivante</a>
                        </div>
                        <div class="col-sm-4" style="padding-left:75px;">
                            <xsl:apply-templates select="//div[@n = '169r']" mode="reg"/>
                        </div>
                    </div>

                    <!-- utilitaires Bootstrap -->
                    <script src="../static/js/jquery-3.4.1.slim.min.js"/>
                    <script src="../static/js/popper.min.js"/>
                    <script src="../static/js/bootstrap.min.js"/>
                    <script src="../static/js/js.js"/>
                </body>
                <footer class="blog-footer">
                    <div class="container" style="padding: 1em; text-align: center">
                        <p>© <a href="https://www.chartes.psl.eu">Ecole nationale des Chartes</a> -
                            Maxime Challon</p>
                    </div>
                </footer>
            </html>
        </xsl:result-document>

        <!-- page de présentation de l'édition normalisée du f169r, selon les mêmes principes que le $athNorm2 -->
        <xsl:result-document href="{$pathNorm2}" method="html" indent="yes">
            <html>
                <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                    <link rel="stylesheet" href="../static/css/bootstrap.min.css"/>
                    <link rel="stylesheet" href="../static/css/css.css"/>
                    <title>
                        <xsl:value-of select="//titleStmt/title[1]"/>
                    </title>
                </head>
                <body class="container page_img">

                    <nav class="navbar navbar-expand-lg navbar-light bg-light">
                        <a class="navbar-brand" href="{//titleStmt/title[1]}"
                            style="color: #be122a;font-weight:bold;">
                            <xsl:value-of select="//titleStmt/title[1]"/>
                        </a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse"
                            data-target="#navbarSupportedContent"
                            aria-controls="navbarSupportedContent" aria-expanded="false"
                            aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"/>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav mr-auto">
                                <li class="nav-item">
                                    <a class="nav-link" href="{concat('../', $pathAccueil)}"
                                        >Accueil</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="{concat('../', $pathAlloNorm)}"
                                        >Comparaison</a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                                        role="button" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false">Edition allographétique</a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="{concat('../', $pathAllo1)}"
                                            >f169r</a>
                                        <a class="dropdown-item" href="{concat('../', $pathAllo2)}"
                                            >f169v</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                                        role="button" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false">Edition normalisée</a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="{concat('../', $pathNorm1)}"
                                            >f169r</a>
                                        <a class="dropdown-item" href="{concat('../', $pathNorm2)}"
                                            >f169v</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                                        role="button" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false">Index</a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item"
                                            href="{concat('../', $pathIndexPers)}">Personnages</a>
                                        <a class="dropdown-item"
                                            href="{concat('../', $pathIndexLieux)}">Lieux</a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </nav>

                    <div class="row">
                        <h2 style="color:#be122a; margin-top:20px;">Edition normalisée numérique du
                            feuillet 169v</h2>
                    </div>

                    <div class="row">
                        <div class="col-sm-8">
                            <img usemap="#mapfax.jpg" src="../static/img/f175_demi.jpg" border="0"
                                style="width: 800px;height: auto;"/>
                            <map name="mapfax.jpg">
                                <xsl:for-each select="//div[@n = '169v']//seg">
                                    <xsl:variable name="idSeg">
                                        <xsl:value-of select="replace(@facs, '#', '')"/>
                                    </xsl:variable>
                                    <xsl:variable name="texte">
                                        <xsl:apply-templates select="." mode="reg"/>
                                    </xsl:variable>
                                    <xsl:variable name="ulx">
                                        <xsl:value-of
                                            select="800 * ancestor::TEI//zone[@xml:id = $idSeg]/@ulx div 4349"
                                        />
                                    </xsl:variable>
                                    <xsl:variable name="uly">
                                        <xsl:value-of
                                            select="800 * ancestor::TEI//zone[@xml:id = $idSeg]/@uly div 8697 * 2"
                                        />
                                    </xsl:variable>
                                    <xsl:variable name="lrx">
                                        <xsl:value-of
                                            select="800 * ancestor::TEI//zone[@xml:id = $idSeg]/@lrx div 4349"
                                        />
                                    </xsl:variable>
                                    <xsl:variable name="lry">
                                        <xsl:value-of
                                            select="800 * ancestor::TEI//zone[@xml:id = $idSeg]/@lry div 8697 * 2"
                                        />
                                    </xsl:variable>

                                    <area shape="rect" coords="{$ulx},{$uly},{$lrx},{$lry}" href="#"
                                        OnMouseOver="AffBulle(' {$texte}',{$ulx})"
                                        OnMouseOut="HideBulle()" OnClick="return false"/>
                                </xsl:for-each>
                            </map>
                            <a href="{concat('../', $pathNorm1)}">Page précédente</a>
                        </div>
                        <div class="col-sm-4" style="padding-left:75px;">
                            <xsl:apply-templates select="//div[@n = '169v']" mode="reg"/>
                        </div>
                    </div>

                    <!-- utilitaires Bootstrap -->
                    <script src="../static/js/jquery-3.4.1.slim.min.js"/>
                    <script src="../static/js/popper.min.js"/>
                    <script src="../static/js/bootstrap.min.js"/>
                    <script src="../static/js/js.js"/>
                </body>
                <footer class="blog-footer">
                    <div class="container" style="padding: 1em; text-align: center">
                        <p>© <a href="https://www.chartes.psl.eu">Ecole nationale des Chartes</a> -
                            Maxime Challon</p>
                    </div>
                </footer>
            </html>
        </xsl:result-document>

    </xsl:template>


    <!-- dans les templates qui suivent, je traite les différences entre les orig et les reg -->
    
    <!-- gestion de la partie originale -->
    <!-- les seg représentent une ligne du manuscrit chacun, je les remplace donc par des sauts de ligne dans le HTML -->
    <xsl:template match="seg" mode="orig">
        <xsl:element name="br"/>
        <xsl:apply-templates mode="orig"/>
    </xsl:template>

    <!-- pour récupérer le texte original, je conserve les orig et abbrev dans les balises choice -->
    <xsl:template match="choice" mode="orig">
        <xsl:value-of
            select="
                .//orig/text() |
                .//abbr/text() |
                .//orig/hi/text()"
        />
    </xsl:template>

    <!--  pour que les liens hypertextes fonctionnent, que ce soit en mode orig ou reg, il faut récupérer l'id du personnage dans le TEI header-->
    <xsl:template match="body//persName" mode="orig">
        <xsl:variable name="refPers">
            <xsl:value-of select="replace(@ref, '#', '')"/>
        </xsl:variable>
        <xsl:variable name="nomPers">
            <xsl:value-of
                select="ancestor::TEI//person[@xml:id = $refPers]/persName/forename[1]/text()"/>
        </xsl:variable>
        <a href="{concat('personnages/', $nomPers)}.html">
            <xsl:text> </xsl:text>
            <xsl:value-of select="./text() | .//orig/text() | .//abbr/text() | .//orig/hi/text()"/>
            <xsl:text> </xsl:text>
        </a>
    </xsl:template>


    <!-- les vers en mode orig-->
    <!-- les lg deviennent une liste HTML -->
    <xsl:template match="lg" mode="orig">
        <xsl:element name="ul">
            <xsl:apply-templates mode="orig"/>
        </xsl:element>
    </xsl:template>

    <!-- récupération de l'original de chaque vers -->
    <xsl:template match="l" mode="orig">
        <li>
            <xsl:value-of
                select="seg//hi//text() | seg//choice/orig/text() | seg//orig//text() | seg/text()"
            />
        </li>
    </xsl:template>

    <!-- gestion de la partie régularisée -->
    <xsl:template match="seg" mode="reg">
        <xsl:element name="br"/>
        <xsl:apply-templates mode="reg"/>
    </xsl:template>

    <!-- rétablissement de la ponctuation -->
    <xsl:template match="reg[@type = 'ponctuation']" mode="reg">
        <xsl:value-of select="./text() | ./pc/text()"/>
    </xsl:template>

    <!-- récupération de la graphie normalisée dans les balises choice -->
    <xsl:template match="choice" mode="reg">
        <xsl:value-of select="
                .//reg/text() |
                .//expan//text()"/>
    </xsl:template>

    <!-- gestion des liens hypertextes -->
    <xsl:template match="body//persName" mode="reg">
        <xsl:variable name="refPers">
            <xsl:value-of select="replace(@ref, '#', '')"/>
        </xsl:variable>
        <xsl:variable name="nomPers">
            <xsl:value-of
                select="ancestor::TEI//person[@xml:id = $refPers]/persName/forename[1]/text()"/>
        </xsl:variable>
        <a href="{concat('personnages/', $nomPers)}.html">
            <xsl:text> </xsl:text>
            <xsl:value-of select="./text() | .//reg/text() | .//expan/text() | .//reg/hi/text()"/>
            <xsl:text> </xsl:text>
        </a>
    </xsl:template>

    <!-- les vers en mode reg-->
    <xsl:template match="lg" mode="reg">
        <xsl:element name="ul">
            <xsl:apply-templates mode="reg"/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="l" mode="reg">
        <li>
            <xsl:value-of select="seg/hi/hi/text() | seg//reg//text() | seg/text()"/>
        </li>
    </xsl:template>


</xsl:stylesheet>