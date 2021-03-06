<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template name="table" match="/">
        <html>
            <link rel="stylesheet" href="style.css"/>
            <head>
                <h1>
                    <xsl:choose>
                        <xsl:when test="count(/results//city)"> Weather status on <xsl:value-of select="count(/results//city)"/> Cities around the World </xsl:when>
                        <xsl:otherwise> <xsl:value-of select="results/error/text()"/> </xsl:otherwise>
                    </xsl:choose>
                </h1>

            </head>
            <body>
                <xsl:for-each select="results/country">
                    <h2> Weather on <xsl:value-of select="count(.//city)"/> cities of <xsl:value-of select="name"/> </h2>
                    <div class="wrapper">
                        <div class="table">
                            <div class="row header">
                                <div class="cell">City</div>
                                <div class="cell">Temperature</div>
                                <div class="cell">Feels Like</div>
                                <div class="cell">Humidity</div>
                                <div class="cell">Pressure</div>
                                <div class="cell">Clouds</div>
                                <div class="cell">Weather</div>
                            </div>
                            <xsl:for-each select=".//city">
                                <div class="row">
                                    <div class="cell" data-title="City">
                                        <xsl:value-of select="name"/>
                                    </div>
                                    <div class="cell" data-title="Temperature">
                                        <xsl:value-of select="temperature"/>
                                        <xsl:text>&#160;</xsl:text>
                                        <xsl:value-of select="temperature/@unit"/>
                                    </div>
                                    <div class="cell" data-title="Feels Like">
                                        <xsl:value-of select="feels_like"/>
                                        <xsl:text>&#160;</xsl:text>
                                        <xsl:value-of select="feels_like/@unit"/>
                                    </div>
                                    <div class="cell" data-title="Humidity">
                                        <xsl:value-of select="humidity"/>
                                        <xsl:text>&#160;</xsl:text>
                                        <xsl:value-of select="humidity/@unit"/>
                                    </div>
                                    <div class="cell" data-title="Pressure">
                                        <xsl:value-of select="pressure"/>
                                        <xsl:text>&#160;</xsl:text>
                                        <xsl:value-of select="pressure/@unit"/>
                                    </div>
                                    <div class="cell" data-title="Clouds">
                                        <xsl:value-of select="clouds"/>
                                    </div>
                                    <div class="cell" data-title="Weather">
                                        <div class="img-txt">
											<div class="content">
												<xsl:value-of select="weather"/>
											</div>
											<div class="photo">
												<xsl:variable name="icon" select="weather/@icon"/>
            									<img src="http://openweathermap.org/img/wn/{$icon}@2x.png"/>
											</div>
										</div>
                                    </div>
                                </div>
                            </xsl:for-each>
                        </div>
                    </div>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:transform>