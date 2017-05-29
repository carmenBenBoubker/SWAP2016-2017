# SWAP #
## Práctica 6: Discos en RAID ##
### Alumnos: ###

#### Gregorio Vidoy Fajardo  ####

#### Carmen Bueno Ben Boubker  ####

### CONFIGURACIÓN DEL RAID POR SOFTWARE ###

Como primer paso debemos instalar el software necesario para configurar el raid, para ello utilizaremos el siguiente comando:
```
sudo apt-get install mdadm
```
![Imagen][1.1]

*Figura 1.1:.Instalacion de mdadm*

Una vez instalado mdadm vamos a proceder a ejecutar
```
fdisk-l
```
para ver la información relativa a las particiones que tenemos.

![Imagen][1.2]

*Figura 1.2:Mostramos la informacion sobre las particiones.*

![Imagen][1.3]

*Figura 1.3:Particiones del sistema.*

Este comando solamente nos devuelve lo que se encuentra en  /dev/sda, ahora vamos a proceder a la creación del RAID 1 con el siguiente comando:
```
sudo mdadm -C /dev/md0 --level=raid1 --raid-devices=2 /dev/sdb /dev/sdc
```
![Imagen][1.4]

*Figura 1.4:Creacion de RAID 1.*

Una vez creado, vamos a pasar a darle formato antes de reiniciar la máquina, para ello usaremos el siguiente comando:
```
sudo mkfs /dev/md0
```
![Imagen][1.5]

*Figura 1.5:Formateado del raid.*

Ahora vamos a pasar a crear el directorio donde se montará nuestra unidad RAID, para ello utilizaremos los siguientes comandos:
```
sudo mkdir /dat
sudo mount /dev/md0 /dat
```
Y para comprobar que el proceso se ha realizado de manera correcta utilizaremos el siguiente comando:
```
sudo mount
```
![Imagen][1.6]

*Figura 1.6:Creamos el punto de montage y lo comprobamos.*

Y para comprobar el estado del RAID utilizaremos el siguiente comando:

```
sudo mdadm --detail /dev/md0
```
![Imagen][1.7]

*Figura 17:Comprobamos el estado del RAID.*


Para obtener los UUID de todos los dispositivos de almacenamiento vamos a ejecutar el siguiente comando:
```
ls -l /dev/disk/by-uuid/
```
![Imagen][1.8]

*Figura 1.8:Obtenemos los UUID de los dispositivos de almacenamiento.*

Vamos a modificar el archivo  
```
/etc/fstab
```
para que monte el dispositivo RAID automaticamente

![Imagen][1.9]

*Figura 1.9:.Abrimos el fstab*

![Imagen][1.10]

*Figura 1.10:Modificacion para el Raid se monte automaticamente.*

Ahora vamos a simular un fallo en uno de los discos, para ello ejecutaremos el siguiente comando:
```
sudo mdadm --manage --set-faulty /dev/md0 /dev/sdb
```

![Imagen][1.11]

*Figura 1.11:.Simulamos un fallo en el disco sdb.*

Para ver los detalles de qué es lo que ha pasado utilizaremos el comando:
```
sudo mdadm --detail /dev/md127
```
![Imagen][1.12]

*Figura 1.12:Vemos la información del raid.*

Por último  vamos a añadir un nuevo disco en caliente, para ello utilizaremos el siguiente comando:
```
sudo mdadm --manage --add /dev/md0 /dev/sdb
```
Y volveremos a utilizar el comando mencionado con anterioridad para ver los detalles.

![Imagen][1.13]

*Figura 1.13:Vemos la información del raid.*

[1.1]: Imagenes/1.jpg
[1.2]: Imagenes/2.jpg
[1.3]: Imagenes/3.jpg
[1.4]: Imagenes/5.jpg
[1.5]: Imagenes/6.jpg
[1.6]: Imagenes/7.jpg
[1.7]: Imagenes/8.jpg
[1.8]: Imagenes/9.jpg
[1.9]: Imagenes/10.jpg
[1.10]: Imagenes/11.jpg
[1.11]: Imagenes/13.jpg
[1.12]: Imagenes/14.jpg
[1.13]: Imagenes/15.jpg
