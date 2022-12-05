#!/bin/bash

#Para mostrar los comandos que se van ejecutando
set -x

# Definimos la variables de configuración
source variables.sh

#Actualizamos los repositorios
apt update

#Actualizamos los paquetes
apt upgrade -y

#Instalamos el sistema gestor de BD MySQL
apt install mysql-server -y

# Configuramos MySQL para que acepte conexiones desde cualquier interfaz de red
sed -i "s/127.0.0.1/0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf

# Reiniciamos el servicio de MySQL
systemctl restart mysql

# Borramos la base de datos de wordpress por si ya estubiese instalada
mysql -u root <<< "DROP DATABASE IF EXISTS $DB_NAME;"

# Creamos una base de datos llamada wordpress
mysql -u root <<< "CREATE DATABASE IF NOT EXISTS $DB_NAME;"

# Creamos el usuario de la base de datos
mysql -u root <<< "DROP USER IF EXISTS $DB_USER@'%';"
mysql -u root <<< "CREATE USER $DB_USER@'%' IDENTIFIED BY '$DB_PASSWORD';"
mysql -u root <<< "GRANT ALL PRIVILEGES ON $DB_NAME.* TO $DB_USER@'%';"
mysql -u root <<< "FLUSH PRIVILEGES;"