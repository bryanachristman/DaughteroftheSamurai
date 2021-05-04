<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="tei" version="2.0">

    <xsl:output method="html" indent="yes" encoding="iso-8859-1" omit-xml-declaration="yes"/>

    <!-- "DINNER PARTY MENU" TEMPLATE. -->

    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="Samurai.css"/>
            </head>
            <body>
                <h1>A DAUGHTER OF THE SAMURAI by Etsu Inagaki Sugimoto</h1>
                <p>Right click to download the source files: <a href="Samurai.xml">XML</a>, <a
                        href="Samurai.xsl">XSLT</a>, and <a href="Samurai.css">CSS</a>.</p>
                <xsl:apply-templates/>
                <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img
                        alt="Creative Commons License" style="border-width:0"
                        src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png"/></a><br/>This
                work is licensed under a <a rel="license"
                    href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons
                    Attribution-NonCommercial-ShareAlike 4.0 International License</a>. <title>A
                    Daughter of the Samurai</title>
            </body>
        </html>
    </xsl:template>



    <!-- "FOOD PREP/MISE EN PLACE" TEMPLATES -->

    <xsl:template match="tei:teiHeader"/>

    <xsl:template match="tei:div">
        <div>
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="tei:head">
        <hr/>
        <h2>
            <xsl:apply-templates/>
        </h2>
    </xsl:template>

    <xsl:template match="tei:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="tei:quote">
        <blockquote>
            <xsl:apply-templates/>
        </blockquote>
    </xsl:template>

    <xsl:template match="tei:hi">
        <em>
            <xsl:apply-templates/>
        </em>
    </xsl:template>

    <xsl:template match="tei:ref">
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="@target"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:term">
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

    <xsl:template match="tei:author">
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="@ref"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
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


    <xsl:template match="tei:standOff">
        <hr/>
        <h3>NOTES</h3>
        <hr/>
        <xsl:for-each select="tei:listAnnotation">
            <xsl:for-each select="tei:note">
                <xsl:element name="a">
                    <xsl:attribute name="id">
                        <xsl:value-of select="@xml:id"/>
                    </xsl:attribute>
                </xsl:element>
                <p>
                    <xsl:apply-templates/>
                </p>
            </xsl:for-each>
        </xsl:for-each>

        <xsl:for-each select="tei:listPlace">
            <hr/>
            <h3>PLACES</h3>
            <hr/>
            <xsl:for-each select="tei:place">
                <xsl:element name="a">
                    <xsl:attribute name="id">
                        <xsl:value-of select="@xml:id"/>
                    </xsl:attribute>
                </xsl:element>
                <xsl:for-each select="tei:placeName">
                    <h4>
                        <xsl:apply-templates/>
                    </h4>
                </xsl:for-each>
                <p>
                    <xsl:apply-templates select="tei:note"/>
                </p>
            </xsl:for-each>
        </xsl:for-each>

        <xsl:for-each select="tei:listBibl">
            <hr/>
            <h3>LITERARY WORKS</h3>
            <hr/>
            <xsl:for-each select="tei:bibl">
                <xsl:element name="a">
                    <xsl:attribute name="id">
                        <xsl:value-of select="@xml:id"/>
                    </xsl:attribute>
                </xsl:element>
                <xsl:for-each select="tei:title">
                    <h4>
                        <xsl:apply-templates/>
                    </h4>
                </xsl:for-each>
                <p><b>Author</b>: <xsl:apply-templates select="tei:author"/></p>
                <p><b>Date</b>: <xsl:apply-templates select="tei:date"/></p>
                <xsl:for-each select="tei:note">
                    <p>
                        <xsl:apply-templates/>
                    </p>
                </xsl:for-each>
            </xsl:for-each>
        </xsl:for-each>


        <xsl:for-each select="tei:listPerson">
            <hr/>
            <h3>PEOPLE</h3>
            <hr/>
            <xsl:for-each select="tei:person">
                <xsl:element name="a">
                    <xsl:attribute name="id">
                        <xsl:value-of select="@xml:id"/>
                    </xsl:attribute>
                </xsl:element>
                <h4><xsl:for-each select="tei:persName">
                        <xsl:apply-templates/>
                    </xsl:for-each> (<xsl:apply-templates select="tei:birth"/>-<xsl:apply-templates
                        select="tei:death"/>)</h4>
                <xsl:for-each select="tei:note">
                    <p>
                        <xsl:apply-templates/>
                    </p>
                </xsl:for-each>
            </xsl:for-each>
        </xsl:for-each>
        <hr/>
    </xsl:template>








    <!--"RECIPE" TEMPLATES-->



</xsl:stylesheet>
