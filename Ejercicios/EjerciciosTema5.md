
# EJERCICIOS TEMA 5

###### Nombre : Carmen Bueno Ben Boubker
###### Asignatura : Servidores Web de Altas Prestaciones (SWAP)



#### Ejercicio T5.1

Buscar información sobre cómo calcular el número de conexiones por segundo.

Podemos saber en un momento dado cuantas peticiones esta sirviendo apache ejecutando:

**apache2ctl status |grep request**



#### Ejercicio T5.2

Revisar los análisis de tráfico que se ofrecen en:

http://bit.ly/1g0dkKj

Instalar wireshark y observar cómo fluye el tráfico de red en uno de los servidores web mientras se le hacen peticiones HTTP



#### Ejercicio T5.3

Buscar información sobre características, disponibilidad para diversos SO, etc de herramientas para monitorizar las prestaciones de un servidor.
Para empezar, podemos comenzar utilizando las clásicas de Linux:

Con **top** podemos tener una vista dinámica de un sistema en funcionamiento.
Puede mostrar un resumen y una lista de procesos manejados por el kernel Linux.
Tiene una limitada interfaz interactiva y una interfaz más amplia para la configuración personal

**Vmstat** es un comando que nos permite obtener un detalle general de los procesos, E/S, uso de memoria/swap, estado del sistema y actividad del CPU. Es esencial para entender que esta pasando en tu sistema, detectar cuellos de botella, etc..

**Netstat** muestra  conexiones  de  red,  tablas  de  encaminamiento,estadísticas de interfaces,
conexiones enmascaradas y mensajes del tipo netlink.
