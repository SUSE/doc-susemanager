<?xml version="1.0" encoding="UTF-8"?>
<!--
  Purpose:
    Transform book/part structure into set/book

  Parameters:
     * mappingfile: points to a file with book mappings (ID -> PI)
       default "mapping.xml"

  Input:
    DocBook 5 XML file (root element book)

  Output:
    DocBook 5 XML file (root element set)

  Author:
    Thomas Schraitle <toms@suse.de>, May 2018
    Joseph Cayouette <jcayouette@suse.de>, May 2018

-->

<xsl:stylesheet version="1.0" xmlns="http://docbook.org/ns/docbook"
  xmlns:d="http://docbook.org/ns/docbook" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  exclude-result-prefixes="d">

  <xsl:param name="mappingfile">mapping.xml</xsl:param>
  <xsl:variable name="mapping" select="document($mappingfile)"/>
  <xsl:output encoding="UTF-8"/>

  <!-- Match Atributes-->
  <xsl:template match="node() | @*" name="copy">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>

  <!-- Match book and exchange with set and add attributes -->
  <xsl:template match="d:book">
    <set xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xi="http://www.w3.org/2001/XInclude">
      <xsl:attribute name="xml:id">set.mgr</xsl:attribute>
      <xsl:attribute name="version">5.0</xsl:attribute>
      <xsl:attribute name="xml:lang">en</xsl:attribute>
      <xsl:if test="$mapping/*/set">
        <xsl:copy-of select="$mapping/*/set/node()"/>
      </xsl:if>
      <xsl:apply-templates/>
    </set>
  </xsl:template>

  <!-- Match part and exchange with book -->
  <xsl:template match="d:part">
    <xsl:variable name="xmlid" select="@xml:id"/>
    <book>
      <xsl:copy-of select="@*"/>
      <xsl:if test="$mapping/*/book[@xml:id = $xmlid]">
        <xsl:copy-of select="$mapping/*/book[@xml:id = $xmlid]/node()"/>
      </xsl:if>
      <xsl:apply-templates/>
    </book>
  </xsl:template>

  <!-- Replace simpara with para -->
  <xsl:template match="d:simpara">
    <para>
      <xsl:apply-templates select="node()"/>
    </para>
  </xsl:template>

  <!-- Replace guibutton with guimenu -->
  <xsl:template match="d:guibutton">
    <guimenu>
      <xsl:apply-templates select="node()"/>
    </guimenu>
  </xsl:template>

  <!-- Replace guisubmenu with guimenu -->
  <xsl:template match="d:guisubmenu">
    <guimenu>
      <xsl:apply-templates select="node()"/>
    </guimenu>
  </xsl:template>

  <!-- Replace guimenuitem with guimenu -->
  <xsl:template match="d:guimenuitem">
    <guimenu>
      <xsl:apply-templates select="node()"/>
    </guimenu>
  </xsl:template>

  <!-- Replace programlisting with screen -->
  <xsl:template match="d:programlisting">
    <screen>
      <xsl:apply-templates select="node()"/>
    </screen>
  </xsl:template>


</xsl:stylesheet>
