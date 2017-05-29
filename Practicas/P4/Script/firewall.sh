#!/bin/bash
# (1) Eliminar todas las reglas (configuración limpia) iptables -F
iptables -X
iptables -Z
iptables -t nat -F
# (2) Política por defecto: denegar todo el tráfico 
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP
# (3) Permitir cualquier 
iptables -A INPUT -i lo 
iptables -A OUTPUT -o lo
# (4) Abrir el puerto 22
iptables -A INPUT -p tcp --dport 22 -j ACCEPT 
iptables -A OUTPUT -p tcp --sport 22 -j ACCEPT
# (5) Abrir los puertos HTTP (80) de servidor web 
iptables -A INPUT -p tcp --dport 80 -j ACCEPT 
iptables -A OUTPUT -p tcp --sport 80 -j ACCEPT
