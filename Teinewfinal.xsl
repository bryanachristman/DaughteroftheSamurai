<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="tei" version="2.0">

    <xsl:output method="html" indent="yes" encoding="iso-8859-1" omit-xml-declaration="yes"/>

    <!-- "DINNER PARTY MENU" TEMPLATE. -->

    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="teifinal.css"/>
                <title>A Daughter of the Samurai</title>
            </head>
            <body> <h1>A DAUGHTER OF THE SAMURAI by Etsu Inagaki Sugimoto</h1> <p> Right click to
                download the source files: <a href="TeiFinal.xml">XML</a>, <a href="Teinewfinal.xsl"
                >XSLT</a>, and <a href="teifinal.css">CSS</a>.</p> <xsl:apply-templates/> <a
                rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img
                alt="Creative Commons License" style="border-width:0"
                src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png"/></a><br/>This work is
                licensed under a <a rel="license"
                href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons
                Attribution-NonCommercial-ShareAlike 4.0 International License</a>. </body>
        </html>
    </xsl:template>


    <!-- "FOOD PREP/MISE EN PLACE" TEMPLATES -->


    <xsl:template match="tei:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>


    <xsl:template match="tei:teiHeader"/>

    <!-- NOTICE THAT THIS ONE IS EMPTY. WE WILL TALK ABOUT WHAT THAT DOES.-->

    <xsl:template match="tei:hi">
        <b>
            <xsl:apply-templates/>
        </b>
    </xsl:template>

    <xsl:template match="tei:head">
        <h2>
            <xsl:apply-templates/>
        </h2>
    </xsl:template>

    <xsl:template match="tei:emph">
        <em>
            <xsl:apply-templates/>
        </em>
    </xsl:template>

    <xsl:template match="tei:lg">
        <div>
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="tei:pb">
        <pb>
            <xsl:apply-templates/>
        </pb>
    </xsl:template>

    <xsl:template match="tei:l">
        <xsl:apply-templates/>
        <br/>
    </xsl:template>

    <xsl:template match="tei:person">
        <xsl:element name="a">
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
        </xsl:element>
        <h3>
            <xsl:apply-templates select="tei:persName"/>
        </h3>
        <p>Occupation: <xsl:apply-templates select="tei:occupation"/></p>
        <xsl:for-each select="tei:note">
            <p>
                <xsl:apply-templates/>
            </p>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="tei:place">
        <xsl:element name="a">
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
        </xsl:element>
        <xsl:apply-templates select="tei:placeName"/>
        <p>Country: <xsl:apply-templates select="tei:location/tei:country"/></p>
        <p>Settlement:<xsl:apply-templates select="tei:location/tei:settlement"/></p>
        <p>Geo:<xsl:apply-templates select="tei:location/tei:geo"/></p>
        <xsl:for-each select="tei:note">
            <p>
                <xsl:apply-templates/>
            </p>
        </xsl:for-each>
    </xsl:template>


    <xsl:template match="tei:annotation">
        <xsl:element name="a">
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
        </xsl:element>
        <xsl:apply-templates select="tei:annotation"/>
        <xsl:for-each select="tei:note">
            <p>
                <xsl:apply-templates/>
            </p>
        </xsl:for-each>
    </xsl:template>


    <xsl:template match="tei:ref">
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="@target"/>
            </xsl:attribute>
        </xsl:element>
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="tei:title">
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="@ref"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:placeName">
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="@ref"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:persName">
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="@ref"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>




</xsl:stylesheet>
