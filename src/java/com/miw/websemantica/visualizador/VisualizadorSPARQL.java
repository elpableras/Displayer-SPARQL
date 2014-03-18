/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.miw.websemantica.visualizador;

import com.hp.hpl.jena.query.Query;
import com.hp.hpl.jena.query.QueryFactory;
import com.hp.hpl.jena.query.ResultSet;
import com.hp.hpl.jena.query.QueryExecution;
import com.hp.hpl.jena.query.QueryExecutionFactory;
import com.hp.hpl.jena.query.ResultSetFormatter;
import javax.ejb.Stateless;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.QueryParam;

/**
 *
 * @author Pablo
 */
@Stateless
@Path("/sparql")
public class VisualizadorSPARQL {
    @GET
    public String VisualizadorSPARQL(@QueryParam("query") String query) {
        return ($sparql(query));
    }
    
    String $sparql(String query){        
        //return
        String sparql = "";
        //endpoint
        String service = "http://156.35.98.12:3030/DB/query";		
//        // consulta sparql
//        String queryString = 
//                        "PREFIX con: <http://extractedFromWebIndex.com#>\n" +
//                        "     PREFIX ilp: <http://ExcelToRDF.org/index_logistics_performance/converted_>\n" +
//                        "     PREFIX wi-indicator: <http://data.webfoundation.org/webindex/indicator/>\n" +
//                        "          SELECT DISTINCT ?country ?companyInternetUse ?logisticPerformance\n" +
//                        "          WHERE{\n" +
//                        "          wi-indicator:WEFK con:observation ?a.\n" +
//                        "          ?a con:country ?country.\n" +
//                        "          ?a con:countryCode3 ?countryCode.\n" +
//                        "          ?a con:year ?year.\n" +
//                        "          ?a con:value ?companyInternetUse.\n" +
//                        "          FILTER (str(?year) = str('2007')).\n" +
//                        "          ?b ilp:2007 ?logisticPerformance.\n" +
//                        "          ?b ilp:Country_Code ?countryCode.\n" +
//                        "          }\n";

        //System.out.println("queryString\n"+query);

        // Inicializacion de queryExecution factory con el servicio remoto
        Query queryE = QueryFactory.create(query);
        //System.out.println("query\n"+query);			
        QueryExecution qexec = QueryExecutionFactory.sparqlService(
                        service, queryE);
        //System.out.println("qexec\n"+qexec);


        try {
                ResultSet rs = qexec.execSelect();
                if ( rs.hasNext() ) {
                        sparql = ResultSetFormatter.asText(rs);
                }

    //			ResultSet results = qexec.execSelect();
    //			//QuerySolution solucion = results.nextSolution();
    //			ResultSetFormatter.out(System.out, results, query);
        } catch (Exception e) {
                 sparql = "Verificar consulta, no existen datos para mostrar: " + e ;
        } finally {
                qexec.close();
        }
        return sparql;
    }
}
