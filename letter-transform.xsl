<?xml version="1.0" encoding="UTF-8"?>
    <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:xs="http://www.w3.org/2001/XMLSchema"
        exclude-result-prefixes="xs"
        xpath-default-namespace="http://www.tei-c.org/ns/1.0"
        version="2.0">
        
        <xsl:output method="xml" indent="yes" doctype-system="about:legacy-compat"/>
        
        <xsl:template match="/">
            <html>
                <style>
                    div {
                    background-color: white;
                    padding-top: 25px;
                    padding-right: 300px;
                    padding-bottom: 25px;
                    padding-left: 300px;
                    font: 16px/12px Georgia, serif;
                    line-height: 1.5em;
                    }
                </style>
                
                <head>
                    <title><xsl:apply-templates select="//title"></xsl:apply-templates></title>
                </head>
                
                <body>
                    <div><h2 align="center"><xsl:apply-templates select="//title"/>
                        <br /><h3 align="center"><xsl:text>Edited by Chelsea Gizzi</xsl:text></h3>
                    </h2>
                        
                    <xsl:apply-templates select="//text"/>
                        
                    </div>
                    
                    <div class="people"><h2 align="center">Persons Mentioned</h2>
                <ul>
                    <xsl:apply-templates select="//person" mode="toc"/>
       
                </ul></div>
                <div class="notes"><h2 align="center">Notes</h2>
                    <xsl:for-each select="//note[@type='ed']">
                        
                        <xsl:apply-templates select="." mode="notes"/>
                    </xsl:for-each>

                </div>
                    
                </body>
            </html>
        </xsl:template>
        
        
        
        <xsl:template match="//note">
      
                <a href="{concat('#n',@xml:id)}" id="{@xml:id}">
                    <sup><xsl:value-of select="@xml:id"/></sup>
                </a>
     
        </xsl:template>
        
        <xsl:template match="//note" mode="notes">
            
            <p class="footnote" id="{concat('n',@xml:id)}">
          
                <a href="{concat('#',@xml:id)}">
                   
                    <xsl:value-of select="@xml:id">
                        
                    </xsl:value-of><xsl:text> &#32;</xsl:text> 
                    
                </a>
                <xsl:apply-templates mode="notes"/>
                <xsl:for-each select="ref">
                    <a href="{@target}">&#32;(<xsl:value-of select="@target"/>.)
                    </a></xsl:for-each>
<!--                -->
                
                
            </p>
        </xsl:template>
        
        <xsl:template match="lb">
            <br/>
        </xsl:template>
        
        <xsl:template match="head">
            <h3 align="center"><strong><xsl:apply-templates/></strong></h3>
        </xsl:template>
        
        <xsl:template match="emph">
            <em><xsl:apply-templates/></em>
        </xsl:template>
        
        <xsl:template match="hi[@rend='underline']">
            <sup><xsl:apply-templates/></sup>
        </xsl:template>
        
        <xsl:template match="l|p|salute|signed">
            <p><xsl:apply-templates/></p>
        </xsl:template>
        
        <xsl:template match="addrLine">
            <p><xsl:apply-templates/></p>
        </xsl:template>
        
        <xsl:template match="add">
            <sub>^</sub><xsl:apply-templates/><sub>^</sub>
   
        </xsl:template>
        
        <xsl:template match="del">
            <del><xsl:apply-templates/></del>
        </xsl:template>
        
        <xsl:template match="hi[@rend='superscript']">
            <sup><xsl:apply-templates/></sup>
        </xsl:template>
        
        
        
        <!--<xsl:template match="note[@type='ed']"><sup><xsl:apply-templates select="//note[@n]"/></sup></xsl:template> -->
        
        <xsl:template match="person" mode="toc">
            <li><xsl:value-of select="name/surname"/>, <xsl:value-of select="name/forename"/>.
                &#32; <xsl:if test="birth|death">
                    <p>(<xsl:value-of select="birth"/>&#x2014;<xsl:value-of select="death"/>).</p>
                </xsl:if> 
                &#32;<p><xsl:value-of select="note[@type='bio']"/>
                </p>
            </li>
        </xsl:template>
        
    </xsl:stylesheet>
