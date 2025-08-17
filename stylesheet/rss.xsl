<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:swl="https://www.dfargo.com/ns/swl"
		xmlns:rss="https://www.rssboard.org/rss-specification">
  <xsl:template match="swl:swl">
    <xsl:copy-of select="rss:item"/>
  </xsl:template>
</xsl:stylesheet>
