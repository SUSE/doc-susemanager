<?xml version="1.0" encoding="UTF-8"?>
<!--
   Purpose:
      Magically transform SVGs to 40x40px.

   Author: Stefan Knorr, sknorr@suse.de
-->

<xsl:stylesheet version="1.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:dc="http://purl.org/dc/elements/1.1/"
   xmlns:cc="http://creativecommons.org/ns#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
   xmlns="http://www.w3.org/2000/svg"
   xmlns:svg="http://www.w3.org/2000/svg"
   xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
   xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
   exclude-result-prefixes="sodipodi inkscape svg cc rdf">

  <xsl:param name="targetheight" select="32"/>
  <xsl:param name="targetwidth" select="32"/>

  <xsl:variable name="originalheight" select="/svg:svg/@height"/>
  <xsl:variable name="originalwidth" select="/svg:svg/@width"/>

  <xsl:variable name="scaleratioheight" select="$targetheight div $originalheight"/>
  <xsl:variable name="scaleratiowidth" select="$targetwidth div $originalwidth"/>


  <xsl:template match="node()|@*">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <!-- FIXME: Working newline would be nice here. -->
      <xsl:apply-templates select="node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="svg:svg">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:text>&#10;</xsl:text>
      <xsl:comment> opt-svg marker - don't remove </xsl:comment>
      <g transform="scale({$scaleratioheight} {$scaleratiowidth})">
        <xsl:apply-templates select="node()"/>
      </g>
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
      @inkscape:*|
      @sodipodi:*|
      @rdf:*|
      @cc:*|
      @dc:*|
      comment()|
      text()[not(normalize-space())]"/>

</xsl:stylesheet>
