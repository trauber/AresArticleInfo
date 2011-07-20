<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:key name="article-by-exid" match="ArticleInfo" use="ExternalCourseId"/>
  <xsl:template match="/dataroot">
    <html>
      <head>
        <style type="text/css">
          .AI { text-indent: -20px; margin-left: 25px; }
        </style>
      </head>
      <body>
      	Generated: <xsl:value-of select="@generated"/>
      	<hr />
        <xsl:for-each select="ArticleInfo[count(. | key('article-by-exid', ExternalCourseId)[1]) = 1]">
          <xsl:sort select="ExternalCourseId"/>
          <a>
            <xsl:attribute name="href">
              <xsl:value-of select="concat('#',ExternalCourseId)"/>
            </xsl:attribute>
            <xsl:value-of select="concat(Name, ' --- ', Instructor)"/>
          </a>
          <br/>
        </xsl:for-each>
        <xsl:for-each select="ArticleInfo[count(. | key('article-by-exid', ExternalCourseId)[1]) = 1]">
          <xsl:sort select="ExternalCourseId"/>
          <xsl:sort select="/Author"/>
          <xsl:sort select="ArticleTitle"/>
          <h2>
            <a>
              <xsl:attribute name="name">
                <xsl:value-of select="ExternalCourseId"/>
              </xsl:attribute>
            </a>
            <xsl:value-of select="concat(Name, ' --- ', Instructor)"/>
          </h2>
          <xsl:text>
      </xsl:text>
        <xsl:for-each select="key('article-by-exid', ExternalCourseId)">
          <xsl:text>

          </xsl:text>
          <p class="AI"><xsl:value-of select="Author"/>
        (<xsl:value-of select="JournalYear"/>).
        <xsl:value-of select="ArticleTitle"/>.
        <i><xsl:value-of select="Title"/>, 
        <xsl:value-of select="Volume"/></i>(<xsl:value-of select="Issue"/>),
        <xsl:value-of select="Pages"/>. 
        Retrieved from <a><xsl:attribute name="href"><xsl:value-of select="ProxiedLocation"/></xsl:attribute><xsl:attribute name="target">_blank</xsl:attribute> <xsl:value-of select="ProxiedLocation"/></a>
        </p>
          </xsl:for-each>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
