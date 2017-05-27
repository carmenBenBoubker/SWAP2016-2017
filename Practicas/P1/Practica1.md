# SWAP #
## Práctica 1: Preparación de las herramientas ##
### Alumnos: ###

#### Gregorio Vidoy Fajardo  ####

#### Carmen Bueno Ben Boubker  ####



Tras instalar las dos máquinas Linux con el Ubuntu Server 12.04.1 LTS, en ambas vamos a realizar una instalación completa de servidor web: Apache + PHP + MySQL. El proceso de instalación se detalla en:

http://www.ubuntugeek.com/step-by-step-ubuntu-12-04-precise-lamp-server-setup.html

En cierto punto del proceso, debemos indicarle que instale los servicios de SSH y LAMP (para disponer de acceso remoto y del servidor web):

![Imagen][1.1]
*Figura 1.1:Selección de los programas a instalar.*

Tras la instalación de cada máquina, conviene anotar la dirección IP de la máquina virtualizada en la red virtual que se ha creado.
También, y de cara a las siguientes prácticas, conviene activar la cuenta de root. De esta forma, luego podremos acceder como superusuario de una máquina a otra, copiar contenidos con todos los permisos, etc. Así pues, ejecutamos en ambas máquinas el siguiente comando:

```sudo passwd root```

Si durante la instalación no marcamos la opción “LAMP” entre los servicios a instalar, debemos instalar Apache, PHP y MySQL de forma manual. Para ello, podemos seguir el tutorial ofrecido en:

http://www.vensign.com/como-instalar-servidor-lamp-ubuntu-paso-a-paso.html

Concretamente, podemos ejecutar el siguiente comando si no se ha realizado la instalación:

```sudo apt-get install apache2 mysql-server php5 libapache2-mod-php5 php5-mysql```

Una vez finalizada la instalación (mediante cualquiera de los métodos disponibles) comprobaremos la versión del servidor ejecutando:

```apache2 -v```

y para ver si está en ejecución:

~~~
ps aux | grep apache
~~~

A continuación mostramos una imagen del funcionamiento de este en ambas máquinas virtuales.

![Imagen][1.2]
*Figura 1.2: Versión y funcionamiento de apache en maquina virtual 1.*

![Imagen][1.3]
*Figura 1.3: Versión y funcionamiento de apache en maquina virtual 2.*

Conviene así mismo disponer en ambas máquinas el comando cURL para comprobar que el servidor web está activo.
cURL es una herramienta de línea de comandos para transferir archivos con sintaxis URL que soporta diferentes protocolos. El uso habitual es automatizar transferencias de archivos o secuencias de operaciones no supervisadas. Por ejemplo, se suele usar como herramienta para simular las acciones de un usuario en un navegador web, pero a base de comandos. Hay versiones para casi cualquier sistema operativo:

```http://curl.haxx.se/download.html```

En Linux podemos usar apt-get para instalarlo, pero si queremos disponer de una versión estática, podemos bajarla de
http://www.magicermine.com/demos/curl/curl/curl.html
Asimismo, si queremos una versión para Windows, la tenemos en
http://www.paehl.com/open_source/?CURL_7.28.1
Una vez que tengamos las máquinas instaladas y los servidores LAMP configurados, comprobaremos que Apache está funcionando. Para ello, usando un editor de texto plano, crearemos el archivo HTML llamado hola.html en el directorio /var/www

~~~
<HTML>
  <BODY>
    Esto funciona :)
  </BODY>
</HTML>
~~~
y accederemos a él usando cURL con el comando:

    curl http://direccionIPdelservidor/hola.html

Por supuesto, debemos indicar la dirección IP de nuestra máquina servidora virtualizada. Otro posible uso de cURL es descargar un archivo, en lugar de que nos lo muestre por salida estándar. Para ello, haremos:

    curl -o imagen.png https://www.google.es/images/srpr/logo3w.png

A continuación se muestran las imagenes del funcionamiento de apache y el comando cURL, junto a las direcciones ip de cada una de nuestras máquinas.

![Imagen][1.4]
*Figura 1.4:DIrección IP y funcionamiento de cURL en maquina virtual 1.*

![Imagen][1.5]
*Figura 1.5:DIrección IP y funcionamiento de cURL en maquina virtual 2*

[1.1]: Imagenes/1.png
[1.2]: Imagenes/1ubuntuapache.png
[1.3]: Imagenes/2ubuntuapache.png
[1.4]: Imagenes/1ubuntuip:curl.png
[1.5]: Imagenes/2ubuntuip:curl.png
