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
      <div class="text-center">
        <xsl:apply-templates/>
        <br/>
        <br/>
      </div>
    </b>
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

    <xsl:template match="tei:list[@type='simple']/tei:head">
        <br/>
        <i>
            <xsl:apply-templates/>
        </i>
    </xsl:template>

    <xsl:template match="tei:list/tei:item">
            <br/>
            <xsl:apply-templates/>
    </xsl:template>

<!-- Slack -->
<!-- <xsl:template match="tei:div">
    <xsl:apply-templates select="tei:cb"/>
</xsl:template>

<xsl:template match="tei:cb">
    <div>
    <xsl:apply-templates select="following-sibling::tei:p"/>
    </div>
</xsl:template> -->

<!-- <xsl:template match="div">
    <xsl:apply-templates select="tei:cb[@type='curly_brace']"/>
</xsl:template>

<xsl:template match="tei:cb[@type='curly_brace']">
    <div>
    <xsl:apply-templates select="following-sibling::tei:p"/>
    </div>
</xsl:template> -->


<!-- Baumgarten -->

  <!-- <xsl:template match="tei:cb[@type='curly_brace']">
    <table>

      <tr class="column_left">
        <xsl:apply-templates select="following-sibling::tei:p"/>
        <xsl:apply-templates select="tei:cb[@type='curly_brace'][@n='1']"/>
      </tr>

      <tr class="column_right">
        <xsl:apply-templates select="following-sibling::tei:p"/>
        <xsl:apply-templates select="tei:cb[@type='curly_brace'][@n='2']"/>
      </tr>

    </table>
  </xsl:template> -->

  <!-- <xsl:template match="tei:cb[@type='simple']">
    <table>

      <tr class="column_left">
        <xsl:apply-templates select="following-sibling::tei:p"/>
        <xsl:apply-templates select="tei:cb[@type='simple'][@n='1']"/>
      </tr>

      <tr class="column_right">
        <xsl:apply-templates select="following-sibling::tei:p"/>
        <xsl:apply-templates select="tei:cb[@type='simple'][@n='2']"/>
      </tr>
    </table>
  </xsl:template> -->

<!-- tei-enc -->

<!-- <xsl:template match="tei:cb">
  <table>
    <xsl:if test="@n = 1">
      <tr>
        <xsl:apply-templates
              select="following-sibling::node()[preceding-sibling::tei:cb[1][@n=1]]"/>
      </tr>
    </xsl:if>
    <xsl:if test="@n = 2">
      <tr>
        <xsl:apply-templates
              select="following-sibling::node()[preceding-sibling::tei:cb[1][@n=2]]"/>
      </tr>
    </xsl:if>
    <xsl:if test="@n = 3">
      <tr>
        <xsl:apply-templates
              select="following-sibling::node()[preceding-sibling::tei:cb[1][@n=3]]"/>
      </tr>
    </xsl:if>
    <xsl:if test="@n = 4">
      <tr>
        <xsl:apply-templates
              select="following-sibling::node()[preceding-sibling::tei:cb[1][@n=4]]"/>
      </tr>
    </xsl:if>
    <xsl:if test="@n = 5">
      <tr>
        <xsl:apply-templates
              select="following-sibling::node()[preceding-sibling::tei:cb[1][@n=5]]"/>
      </tr>
    </xsl:if>

  </table>
</xsl:template> -->

<!-- baumgarten-2 -->

<!--   <xsl:template match="tei:cb[@type='curly_brace']">
    <table>
      <xsl:if test="@n = 1">
        <tr class="column_left">
          <xsl:apply-templates
            select="following-sibling::node()[preceding-sibling::tei:cb[@type='curly_brace'][1][@n=1]]"/>
        </tr>
      </xsl:if>
      <xsl:if test="@n = 2">
        <tr class="column_right">
          <xsl:apply-templates
            select="following-sibling::node()[preceding-sibling::tei:cb[@type='curly_brace'][1][@n=2]]"/>
        </tr>
      </xsl:if>
    </table>
  </xsl:template> -->


<!--   <xsl:template match="tei:cb[@type='simple']">
    <table>
      <xsl:apply-templates
            select="following-sibling::node()[preceding-sibling::tei:cb[@type='simple'][1][@n=3]]"/>
    </table>
  </xsl:template> -->

  <!-- sans table -->
  <!-- <xsl:template match="tei:cb[@type='simple']">
      <xsl:if test="@n = 1">
        <tr class="column_left">
          <xsl:apply-templates
            select="following-sibling::node()[preceding-sibling::tei:cb[@type='simple'][1][@n=1]]"/>
        </tr>
      </xsl:if>
      <xsl:if test="@n = 2">
        <tr class="column_center">
          <xsl:apply-templates
            select="following-sibling::node()[preceding-sibling::tei:cb[@type='simple'][1][@n=2]]"/>
        </tr>
      </xsl:if>
      <xsl:if test="@n = 3">
        <tr class="column_right">
          <xsl:apply-templates
            select="following-sibling::node()[preceding-sibling::tei:cb[@type='simple'][1][@n=3]]"/>
        </tr>
      </xsl:if>
  </xsl:template> -->



<!-- avec le each -->


  <xsl:template match="tei:div[tei:cb]">
    <table>
      <xsl:for-each select="tei:cb">
        <xsl:variable name="n" select="@n" />
            <tr>
              <xsl:apply-templates
              select="following-sibling::node()[preceding-sibling::tei:cb[1][@n=$n]]"/>
            </tr>
      </xsl:for-each>
    </table>
  </xsl:template>

<!--   <xsl:template match="tei:div[tei:cb[@type='curly_brace']]">
    <table>
      <xsl:for-each select="tei:cb[@type='curly_brace']">
        <xsl:variable name="n" select="@n" />
        <tr>
          <xsl:apply-templates
            select="following-sibling::node()[preceding-sibling::tei:cb[@type='curly_brace'][1][@n=$n]]"/>
        </tr>
      </xsl:for-each>
    </table>
  </xsl:template> -->

<!--     <xsl:template match="tei:div[tei:cb[@type='curly_brace']]">
    <div class="cols">
      <xsl:for-each select="tei:cb[@type='curly_brace']">
        <xsl:variable name="n" select="@n" />
        <div class="column">
          <xsl:apply-templates
            select="following-sibling::node()[preceding-sibling::tei:cb[@type='curly_brace'][1][@n=$n]]"/>
        </div>
      </xsl:for-each>
    </div>
  </xsl:template> -->

<!--     <xsl:template match="tei:div[tei:cb[@type='simple']]">
    <div class="cols">
      <xsl:for-each select="tei:cb[@type='simple']">
        <xsl:variable name="n" select="@n" />
        <div class="column">
          <xsl:apply-templates
            select="following-sibling::node()[preceding-sibling::tei:cb[@type='simple'][1][@n=$n]]"/>
        </div>
      </xsl:for-each>
    </div>
  </xsl:template> -->


<!-- <xsl:template match="div">
    <xsl:apply-templates select=".//cb"/>
</xsl:template>

<xsl:template match="cb">
    <div>

    </div>
</xsl:template> -->

  <!-- <xsl:template match="tei:cb">
  <xsl:if test="preceding-sibling::*[not(self::tei:head)]">
    <xsl:variable name="prop" select="1 div number(count(../tei:cb[preceding-sibling::*[not(self::tei:head)]]) + 1)"/>
    <xsl:text>\end{column}
     \begin{column}[T]{</xsl:text>
    <xsl:value-of select="$prop"/>
    <xsl:text>\textwidth}
     </xsl:text>
  </xsl:if>
  </xsl:template> -->

<!-- TEI-SS -->


<!-- <xsl:template match="tei:cb">
  <table>
    <xsl:if test="preceding-sibling::*[not(self::tei:head)]">
      <xsl:variable name="prop" select="1 div number(count(../tei:cb[preceding-sibling::*[not(self::tei:head)]]) + 1)"/>
      <tr>
        <xsl:value-of select="$prop"/>
      </tr>
    </xsl:if>
  </table>
</xsl:template> -->



<!-- Abbréviations -->
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
