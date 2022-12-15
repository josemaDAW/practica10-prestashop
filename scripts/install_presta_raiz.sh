#!/bin/bash

#Para mostrar los comandos que se van ejecutando
set -x

# Definimos la variables de configuración
source variables.sh

# Eliminamos si hubiese alguna instalación anterior
rm -rf /tmp/presta.zip

# Descargamos el código fuente de wordpress
wget https://github.com/PrestaShop/PrestaShop/releases/download/8.0.0/prestashop_8.0.0.zip --output-document /tmp/presta.zip

# Acttualizamos los repositorios
apt update

#Instalamos el descompresor de paquetes zip si no está instalado
apt install unzip -y

#Borramos presta (Esto es para cuando queramos lanzar el scripts todas las veces que quereamos y no se quede parado)
rm -rf /tmp/presta

#Descomprimimos el archivo .zip con el código fuente
unzip /tmp/presta.zip -d /tmp/presta

#Borramos prestashop
rm -rf /tmp/prestashop

#Descomprimimos prestashop.zip
unzip /tmp/presta/prestashop.zip -d /tmp/prestashop

rm -rf /tmp/presta
rm -rf /tmp/presta.zip

#Movemos el código fuente al directorio de apache
mv /tmp/prestashop/* /var/www/html

#Borramos la carpeta de prestashop del temporal
rm -rf /tmp/prestashop

#instalamos los paquetes necesarios que nos solicita la instalación (Esto nos quita 2 errores de la instalación)
apt-get install php-zip php-simplexml -y

#Para quitar el ultimo el error damos permisos a toda la carpeta html
sudo chmod -R 777 /var/www/html/

#cuando estamos con la instalación y da un error "cURL extension is not enabled"
sudo apt-get install php-curl -y

#cuando estamos con la instalación y da un error "sudo apt-get install php8.1-gd"
sudo apt-get install php8.1-gd -y

#Para el ultimo error "Intl extension is not loaded"
sudo apt-get install php-intl -y

#Para el ultimo error "mbstrings extension is activated"
sudo apt-get install php-mbstring -y

#Cambio el valor de post_max_size.

sed -i "s/post_max_size = 8M/post_max_size = 16M/" /etc/php/8.1/apache2/php.ini

#Cambio el valor de upload_max_filesize.

sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 4M/" /etc/php/8.1/apache2/php.ini

#reiniciamos apache2 para que se apliquen los cambios
sudo systemctl restart apache2

#con esta linea de comandos lo que conseguimos es automatizar la intalación de prestashop
php /var/www/html/install/index_cli.php \
    --domain=$domain \
    --db_server=$DB_HOST_PRIVATE_IP --db_name=$DB_NAME --db_user=$DB_USER \
    --db_password=$DB_PASSWORD --prefix=myshop_ --email=tamm.jvdcm86@tijux.com --password=tamm.jvdcm86@tijux.com --ssl=1

rm -rf /var/www/html/install