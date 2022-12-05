#!/bin/bash

#Para mostrar los comandos que se van ejecutando
set -x

# Definimos la variables de configuración
source variables.sh

# Descargamos el código fuente de wordpress
wget https://wordpress.org/latest.zip --output-document /tmp/wordpress.zip

# Acttualizamos los repositorios
apt update

#Instalamos el descompresor de paquetes zip si no está instalado
apt install unzip -y

# Eliminamos si hubiese alguna instalación anterior
#rm -rf /var/www/html/wordpress
rm -rf /tmp/wordpress

# Descomprimimos el archivo .zip con el código fuente
#unzip /tmp/wordpress.zip -d /var/www/html
unzip /tmp/wordpress.zip -d /tmp/

#Movemos el código fuente al directorio de apache
mv /tmp/wordpress/* /var/www/html

# Creamos el archivo de configuración de wordpress
cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

# Cambiamos el nombre de la base de datos por la que acabamos de crear
sed -i "s/database_name_here/$DB_NAME/" /var/www/html/wp-config.php

# Cambiamos el nombre del usuario de la base de datos por el que acabamos de crear
sed -i "s/username_here/$DB_USER/" /var/www/html/wp-config.php

# Cambiamos la contraseña de la base de datos por la del usuario que acabamos de crear
sed -i "s/password_here/$DB_PASSWORD/" /var/www/html/wp-config.php

# Cambiamos la contraseña de la base de datos por la del usuario que acabamos de crear
sed -i "s/localhost/$DB_HOST_PRIVATE_IP/" /var/www/html/wp-config.php

# Borramos el archivo comprimido del directorio temporal
rm -rf /tmp/wordpress.zip
rm -rf /tmp/wordpress

# Borramos el archivo index.html del directorio de apache
rm -rf /var/www/html/index.html

# Actualizamos los permisos del usuario
chown -R www-data:www-data /var/www/html