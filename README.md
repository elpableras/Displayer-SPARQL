Visualizador-SPARQL
===================

Se ha desarrollado un portal Web de acceso a los datos estadísticos. 

El portal se ha construido con el Netbeans 7.3 y su servidor GlassFish V3, para ello se ha utilizado la estructura de un Servicio Restful escrito en Java en la parte del Servidor, ya que usaremos las características de Java EE6. 

Mientras en la parte del cliente, se utilizara una página en HTML, que será consumida desde JavaScript, la cual se provee de la técnica AJAX, llamando al método GET que nos devuelve la consulta con jQuery. El portal contiene la Query de ejemplo para sacar, el conjunto de datos de: 
- 1. Datos de la Web Index 
- 2. Datos extraídos desde Excel 
- 3. Datos sobre indicadores de extraídos de la Web Foundation | Web Index 

Los datos son filtrados por el año 2007 y cogida una muestra de 10 elementos, con el nombre del país y los indicadores en este caso uso de Internet y desempeño logístico.

La aplicación muestra la forma de datos llegados de la consulta, después de organizarlos se hace una gráfica (utilizando Google Charts) con la muestra tomada, donde se expone los indicadores de los 10 países en una gráfica de barras la cual puede ser filtrada por medio del spinner de la izquierda, aumentando o/y disminuyendo, el número del uso de Internet, lo cual irá reduciendo el número de países dependiendo del valor de estos.
