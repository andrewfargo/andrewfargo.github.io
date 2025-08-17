<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- convert rss to sweblog navigational pages -->
<!-- todo replace definitions with common.xsl content, including editor vars -->
<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:xi="http://www.w3.org/2001/XInclude"
		xmlns:rss="https://www.rssboard.org/rss-specification">
  <xsl:template match="rss:channel">
    <html lang="en">
      <head>
	<title><xsl:value-of select="rss:title"/></title>
	<meta name="description" content="{rss:description}"/>
	<meta name="keywords" content="blog,mathematics,linguistics,computers"/>
      </head>
      <body>
	<xi:include href="header.page.xml" parse="xml"/>
	<main>
	<header>
	  <h1><xsl:value-of select="rss:title"/></h1>
	  <p><xsl:value-of select="rss:description"/></p>
	</header>
	<article>
	  <h2 id="content">Recent posts <a href="/rss.xml" type="text/xml"><img src="/media/rss.svg" width="18" height="18" alt="RSS"/></a></h2>
	  <ul>
	    <xsl:apply-templates select="rss:item"/>
	  </ul>
	</article>
	</main>
	<xi:include href="footer.page.xml" parse="xml"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="rss:item">
    <li>
    <p><a href="{rss:link}"><xsl:value-of select="rss:title"/></a></p>
    Uploaded: <tt><time><xsl:value-of select="rss:pubDate"/></time> by <xsl:value-of select="rss:author"/></tt><br/>
    Desc: <tt><xsl:value-of select="rss:description"/></tt><br/>
    Category: <tt><xsl:value-of select="rss:category"/></tt>
    </li>
  </xsl:template>
</xsl:stylesheet>
