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
        <meta charset="utf-8"/>
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
  <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
  <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <script>
          $(function() {
    $( document ).tooltip();
  });
        </script>
        <style>
          .ui-tooltip {
            font: 40px arial, sans-serif;
<!--             display: inline-block; -->
            font-size: 250%;
            padding: 10px 20px;
            <!-- color: white; -->
            border-radius: 20px;
            box-shadow: 0 0 7px black;
          }
          a:link {
            color: black;
            border-bottom: 2px dashed #000;
            text-decoration: none;
          }
          a:visited {
            color: black;
            text-decoration: none;
          }
          a:hover {
            color: black;
            text-decoration: none;
          }
          a:active {
            color: black;
            text-decoration: none;
          }
        </style>
      </head>
      <body>
        <xsl:apply-templates/>
      </body>
     </html>
  </xsl:template>

  <xsl:template match="tei:title">
    <b><i>Manuscript Title: </i></b> <xsl:apply-templates/>
    <br/>
  </xsl:template>

  <xsl:template match="tei:author/tei:name">
    <b><i>Author's Name: </i></b> <xsl:apply-templates/>
    <br/>
  </xsl:template>

  <xsl:template match="tei:add[@type='life_dates']">
    <b><i>Life dates: </i></b> <xsl:apply-templates/>
    <br/>
  </xsl:template>

  <xsl:template match="tei:add[@type='gender']|tei:add[@type='confession']|tei:editionStmt|tei:publicationStmt|tei:msContents|tei:support|tei:dimensions|tei:decoDesc">
  </xsl:template>

  <xsl:template match="tei:msIdentifier">
    <b><i>Manuscript repository: </i></b> <xsl:apply-templates select="tei:repository"/>
    <br/>
    <b><i>Place: </i></b> <xsl:apply-templates select="tei:settlement/tei:rs[@type='place']"/> (<xsl:apply-templates select="tei:settlement/tei:rs[@type='country']"/>)
    <br/>
  </xsl:template>

  <xsl:template match="tei:extent">
    <b><i>Extent: </i></b> <xsl:apply-templates/>
    <br/>
  </xsl:template>

  <xsl:template match="tei:handDesc">
    <b><i>Writing: </i></b> <xsl:apply-templates/>
    <br/>
  </xsl:template>

  <xsl:template match="tei:encodingDesc">
    <b><i>Rendering: </i></b> <xsl:apply-templates select="tei:editorialDecl/tei:normalization"/>
    <br/>
  </xsl:template>

  <xsl:template match="tei:profileDesc">
    <b><i>Text type: </i></b> <xsl:apply-templates select="tei:textClass/tei:keywords/tei:term[@type='historical_genre']"/>/<xsl:apply-templates select="tei:textClass/tei:keywords/tei:term[@type='modern_genre']"/>/<xsl:apply-templates select="tei:textClass/tei:keywords/tei:term[@type='document']"/>
    <br/>
  </xsl:template>


  <xsl:template match="tei:teiHeader">
    <div style="font: 40px arial, sans-serif; text-align: left; font-size: 200%"><xsl:apply-templates/></div>
  </xsl:template>

  <xsl:template match="tei:body">
    <div style="unicode-bidi: embed; direction: rtl; text-align: right; font-size: 200%; line-height: 160%;"><xsl:apply-templates/></div>
  </xsl:template>

  <xsl:template match="tei:lb">
    <br/>
  </xsl:template>

  <xsl:template match="tei:add">
    <i>
      <text>
        <xsl:apply-templates/>
      </text>
    </i>
  </xsl:template>

  <xsl:template match="tei:unclear">
    <xsl:text>[</xsl:text>
      <xsl:apply-templates/>
    <xsl:text>]</xsl:text>
  </xsl:template>

  <xsl:template match="tei:writing[@style='square_script']">
    <div style="font-size: 230%; line-height: 160%;">
      <b>
        <xsl:apply-templates/>
      </b>
    </div>
  </xsl:template>

  <xsl:template match="tei:choice">
    <a href="#">
      <xsl:attribute name="title">
        <xsl:value-of select="tei:expan"/>
      </xsl:attribute>
      <xsl:apply-templates select="tei:abbr"/>
    </a>
  </xsl:template>

  <!-- style="border-bottom: 5px dotted black; cursor: help;" -->

  <xsl:template match="tei:pb">
    <br/>
    <br/>
    <br/>
    <hr/>
      <div style="font: 40px arial, sans-serif; color: #D0D0D0; text-align: left;">
        <i>
          <b>
            <xsl:text>Page range: </xsl:text>
            <xsl:value-of select="@n"/>
          </b>
        </i>
      </div>

    <br/>
    <br/>
  </xsl:template>

</xsl:stylesheet>
