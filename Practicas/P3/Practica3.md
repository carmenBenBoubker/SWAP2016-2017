# SWAP #
## Práctica 3: Balanceo de carga ##
### Alumnos: ###

#### Gregorio Vidoy Fajardo  ####

#### Carmen Bueno Ben Boubker  ####

### PREPARANDO EL BALANCEADOR ###

Lo primero que tendremos que hacer en esta práctica es crear una nueva máquina virtual
sin el servidor web Apache, la crearemos e instalaremos Ubuntu Server 12.04 LTS como
vimos en la práctica 1, salvo que en esta ocasión no instalaremos LAMP.
Una vez realizado todo el proceso de instalación de Ubuntu Server, procederemos a
instalar nginX. Para ello vamos a utilizar los siguientes comandos:

```
cd /tmp/
wget http://nginx.org/keys/nginx_signing.key
apt-key add /tmp/nginx_signing.key
rm -f /tmp/nginx_signing.key

```
Con los estos comandos lo que hemos hecho es importar la clave del repositorio de software.
Una vez importada la clave del repositorio, lo añadiremos al fichero /etc/apt/sources.list para ello utilizaremos los siguientes comandos:

```
echo "deb http://nginx.org/packages/ubuntu/ lucid nginx" >> /etc/apt/sources.list
echo "deb-src http://nginx.org/packages/ubuntu/ lucid nginx" >> /etc/apt/sources.list
```
Una vez realizado esto procederemos a la instalación de nginx, para lo cual usaremos los siguientes comandos:

```
apt-get update
apt-get install nginx
```
Tras esto tendremos nginx instalado en nuestra máquina virtual.


![Imagen][1.1]

*Figura 1.1:Ejecucion tras instalacio Nginx.*


### BALANCEO DE CARGA USANDO NGINX CON ROUND-ROBIN ###

Es importante definir en el archivo de configuración de nginx qué máquinas formarán el
cluster, dicho fichero que modificaremos usando el editor de texto, nano, es:

```
/etc/nginx/conf.g/default.conf
```

Procederemos a configurar nginx mediante el algoritmo de round-robin, el cual consiste en asignar la misma prioridad a todos los servidores.

![Imagen][1.2]

*Figura 1.2:Configuracion Nginx.*

Ahora reiniciamos el servicio nginx mediante el comando
```
sudo service nginx restart
```
y si todo está bien configurado no nos dará ningún error.

A continuación se muestra a el servicio nginx balanceando.

![Imagen][1.3]

*Figura 1.3:AB Nginx balanceando.png.*

### PREPARANDO EL BALANCEADOR HAPROXY ###

Instalar haproxy es muy sencillo, pues bastaría con usar el comando
```
apt-get install haproxy
```
estando registrados como superusuarios.
Una vez que la instalación está realizada de forma satisfactoria, tendremos que configurar haproxy, puesto que su configuración por defecto no nos sirve.

### CONFIGURACIÓN BÁSICA DE HAPROXY COMO BALANCEADOR ###

Trás la instalación de haproxy vamos a pasar a realizar la configuración de esté, para ello vamos a modificar el archivo siguiente:
```
/etc/haproxy/haproxy.cfg
 ```
Para modificar dicho archivo utilizaremos los siguientes comandos:
```
cd /etc/
cd haproxy/
ifconfig
nano haproxy.cfg
```
![Imagen][1.4]

*Figura 1.4:AB Configuracion haproxy.*

### COMPROBAR EL FUNCIONAMIENTO DEL BALANCEADOR ###

Una vez que está establecida la configuración de haproxy, hay que arrancarlo, para ello se usa el comando
```
/usr/sbin/haproxy -f /etc/haproxy/haproxy.cfg
```
Si no nos muestra ningún mensaje de error es que todo ha ido bien, por lo cual ya podemos probar a realizar peticiones. Como se puede ver a continuación.

![Imagen][1.5]

*Figura 1.5:Haproxy balanceando.*

![Imagen][1.6]

*Figura 1.6:AB Haproxy balanceando.*

### PARTE OPCIONAL ###

Nosotros para la parte opcional hemos elegido realizar la instalación y configuración de Pound. A continuación se explicará como lo hemos realizado.

Para la instalación hemos ejecutado los siguientes comandos:

```
apt-get update
apt-get install pound -y
```

Tras la instalación, vamos a realizar la configuración del fichero “pound.cfg” con el siguiente siguiente comando.
```
nano /etc/pound/pound.cfg
```

#### CONFIGURACION ####
```
User "www-data"
Group "www-data"
# log level (max: 5)
LogLevel 3
# specify LogFacility
LogFacility local1
# interval of heartbeat - seconds
Alive 30
Control "/var/run/pound/poundctl.socket"

# define frontend
ListenHTTP
    Address 127.0.0.1
    Port 80
End

# define backend
Service
    BackEnd
        Address  172.16.212.129
        Port     80
        Priority 5
    End

    BackEnd
        Address  172.16.212.128
        Port     80
        Priority 5
    End
End



systemctl start pound

```
A continuación veremos qué configuración le hemos asignado:

![Imagen][1.7-1]

*Figura 1.7-1:AB Configuracion pound.*

![Imagen][1.7-2]

*Figura 1.7-2:AB Configuracion pound.*

Una vez que está establecida la configuración de pound, hay que arrancarlo, para ello se usa el comando
```
systemctl start pound
```
Si no nos muestra ningún mensaje de error es que todo ha ido bien, por lo cual ya podemos probar a realizar peticiones. Como se puede ver a continuación.

![Imagen][1.8]

*Figura 1.8:Pound balanceando.*

![Imagen][1.9]

*Figura 1.9:AB pound.*



#### FUENTE ####

https://www.linuxhelp.com/how-to-configure-load-balancer-with-pound-in-ubuntu/




[1.1]:Imagenes/1EjecucionTrasInstalacioNginx.png
[1.2]: Imagenes/2ConfiguracionNginx.png
[1.3]: Imagenes/3ABNginxBalanceando.png
[1.4]: Imagenes/5configuracionHaproxy.png
[1.5]: Imagenes/6haproxyBalanceando.png
[1.6]:Imagenes/7ABhaproxybalanceando.png
[1.7-1]:Imagenes/8-1OptativoConfiguracionPund.png
[1.7-2]:Imagenes/8-2OptativoConfiguracionPund.png
[1.8]:Imagenes/9OptativoPoundBalanceando.png
[1.9]:Imagenes/10OptativoABpound.png
