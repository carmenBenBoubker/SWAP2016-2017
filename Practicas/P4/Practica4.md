# SWAP #
## Práctica 4: Asegurar la granja web ##
### Alumnos: ###

#### Gregorio Vidoy Fajardo  ####

#### Carmen Bueno Ben Boubker  ####


### OBJETIVO ###
Esta práctica tiene como objetivo instalar un certificado SSL para configurar el acceso HTTPS a los servidores y a parte configurar las reglas del cortafuegos para proteger la granja web.

### INSTALAR UN CERTIFICADO SSL AUTOFIRMADO PARA CONFIGURAR EL ACCESO POR HTTPS ###

Vamos a proceder a generar un certificado SSL para ello vamos a activar el módulo SSL de apache, generar los certificados y especificar la ruta de los certificados en la configuración los comandos que hemos utilizado han sido:

```
a2enmod ssl
service apache2 restart
mkdir /etc/apache2/ssl
openssl req --x509 --nodes --days 365 --newkey rsa:2048 --keyout
/etc/apache2/ssl/apache.key- -out /etc/apache2/ssl/apache.crt

```
![Imagen][1.1]

*Figura 1.1:Generando he instalando certificado autofirmado server1.*

![Imagen][1.2]

*Figura 1.2:Generando he instalando certificado autofirmado server2.*


Tras esto vamos a editar el archivo de configuración del sitio default-ssl al cual vamos a añadir las siguientes líneas:

```
SSLCertificateFile /etc/apache2/ssl/apache.crt
SSLCertificateKeyFile /etc/apache2/ssl/apache.key
```
![Imagen][1.3]

*Figura 1.3:Configuracion ssl server1.*

![Imagen][1.4]

*Figura 1.4:Configuracion ssl server2.*


Tras esto activamos el sitio default-ssl y reiniciamos apache, para ello usaremos los siguientes comandos:
```
a2ensite default--ssl
service apache2 reload
```
Y ahora vamos a acceder al servidor web mediante el protocolo HTTPS.


![Imagen][1.5]

*Figura 1.5:Prueba https certificado autofirmado server1*

![Imagen][1.6]

*Figura 1.6:Prueba https certificado autofirmado server2*


Como se puede ver nos aparece en rojo el https, lo cual nos quiere decir que se trata de un certificado autofirmado.

### CONFIGURACIÓN DEL CORTAFUEGOS ###

Vamos a utilizar iptables, con la cual el usuario define reglas de filtrado de paquetes de traduccion de direcciones de red, y mantiene registros de log.
A continuación vamos a mostrar los iptables de nuestro servidor.

![Imagen][1.7]

*Figura 1.7:Iptables antes de aplicar el script en server1*


A continuación vamos a mostrar los iptables despues de ejecutar el script de nuestro servidor.

![Imagen][1.8]

*Figura 1.8:Iptables despues de aplicar el script en server1*


Despues agregamos a la configuración de inicio el script

![Imagen][1.9]

*Figura 1.9:Agregando script a inicio*


[1.1]: Imagenes/1.png
[1.2]: Imagenes/2.png
[1.3]: Imagenes/3.png
[1.4]: Imagenes/4.png
[1.5]: Imagenes/5.png
[1.6]: Imagenes/6.png
[1.7]: Imagenes/7.png
[1.8]: Imagenes/8.png
[1.9]: Imagenes/9.png
