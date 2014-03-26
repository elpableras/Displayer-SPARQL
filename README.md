Displayer-SPARQL
===================

I have developed a Web portal access to statistical data.

The portal is built with Netbeans 7.3 and GlassFish V3 server, I used the structure of a Restful Service written in Java on the Server side, using the features of Java EE6.

While on the client, I used an HTML page, which will be consumed from JavaScript, I provide the AJAX technique, calling the GET method which returns a jQuery. The data are taken from:

1.	Web Index
2.	Extracted from Excel
3.	Indicators extracted from the Web Foundation | Web Index

The data are filtered by the year 2007 and catching a sample of 10 items, with the name of the country and indicators in this case I’m using the subject, “Internet and logistics performance”.

The application shows how data coming from the query, after organizing them, I create a graph (using Google Charts) with the sample, where I exhibit the indicators of 10 countries in a bar graph which can be filtered by the spinner on the left, increasing and / or decreasing the number of Internet used, This effect reduce or increases the number of countries depending on the value of these.

