
# EJERCICIOS TEMA 7

###### Nombre : Carmen Bueno Ben Boubker
###### Asignatura : Servidores Web de Altas Prestaciones (SWAP)



#### Ejercicio T7.1

###### ¿Qué tamaño de unidad de unidad RAID se obtendrá alconfigurar un RAID 0 a partir de dos discos de 100 GB y 100 GB?

Se obtendrá un tamaño de 200 GB porque el RAID0 aumenta la capacidad del disco final sumandose las dos.

###### ¿Qué tamaño de unidad de unidad RAID se obtendrá al configurar un RAID 0 a partir de tres discos de 200 GB cada uno?

Seria el mismo caso de antes a diferencia que tenemos tres discos de 200, por lo tanto seria la suma de los tres(200+200+200) dando 600 GB.

#### Ejercicio T7.2

###### ¿Qué tamaño de unidad de unidad RAID se obtendrá al configurar un RAID 1 a partir de dos discos de 100 GB y 100 GB?

Como característica especial del RAID1 es crea una copia exacta (o espejo) de un conjunto de datos en dos o más discos por lo tanto el tamaño del RAID será de 100GB .

###### ¿Qué tamaño de unidad de unidad RAID se obtendrá al configurar un RAID 1 a partir de tres discos de 200 GB cada uno?

Siendo el mismo caso que antes el tamaño es 200 GB.

#### Ejercicio T7.3

Buscar información sobre los sistemas de ficheros en red más utilizados en la actualidad y comparar sus características. Hacer una lista de ventajas e inconvenientes de todos ellos, así como grandes sistemas en los que se utilicen.

Configurar en una máquina virtual un servidor NFS. Montar desde otra máquina virtual en la misma subred la carpeta exportada y comprobar que ambas pueden acceder a la misma para lectura y escritura.

**Algunos sistemas de archivos de red son:**


- **SMB/CIFS**:Es el sistema nativo de Windows.Permite navegar por los recursos ofrecidos y está orientado al funcionamiento en LAN.
- **NFS**:Es el sistema nativo de Unix.No está pensado para navegar por los recursos y funciona en WAN.
- **Coda**:El cliente guarda de forma local los ficheros de trabajo, para asegurar la disponibilidad cuando no existe conexión de red.
- **Intermezzo**:Inspirado en Coda pero diseñado de nuevo.
- **Lustre**:Nuevo desarrollo destinado a supercomputación. Para grandes clusters o procesadores masivamente paralelos (MPP).




**NFS - Network File System**

NFS permite que un servidor exporte un sistema de ficheros, y uno o varios clientes, lo monten para utilizarlo como un sistema de ficheros local. La comunicación entre el servidor y el cliente se realiza a través de la red, utilizando el protocolo NFS. El sistema de ficheros de disco que utiliza físicamente el servidor es irrelevante para el cliente.

NFS es enrutable, de manera que el servidor y el cliente pueden estar en diferentes redes comunicadas por un conjunto de routers.



**SMB/CIFS - Server Message Block/Common Internet File System**

El protocolo SMB fue diseñado originalmente por IBM, pero actualmente la versión más extendida del mismo es la implementada por Microsoft en sus sistemas operativos, hoy en día denominada CIFS. En Unix existe el servicio Samba que implementa un servidor y cliente para SMB/CIFS.

Entre las características del protocolo encontramos:

- Permite compartir sistemas de archivos e impresoras
- Tradicionalmente ha utilizado NetBIOS/NetBEUI aunque las versiones nuevas pueden funcionar encima de TCP/IP. Cuando no se utiliza     TCP/IP no existe posibilidad de enrutado, de manera que cliente y servidor deben estar en la misma red.
- El servicio permite explorar la red para descubrir máquinas y recursos compartidos.
- Tradicionalmente se ha utilizado una resolución de nombres WINS, aunque en las versiones nuevas (a partir de Windows 2000) se ha relegado en favor de DNS y Active Directory.


**Otras opciones: Coda / Intermezzo / Lustre**

Los sistemas de ficheros en red Coda e InterMezzo intentan dar soporte a dispositivos móviles que se conectan/desconectan con frecuencia de la red. Para permitir el funcionamiento de los clientes durante las desconexiones de red, estos guardan una copia local (caché) del sistema de archivos remoto. Cuando se restablece la conexión de red, los clientes envian los cambios locales al servidor. En este proceso pueden surgir conflictos (cuando dos o más clientes han hecho cambios locales sobre los mismos datos e intentan actualizar el servidor).

El sistema de archivos en red Lustre es el nuevo proyecto en el que participan los desarrolladores de InterMezzo, está destinado a la supercomputación y
tiene por objetivo conseguir un gran rendimiento al tiempo que resuelve las necesidades de almacenamieno de grandes clusters o máquinas masivamente paralelas.
