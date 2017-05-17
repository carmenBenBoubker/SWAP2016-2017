
#EJERCICIOS TEMA 2

#Nombre : Carmen Bueno Ben Boubker
#Asignatura : Servidores Web de Altas Prestaciones (SWAP)



Ejercicio T2.1

Calcular la disponibilidad del sistema si tenemos dos réplicas de cada elemento (en total 3 elementos en cada subsistema)


Para calcular la disponibilidad de un sistema de N componentes, procedemos a utilizar la siguiente formula:

As = Ac1 * Ac2 * Ac3 * ... * Acn

En nuestro caso para resolver nuestro problema vamos a utilizar la siguiente:  As = Ac1 + (1-Ac1) * Ac2

~>Component: Web

Web_2= 0.85+(1-0.85)*0.85 = 0.9775 (97.75%)
Web_3= 0.9775+(1-0.9775)*0.85 = 0.9966

~>Component: Application

App_2= 0.9+(1-0.9)*0.9 = 0.99
App_3= 0.99+(1-0.99)*0.9 = 0.999

~>Component: Database

Db_2=0.999+(1-0.999)*0.999 = 0.99999
Db_3=0.99999+(1-0.99999)*0.999 = 0.9999999

~>Component: DNS

DNS_2= 0.98+(1-0.98)*0.98 = 0.9996
DNS_3 0.9996+(1-0.9996)*0.98 = 0.9999

~>Component: Firewall

Firewall_2= 0.85+(1-0.85)*0.85 = 0.9775
Firewall_3= 0.9775+(1-0.9775)*0.85 = 0.9966

~>Component: Switch

Switch_2= 0.99+(1-0.99)*0.99= 0.9999
Switch_3= 0.9999+(1-0.9999)*0.99= 0.999999


~>Component: Data Center

DC_2= 0.9999+(1-0.9999)*0.9999 = 0.99999999
DC_3= 0.99999999+(1-0.99999999)*0.9999 = 0.999999999999

~> Component: ISP

ISP_2= 0.95+(1-0.95)*0.95 = 0.9975
ISP_3= 0.9975+(1-0.9975)*0.95 = 0.999875

Ahora vamos a proceder a calcular la disponibilidad del sistema:

As = Web_3*App_3*Db_3*DNS_3*Firewall_3*Switch_3*DC_3*ISP_3 = 0.9908

Por lo tanto la solución a nuestro problema sería: 99.08%



Ejercicio T2.2

Buscar frameworks y librerías para diferentes lenguajes que permitan hacer aplicaciones altamente disponibles con relativa facilidad.

~> Ruby: Lotus, Nyny, Grape, Pakyow, Celluloid.
~> PHP : Medoo, Flight, Phpixie, Yii, Codeigniter, Laravel, Phalcon, Kohana.
~> Python: Django, Web2py, TurboGears, Webapp2, CubicWeb, Grok, Giotto.
~> Javascript: Dojo, EachJS, Echo3, Ember.js, Kendo UI , Pyjamas, Qooxdoo.



Ejercicio T2.3

¿Cómo analizar el nivel de carga de cada uno de los subsistemas en el servidor? Buscar herramientas y aprender a usarlas....¡o recordar cómo usarlas!

Algunas de las herramientas son:

* Pingdom Tools.
* GTmetrix.
* WebPageTest.
* Google Page Speed.
* YSlow.

Entre las herramientas más importantes podemos encontrar:

~> Google PageSpeed Insights: es una herramienta de análisis que ofrece Google que sirve para aumentar el rendimiento de tu sitio web.
Basta introducir la URL del sitio para que genere un reporte personalizado con un listado de sugerencias para mejorar el tiempo de carga en navegadores de escritorio y en dispositivos móviles. Dispone de extensiones para Firefox y Chrome.


Ejercicio T2.4

Apartado a) Buscar ejemplos de balanceadores software y hardwareV(productos comerciales).

Balanceadores software :

~> Zen Load Balancer
~> nginx
~> Octopus Load Balancer
~> Apache: mod_proxy_balancer

Balanceadores hardware

~> Barracuado Load Balancer ADC
~> Radware AppDirector OnDemand Switch Series
~> Cisco
~> LoadMaster 2600

Apartado b)Buscar productos comerciales para servidores de aplicaciones.

~> Servidor de aplicaciones Microsoft
~> Oracle WebLogic Server
~> WebSphere Application Server
~> GlassFish Server

Apartado c)Buscar productos comerciales para servidores de almacenamiento.

~> Servidor almacenamiento DELL
~> HP ConvergedSystem 200-HC StoreVirtual System
~> IBM EXP2500 Storage Enclosure
