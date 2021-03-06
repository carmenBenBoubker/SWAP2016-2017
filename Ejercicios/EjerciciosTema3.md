# EJERCICIOS TEMA 3

###### Nombre : Carmen Bueno Ben Boubker 
###### Asignatura : Servidores Web de Altas Prestaciones (SWAP)


#### Ejercicio T3.1

Buscar con qué órdenes de terminal o herramientas gráficas podemos configurar bajo Windows y bajo Linux el enrutamiento del tráfico de un servidor para pasar el tráfico desde una subred a otra.

~> Windows tiene un Servicio de enrutamiento y acceso remoto que se puede agregar al servidor mediante un simple asistente.

~> En Linux, la configuración de red está en */etc/network/interfaces*,
se trata de un archivo en el cual se pueden establecer las configuraciones de red.
Si lo que queremos es crear una ruta pues se utiliza el comando *route* y añadirla o borrarla con *add* o *del* respectivamente.
Si lo que queremos es mantener estas rutas tras reiniciar el servidor, añadimos la ruta al archivo */etc/network/interfaces* mediante la línea *up route add -net ...*.

#### Ejercicio T3.2

Buscar con qué órdenes de terminal o herramientas gráficas podemos configurar bajo Windows y bajo Linux el filtrado y bloqueo de paquetes.


~> En Windows se usa el servicio de enrutamiento y acceso remoto que admite el filtrado de paquetes IP, especifica qué tipo de tráfico permite entrar y salir del enrutador.
La característica de filtrado de paquetes se basa en excepciones. Puede establecer filtros de paquetes por interfaz y configurarlos para
dejar pasar todo el tráfico excepto los paquetes prohibidos por filtros o descartar todo el tráfico excepto los paquetes permitidos por filtros.

~> En Linux la principal orden es  iptables que permite crear reglas que analizarán los paquetes de datos que entran,
salen o pasan por nuestra máquina, y en función de las condiciones que establezcamos, tomaremos una decisión que
normalmente será permitir o denegar que dicho paquete siga su curso.
