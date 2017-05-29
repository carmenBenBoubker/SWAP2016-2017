
# EJERCICIOS TEMA 6

###### Nombre : Carmen Bueno Ben Boubker
###### Asignatura : Servidores Web de Altas Prestaciones (SWAP)



#### Ejercicio T6.1

Aplicar con iptables una política de denegar todo el tráfico en una de las máquinas de prácticas.

Comprobar el funcionamiento.

Aplicar con iptables una política de permitir todo el tráfico en una de las máquinas de prácticas.

Comprobar el funcionamiento.

**Para denegar todo el trafico, utilizamos el comando:**

*iptables -A INPUT -j DROP* El fichero prueba.html ubicado en /var/www no se descarga.

**Para aceptar todo el trafico, utilizamos el comando:**

*iptables -A INPUT -j ACCEPT* El fichero prueba.html ubicado en /var/www se descarga.

#### Ejercicio T6.2

Comprobar qué puertos tienen abiertos nuestras máquinas, su estado, y qué programa o demonio lo ocupa.

Con *cat /etc/services* podemos ver el listado con los servicios de red del sistema.

Para comprobar qué servicios están activos y a la escucha en nuestro sistema Linux, utilizaremos netstat
 -a o con la opción -ap para mostrar qué programas están asociados a las conexiones activas.

#### Ejercicio T6.3

Buscar información acerca de los tipos de ataques más comunes en servidores web (p.ej. secuestros de sesión). Detallar en qué consisten, y cómo se pueden evitar.

##### Ataques mas comunes:

**Ataque Por Injection**:es una técnica para modificar una cadena de consulta de base de datos mediante la inyección de código en la consulta.
 El SQLI explota una posible vulnerabilidad donde las consultas se pueden ejecutar con los datos validados.

**DDoS**: es una las formas más comunes para congelar el funcionamiento de un sitio web. Estos son los intentos de inundar un sitio con solicitudes externas, por lo que ese sitio no podría estar disponible para los usuarios reales. Los ataques de denegación de servicio por lo general se dirigen a puertos específicos, rangos de IP o redes completas,
pero se pueden dirigir a cualquier dispositivo o servicio conectado.

**Fuerza Bruta**: Estos son básicamente intenta “romper” todas las combinaciones posibles de nombre de usuario + contraseña en una página web. Los ataques de fuerza bruta buscan contraseñas débiles para ser descifradas y tener acceso de forma facil.

**Cross Site Scripting**: Los atacantes utilizan Cross-site Scripting (XSS) para inyectar scripts maliciosos en lo que serían sitios web inofensivos. Debido a que estos scripts parecen provenir de sitios web de confianza, el navegador de los usuarios finales casi siempre ejecuta la secuencia de comandos, la concesión de los piratas informáticos el acceso a la
 información contenida en las cookies o tokens de sesión utilizados con ese sitio.




##### Metodos de defensa:

Se debe revisar la configuración de Routers y Firewalls para detener  IPs inválidas así como también el filtrado de protocolos que no sean necesarios. Algunos firewalls y routers proveen la opción de prevenir inundaciones (floods) en los protocolos TCP/UDP. Además es aconsejable habilitar la opción de logging (logs) para llevar un control adecuado de las conexiones que existen con dichos routers.


Cómo medida de respuesta es muy importante contar con un plan de respuesta a incidentes. Si ocurre algún hecho de este tipo, cada persona dentro de la organización debería saber cuál es su función específica.

Otras de las alternativas que se deben tener en cuenta es la solicitud ayuda al Proveedor de Servicios de Internet (ISP). Esto puede ayudar a bloquear el tráfico más cercano a su origen sin necesidad de que alcance a la organización.
En caso de contar con IDS/IPS (intrusión-detection/prevention system), estos pueden detectar el mal uso de protocolos válidos como posibles vectores de ataque. Se debe tener en cuenta, además, la configuración de estas herramientas.


En el caso de DDos existe el DDoS Kona Site Defender mitiga los ataques DDoS por medio de la absorción del tráfico DDoS
dirigido al nivel de aplicación, el desvío de todo el tráfico DDoS dirigido al nivel de red, como inundaciones SYN o inundaciones UDP, y la autenticación del tráfico válido en el extremo de la red. Esta solución de protección integrada está "siempre activada" y únicamente se permite tráfico en el puerto 80 (HTTP) o el puerto 443 (HTTPS).
