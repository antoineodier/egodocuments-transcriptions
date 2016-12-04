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
        <br/><b>TEST MATHEUS MILLER</b><br/><br/>
        <script></script>
        <style>
          @font-face {
            font-family: 'ZedlerFraktur';
            src: url('zedler-fraktur-2.ttf') format('truetype');
          }
          .gothic-font {
            font-family: 'ZedlerFraktur';
            font-size: 40px;
          }
        </style>
      </head>
      <body>
        <xsl:apply-templates/>
      </body>
     </html>
  </xsl:template>

  <xsl:template match="tei:front">
    <div class="gothic-font">
      <xsl:apply-templates/>
    </div>
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