<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
		xmlns:swl="https://www.dfargo.com/ns/swl"
		xmlns:xi="http://www.w3.org/2001/XInclude"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:rss="https://www.rssboard.org/rss-specification"
		xmlns:xhtml="http://www.w3.org/1999/xhtml">
  <xsl:template match="swl:swl">
    <html lang="en">
      <head>
	<xsl:apply-templates select="rss:item" mode="head"/>
	<link rel="stylesheet" href="/stylesheet/style.css"/>
      </head>
      <body>
	<xi:include href="header.page.xml" parse="xml"/>
	<xsl:apply-templates/>
	<xi:include href="footer.page.xml" parse="xml"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="rss:item" mode="head">
    <xsl:param name="keywords"/>
    <xsl:variable name="author"><xsl:value-of select="rss:author"/></xsl:variable>
    <xsl:variable name="description"><xsl:value-of select="rss:description"/></xsl:variable>

    
    <title><xsl:value-of select="rss:title"/></title>
    <meta name="author" content="{$author}"/>
    <meta name="description" content="{$description}"/>
    <meta name="keywords" content="{$keywords}"/>
  </xsl:template>

  <xsl:template match="rss:item">
    <h1><xsl:value-of select="rss:title"/></h1>
    Uploaded: <tt><time><xsl:value-of select="rss:pubDate"/></time> by <xsl:value-of select="rss:author"/></tt><br/>
    Desc: <tt><xsl:value-of select="rss:description"/></tt><br/>
    Category: <tt><xsl:value-of select="rss:category"/></tt>
  </xsl:template>

  <xsl:template match="xhtml:article">
    <xsl:copy-of select="."/>
  </xsl:template>
</xsl:stylesheet>
