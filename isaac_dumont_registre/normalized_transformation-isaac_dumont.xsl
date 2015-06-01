<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet
  xmlns:tei="http://www.tei-c.org/ns/1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  >

  <xsl:output
    encoding="UTF-8" indent="yes" method="html"
    doctype-public="-//W3C//DTD HTML 4.01//EN"
    doctype-system="http://www.w3.org/TR/html4/strict.dtd"
    />

   <xsl:template match="/">
     <html>
      <head>
        <!-- Registre - Jean Maillefer -->
      </head>
      <body>
        <xsl:apply-templates/>
      </body>
     </html>
  </xsl:template>

  <xsl:template match="tei:lb">
    <br/>
  </xsl:template>

  <xsl:template match="tei:milestone[@style='horizontal_line']">
    <hr/>
  </xsl:template>

  <xsl:template match="tei:c[@rend='super']">
    <sup>
      <xsl:apply-templates/>
    </sup>
  </xsl:template>

  <xsl:template match="tei:unclear">
    <xsl:text>[</xsl:text>
      <xsl:apply-templates/>
    <xsl:text>]</xsl:text>
  </xsl:template>

  <xsl:template match="tei:add">
    <i>
      <text>
        <xsl:attribute name="class">
          "add-transcription"
        </xsl:attribute>
        <xsl:apply-templates/>
      </text>
    </i>
  </xsl:template>

  <xsl:template match="tei:choice">
    <a href="#">
      <xsl:attribute name="title">
        <xsl:value-of select="tei:expan"/>
      </xsl:attribute>
      <xsl:apply-templates select="tei:abbr"/>
    </a>
  </xsl:template>

  <xsl:template match="tei:add">
    <i>
      <text>
        <xsl:apply-templates/>
      </text>
    </i>
  </xsl:template>

  <xsl:template match="tei:pb">
    <br/>
    <i>
      <b>
        <xsl:text>Page range: </xsl:text>
        <xsl:value-of select="@n"/>
        <!-- rajouter 1 type="f. ou p." sur le 1er pb -->
      </b>
    </i>
  </xsl:template>

</xsl:stylesheet>
