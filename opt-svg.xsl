<?xml version="1.0" encoding="UTF-8"?>
<!--
   Purpose:
      Magically transform SVGs to other sizes (32x32px by default).

   Author: Stefan Knorr, sknorr@suse.de
-->

<xsl:stylesheet version="1.0"
   xmlns="http://www.w3.org/2000/svg"
   xmlns:svg="http://www.w3.org/2000/svg"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:dc="http://purl.org/dc/elements/1.1/"
   xmlns:cc="http://creativecommons.org/ns#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
   xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
   xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
   exclude-result-prefixes="sodipodi inkscape svg dc cc rdf">

  <xsl:param name="targetheight" select="32"/>
  <xsl:param name="targetwidth" select="32"/>

  <!-- FIXME: toms remarks that this won't work for images that have width/
  height dimensions with units (cm, in, ...). I trust his judgment. -->
  <xsl:variable name="originalheight" select="/svg:svg/@height"/>
  <xsl:variable name="originalwidth" select="/svg:svg/@width"/>

  <xsl:variable name="scaleratioheight" select="$targetheight div $originalheight"/>
  <xsl:variable name="scaleratiowidth" select="$targetwidth div $originalwidth"/>

  <xsl:template match="@*">
    <xsl:copy/>
  </xsl:template>

  <xsl:template match="node()">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:if test="self::* and node()">
        <xsl:text>&#10;</xsl:text>
      </xsl:if>
      <xsl:apply-templates select="node()"/>
    </xsl:copy>
    <xsl:text>&#10;</xsl:text>
  </xsl:template>

  <xsl:template match="svg:svg">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:text>&#10;</xsl:text>
      <xsl:comment>
       <xsl:text> opt-svg marker [don't remove]: </xsl:text>
       <xsl:value-of select="concat($originalwidth,'x',$originalheight)"/>
       <xsl:text>=></xsl:text>
       <xsl:value-of select="concat($targetwidth,'x',$targetheight)"/>
       <xsl:text> </xsl:text>
      </xsl:comment>
      <xsl:text>&#10;</xsl:text>
      <g transform="scale({$scaleratiowidth} {$scaleratioheight})">
        <xsl:text>&#10;</xsl:text>
        <xsl:apply-templates select="node()"/>
      </g>
      <xsl:text>&#10;</xsl:text>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="svg:svg/@height">
    <xsl:attribute name="height"><xsl:value-of select="$targetheight"/></xsl:attribute>
  </xsl:template>

  <xsl:template match="svg:svg/@width">
    <xsl:attribute name="width"><xsl:value-of select="$targetwidth"/></xsl:attribute>
  </xsl:template>

  <!-- Cut crap. -->
  <xsl:template
    match="
      svg:metadata|
      svg:defs|
      sodipodi:*|
      inkscape:*|
      rdf:*|
      cc:*|
      dc:*|
      @id|
      @preserveAspectRatio|
      @zoomAndPan|
      @version|
      @contentScriptType|
      @contentStyleType|
      @viewBox|
      @inkscape:*|
      @sodipodi:*|
      @rdf:*|
      @cc:*|
      @dc:*|
      comment()|
      text()[not(normalize-space())]"/>

</xsl:stylesheet>
