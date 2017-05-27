# SWAP #
## Práctica 2: Clonar la información de un sitio web ##
### Alumnos: ###

#### Gregorio Vidoy Fajardo  ####

#### Carmen Bueno Ben Boubker  ####


### CREAR UN TAR CON FICHEROS LOCALES EN UN EQUIPO REMOTO ###

Una vez que sabemos la dirección IP de las dos máquinas, vamos a probar a enviar un fichero tar con el contenido de /var/www de la máquina 2 a la máquina 1, cuya dirección IP es 172.16.212.128, para ello usaremos el comando que se nos indica en el guión de la práctica 2, en su segundo apartado.

![Imagen][1.1]
*FIgura 1.1: Envío de un tgz de la máquina virtual 1 a la máquina virtual 2*

Una vez se ha realizado la transferencia de los archivos en la máquina virtual 2 aparecerá un tgz, el cual contendrá el contenido de /var/www/ de la primera máquina.

### INSTALAR LA HERRAMIENTA RSYNC ###


Ahora vamos a clonar el contenido de /var/www/ de la máquina 1 a la máquina 2, para ello haremos uso de rsync, debemos de instalarlo con sudo apt-get install rsync, pero en este caso, en mis dos máquinas virtuales ya se encuentra instalado de forma predeterminada, igualmente procedimos a instalarlo para asegurarnos de ello.

![Imagen][1.2]
*FIgura 1.2: Instalación de rsync*

Mediante el comando que se ve en el apartado 3, de la práctica 2, clonaremos el contenido.

![Imagen][1.3]
*FIgura 1.3: Comando utilizado para clonar el contenido de /var/www*

### ACCESO SIN CONTRASEÑA PARA SSH ###

Para poder usar ssh sin la necesidad de tener que poner la contraseña cada vez que lo usemos tendremos que usar el comando “ssh-keygen –t dsa” dsa se nos detalla en el guión que es lo que significa y qué ficheros genera.
Debemos de copiar el archivo id_dsa.pub generado a la máquina 1, para que la tenga y podamos conectarnos de forma que no tengamos que poner la contraseña.

![Imagen][1.4]
*Figura 1.4: Comando utilizado para copiar el fichero id_dsa.pub*

Una vez realizado esto deberíamos de poder conectarnos a la máquina 1 sin necesidad de poner la contraseña.

![Imagen][1.5]
*Figura 1.5: Conexión por ssh sin contraseña.*

Una vez que todo ha ido bien podemos clonar periódicamente cosas en la máquina 2, sin necesidad de estar pendientes, por lo que todo se podrá automatizar, como veremos a continuación.

### PROGRAMAR TAREAS CON CRONTAB ###

En este apartado lo que haremos será editar el archivo /etc/crontab para que haga una copia del directorio /var/www/ cada hora. Para ello usaremos la orden “nano /etc/crontab” y tendremos el fichero que tendremos que modificar.

![Imagen][1.6]
*FIgura 1.6: Programación para la copia de del directorio a las 12 de la noche.*


En esta última figura se puede observar que hay un comando rsync, este comando ha sido el que he utilizado para que haga la copia de /var/www/.

[1.1]: Imagenes/envioTgz.png
[1.2]: Imagenes/instalacionRsync.png
[1.3]: Imagenes/ClonarCarpeta.png
[1.4]: Imagenes/generandoClaveYenviandolaAlOtroEquipo.png
[1.5]: Imagenes/sshSinContraseña.png
[1.6]:Imagenes/programoLaCopiaDelDirectorioAlas0_00.png
