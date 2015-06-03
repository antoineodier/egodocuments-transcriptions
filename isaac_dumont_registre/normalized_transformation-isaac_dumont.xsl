<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet
  xmlns:tei="http://www.tei-c.org/ns/1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
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
    <hr class="horizontal_line"/>
  </xsl:template>

  <xsl:template match="tei:head[@rend='centered']">
    <b>
      <text class="head-centered">
        <xsl:apply-templates/>
      </text>
    </b>
    <br/>
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
      <text class="add-transcription">
        <xsl:apply-templates/>
      </text>
    </i>
  </xsl:template>

  <xsl:template match="tei:subst">
    <b>
      <text class="del-transcription">
        <xsl:apply-templates select="tei:del"/>
      </text>
      <text class="add-transcription">
        <xsl:apply-templates select="tei:add"/>
      </text>
    </b>
  </xsl:template>

  <xsl:template match="tei:del">
        <text class="del-transcription">
            <xsl:apply-templates/>
        </text>
    </xsl:template>

  <xsl:template match="tei:cb">
    <xsl:if test="@n='1'">
        <div class="cb_left">
            <xsl:apply-templates select="following-sibling::tei:p[1]" mode="nachCb"/>
        </div>
    </xsl:if>
    <xsl:if test="@n='2'">
        <div class="cb_right">
            <xsl:apply-templates select="following-sibling::tei:p[1]" mode="nachCb"/>
        </div>
    </xsl:if>
  </xsl:template>

  <xsl:template match="tei:choice">
    <a href="#">
      <xsl:attribute name="title">
        <xsl:value-of select="tei:expan"/>
      </xsl:attribute>
      <xsl:apply-templates select="tei:abbr"/>
    </a>
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
