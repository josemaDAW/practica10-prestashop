#!/bin/bash

#Para mostrar los comandos que se van ejecutando
set -x

# Definimos la variables de configuración
source variables.sh

# Descargamos el código fuente de presta
wget https://github.com/PrestaShop/PrestaShop/releases/download/8.0.0/prestashop_8.0.0.zip --output-document /tmp/presta.zip

# Acttualizamos los repositorios
apt update

#Instalamos el descompresor de paquetes zip si no está instalado
apt install unzip -y

# Eliminamos si hubiese alguna instalación anterior
#rm -rf /var/www/html/wordpress
# rm -rf /tmp/presta.zip
rm -rf /tmp/prestashop.zip
rm -rf /tmp/Install_PrestaShop.html
rm -rf /tmp/index.php 

# Descomprimimos el archivo .zip con el código fuente
#unzip /tmp/wordpress.zip -d /var/www/html
unzip /tmp/presta.zip -d /tmp/presta


#Movemos el código fuente al directorio de apache
mv /tmp/presta/* /var/www/html

#borramos el prestashop.zip
rm -rf /tmp/presta.zip
rm -rf /tmp/presta