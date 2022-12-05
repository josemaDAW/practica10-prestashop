#!/bin/bash

#Para mostrar los comandos que se van ejecutando
set -x

#Actualizamos los repositorios
apt update

#Actualizamos los paquetes
apt upgrade -y

#Instalación del servidor web Apache
apt install apache2 -y

#Instalamos PGP y los módulos necesarios
apt install php libapache2-mod-php php-mysql -y

# Copiar el archivo de configuración de apache
cp ../conf/000-default.conf /etc/apache2/sites-available/000-default.conf

# Reiniciamos el servicio de Apache 2
systemctl restart apache2