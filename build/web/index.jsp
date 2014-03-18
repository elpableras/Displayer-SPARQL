<%-- 
    Document   : index
    Created on : 18-may-2013, 17:04:53
    Author     : Pablo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>        
        <!--Load the AJAX API-->
        <script type="text/javascript" src="https://www.google.com/jsapi"></script>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Práctica Web Semántica</title>
        <link rel="stylesheet" href="css/style.css" media="screen">
    </head>
    <body>
        <img src="images/sparql.jpg" WIDTH=200 HEIGHT=200 ALT="Twitter" align=right />
        <h1>SPARQL</h1>
        <form action="webresources/sparql">
            <h2>Query:</h2>           
            <textarea name="query" id="query" class="button medium yellow" cols=90 rows=20>
PREFIX con: <http://extractedFromWebIndex.com#>
PREFIX ilp: <http://ExcelToRDF.org/index_logistics_performance/converted_>
PREFIX wi-indicator: <http://data.webfoundation.org/webindex/indicator/>

SELECT DISTINCT ?country ?companyInternetUse ?logisticPerformance
WHERE{
  wi-indicator:WEFK con:observation ?a.
  ?a con:country ?country.
  ?a con:countryCode3 ?countryCode.
  ?a con:year ?year.
  ?a con:value ?companyInternetUse.
  FILTER (str(?year) = str('2007')).
  
  ?b ilp:2007 ?logisticPerformance.
  ?b ilp:Country_Code ?countryCode.
}
            </textarea>
            <br>
            <button class="button medium blue" id="analizarBtn">Analizar</button>
        </form>
        <script type="text/javascript">
            google.load('visualization', '1', {packages: ['table']});
             
            jQuery("#analizarBtn").click(function(){
                var query = jQuery("#query").val();                
                jQuery.get("http://localhost:8080/VisualizarSPARQL/webresources/sparql",{
                    query:query
                },function(resultado){                    
                    jQuery("#resultado span").text(resultado);
                    var arrayElementos = $("#resultado span").text().split("||");
                    //jQuery("#resultado span").text(arrayElementos[0]);
                    //jQuery("#resultado2 span").text(arrayElementos[1]);
                    //jQuery("#resultado3 span").text(arrayElementos[2]);
                    //jQuery("#resultado4 span").text(arrayElementos[3]);
                    //var arrayValorPalabras = arrayElementos[1].split(" ");
                    
//                    // Create the data table.
//                    var data = new google.visualization.DataTable();
//                    data.addColumn('string', 'Palabra');
//                    data.addColumn('number', 'Valor (0-10)');
//                    
//                    data.addRows(arrayValorPalabras.length+1);
//                    for (var i = 0; i < arrayValorPalabras.length; ++i) {                        
//                        var datos = arrayValorPalabras[i].split(":");                       
//                        data.setCell(i, 0, datos[0]);                        
//                        data.setCell(i, 1, parseInt(datos[1]));                                                                        
//                    }                
//                    data.setCell(i, 0, "PROMEDIO");
//                    data.setCell(i, 1, parseInt(arrayElementos[2]));
//                    // Create and draw the visualization.
//                    var table = new google.visualization.Table(document.getElementById('visualization'));
//
//                    var formatter = new google.visualization.TableBarFormat({width: 120});
//                    formatter.format(data, 1); // Apply formatter to second column
//
//                    table.draw(data, {allowHtml: true, showRowNumber: true});                   
                });                
            });            
        </script>
        <!--Div that will hold the column chart-->
        <p><div id="visualization" style="width: 800px; height: 400px;"></div></p>
        <footer>
            <p>@ Copyright Pablo González Jiménez UO173780</p>
        </footer>        
    </body>
</html>
