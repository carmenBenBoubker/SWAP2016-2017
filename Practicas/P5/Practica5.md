# SWAP #
## Práctica 5: Replicación de bases de datos MySQL ##
### Alumnos: ###

#### Gregorio Vidoy Fajardo  ####

#### Carmen Bueno Ben Boubker  ####

### CREAR UNA BD E INSERTAR DATOS  ###

Lo primero que debemos de hacer es crearnos una base de datos en MySQL, para ello seguiremos los pasos descritos en el guión de la práctica.
Para empezar vamos a crearnos una base de datos usando el siguiente comando:

```
create database contactos
```

Tras ello vamos a seleccionar dicha tabla para trabajar con ella, para ello utilizaremos el siguiente comando,
```
use contactos
```
para ver que tiene nuestra base de datos utilizamos el siguiente comando
```
show tables
```
el cual nos mostrara que nuestra base de datos esta vacía, por lo cual tendremos que llenar nuestra base de datos, para ello utilizaremos el siguiente comando:
```
create table datos(nombre varchar(100), tlf int)
```
Por último vamos a proceder a introducir datos es nuestra tabla, para ello utilizaremos el siguiente comando.
```
insert into datos(nombre,tlf) values ("pepe",95834987);
```
![Imagen][1.1]

*Figura 1.1:Creando base de datos server 1.*

### REPLICAR UNA BD MY SQL CON MYSQLDUMP ###


Para empezar debemos saber que mysqldump es una herramienta de clonado de bases de datos. Su sintaxis de uso es:
```
mysqldump ejemplodb -u root -p > /root/ejemplodb.sql
```
El primer paso para el clonado de la base de datos, es bloquear la base de datos para evitar que alguien acceda y cambie contenido. Una vez realizado esto vamos a utilizar mysqldump para clonar los datos.

![Imagen][1.2]

*Figura 1.2:Bloqueo de tablas y copia de base de datos contactos server1 mysqldump.*


Ahora procedemos a desbloquear las tablas, para ello accederemos a mySQL y haremos uso del comando
```
Unlock tables
```

![Imagen][1.3]

*Figura 1.3:Desbloqueo tablas server 1.*

Ahora tendremos que llevar la copia de la base de datos a nuestra segunda maquina, para ello usaremos el comando scp.


![Imagen][1.4]

*Figura 1.4:Copiamos la copia de segurida en el server2.*


Como mysqldump no tiene comando para crear bases de datos, tendremos que crearla nosotros y tras esto restauraremos la base de datos contactos a partir del fichero que hemos copiado


![Imagen][1.5]

*Figura 1.5:Creamos la base de datos en el server2 y cargamos la copia de seguridad.*

![Imagen][1.6]

*Figura 1.6:Comprobamos que la copia de seguridad se ha restaurado.*

### REPLICACIÓN DE BD MEDIANTE UNA CONFIGURACIÓN MAESTRO-ESCLAVO ###

Lo primero que vamos a hacer es configurar el mysql del maestro, para ello vamos a editar el fichero my.cnf, en el incluiremos las modificaciones explicadas en el guión de prácticas.
Para comenzar comentaremos el siguiente parámetro:
```
#bind-address 127.0.0.1
```
A posteriori indicaremos el archivo donde queremos almacenar el log de errores.
```
log_error = /var/log/mysql/error.log
```
Continuaremos estableciendo el identificador del servidor
```
server-id = 1
```
Y por último el registro binario
```
log_bin = /var/log/mysql/bin.log
```

Tras estas modificaciones guardaremos el documento y reiniciamos el servicio con el siguiente comando:
```
/etc/init.d/mysql restart
```
![Imagen][1.7-2]

*Figura 1.7-1:Configuracion Maestro server1.*

![Imagen][1.7-1]

*Figura 1.7-2:Configuracion Maestro server1.*

![Imagen][1.8]

*Figura 1.8:Reiniciando el servicion de Mysql en server1 sin errores.*

Tras realizar la configuración del maestro al no darnos ningún tipo de error, vamos a proceder a realizar la configuración del esclavo.
La configuración de este es similar a la del maestro.
```
server-id = 2
```

![Imagen][1.9-2]

*Figura 1.9-1:Configuracion ESCLAVO server2*

![Imagen][1.9-1]

*Figura 1.9-2:Configuracion ESCLAVO server2*


Vamos a proceder a reiniciar el servicio con el mismo comando que utilizamos para el maestro.

![Imagen][1.10]

*Figura 1.10:Reiniciando el servicion de Mysql en server1 sin errores*


Tras realizar la configuración del maestro y el esclavos vamos a proceder a crear un usuario y darle permisos de acceso para la replicación en el maestro.


![Imagen][1.11]

*Figura 1.11:Configuramos el usuario maestro en el server1*

A posteriori tendremos que asignarle al esclavo los datos del maestro

![Imagen][1.12]

*Figura 1.12:Agregamos los datos del maestro al esclavo*

Por último vamos a arrancar el esclavo y activar las tablas en el maestro para que puedan meterse nuevos datos desde este

![Imagen][1.13]

*Figura 1.13:Arrancamos el esclavo en el server2*


![Imagen][1.14]

*Figura 1.14:Desbloqueamos las tablas en el server1*



[1.1]: Imagenes/1.png
[1.2]: Imagenes/2.png
[1.3]: Imagenes/3.png
[1.4]: Imagenes/4.png
[1.5]: Imagenes/5.png
[1.6]: Imagenes/6.png
[1.7-1]: Imagenes/7-1.png
[1.7-2]: Imagenes/7-2.png
[1.8]: Imagenes/8.png
[1.9-1]: Imagenes/9-1.png
[1.9-2]: Imagenes/9-2.png
[1.10]: Imagenes/10.png
[1.11]: Imagenes/11.png
[1.12]: Imagenes/12.png
[1.13]: Imagenes/13.png
[1.14]: Imagenes/14.png
