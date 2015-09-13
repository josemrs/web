<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" />
<xsl:template match="/">

<html lang="es">
<head>
    <title><xsl:value-of select="web/title"/></title>
    <link type="text/css" rel="stylesheet" href="static/css/dot-luv/jquery-ui-1.8.15.custom.css"/>
    <link type="text/css" rel="stylesheet" href="static/css/general.css"/>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"/>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.13/jquery-ui.min.js"/>
    <script type="text/javascript" src="static/js/jquery.multi-open-accordion-1.5.3.min.js"/>
</head>

<body>
    <div>
        <a href="http://jmrs.es" class="botonIdioma"><img src="static/images/es.png" alt="ES" height="11" width="16"/></a>
        <a href="http://jmrs.es/indexGB.html" class="botonIdioma"><img src="static/images/gb.png" alt="GB" height="11" width="16"/></a>
    </div>
    
    <h1><xsl:value-of select="web/title"/></h1>
    <div id="saludo"><xsl:value-of select="web/welcome"/></div>
    
    <div id="botonera">
        <form method="post" action="http://jmrs.es/">
            <div>
                <xsl:variable name="unfoldText"><xsl:value-of select="web/strings/unfold"/></xsl:variable>
                <xsl:variable name="foldText"><xsl:value-of select="web/strings/fold"/></xsl:variable>
                <input class="boton" type="button" value="{$unfoldText}" onclick="$('#multiOpenAccordion').multiOpenAccordion('option', 'active', [0,1,2,3,4]);"/>
                <input class="boton" type="button" value="{$foldText}" onclick="$('#multiOpenAccordion').multiOpenAccordion('option', 'active', []);"/>
            </div>
        </form>    
    </div>
    
    
    <div id="multiOpenAccordion">
        <h3><a href="#"><xsl:value-of select="web/personal/@tag"/></a></h3>
            <div>
                <ul>
                    <li><b><xsl:value-of select="web/personal/name/@tag"/>: </b><xsl:value-of select="web/personal/name"/></li>
                    <li><b><xsl:value-of select="web/personal/contact/@tag"/>: </b><xsl:value-of select="web/personal/contact"/></li>
                    <li><b>Fecha de nacimiento:</b> 07/12/1984</li>
                    <li><b>Lugar de residencia:</b> Southampton, Inglaterra</li>
                    <li><b>Linkedin:</b> <a href="http://www.linkedin.com/pub/jos%C3%A9-mar%C3%ADa-rodr%C3%ADguez-s%C3%A1ez/19/992/5a">Perfil</a></li>
                </ul>
            </div>
            
            
        <h3><a href="#"><xsl:value-of select="web/experience/@tag"/></a></h3>
            <div>
                <xsl:for-each select="web/experience/job">
                <ul>
                    <li><b><xsl:value-of select="@dates"/></b>: <xsl:value-of select="@title"/>.</li>
                    <li class="sublista">
                        <b><xsl:value-of select="/web/strings/company"/>: </b>
                        <xsl:variable name="link"><xsl:value-of select="company/@web"/></xsl:variable>
                        <a href="{$link}"> <xsl:value-of select="company/@name"/> </a>
                    </li>
                    <xsl:for-each select="task">
                    <li class="sublista">
                        <b><xsl:value-of select="/web/strings/task"/>: </b> <xsl:value-of select="@text"/>
                    </li>
                        <xsl:for-each select="subtask">                    
                            <p class="subparrafo"><xsl:value-of select="."/></p>
                        </xsl:for-each>
                    </xsl:for-each>                    
                </ul>
                </xsl:for-each>
			
            </div>
            
    </div>
    
   <script type="text/javascript">
        $(function(){
            $('#multiOpenAccordion').multiOpenAccordion({
                active: [0],
                click: function(event, ui) {
                },
                init: function(event, ui) {
                },
                tabShown: function(event, ui) {
                },
                tabHidden: function(event, ui) {
                }
                
            });
            
            $('#multiOpenAccordion').multiOpenAccordion("option", "active", [0, 1]);
        });
    </script>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
