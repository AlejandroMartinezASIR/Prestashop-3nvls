#!/bin/bash

#Importamos las variables de entorno
source .env

# Configuramos para mostrar los comandos y finalizar si hay error
set -ex

# Actualizamos los repositorios
sudo apt update && sudo apt upgrade -y

# Actualiza los paquetes
apt upgrade -y

# Instalamos las dependencias necesarias
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:ondrej/php -y
sudo apt update
sudo apt install php8.1 php8.1-cli php8.1-mysql php8.1-xml php8.1-curl php8.1-intl php8.1-zip php8.1-gd php8.1-mbstring php8.1-bcmath mysql-server -y

# Creación de la base de datos y usuario de MySQL
mysql -u root <<< "DROP DATABASE IF EXISTS $PRESTASHOP_DB_NAME"
mysql -u root <<< "CREATE DATABASE $PRESTASHOP_DB_NAME"
mysql -u root <<< "DROP USER IF EXISTS $PRESTASHOP_DB_USER@'%'"
mysql -u root <<< "CREATE USER '$PRESTASHOP_DB_USER'@'%' IDENTIFIED BY '$PRESTASHOP_DB_PASSWORD'"
mysql -u root <<< "GRANT ALL PRIVILEGES ON $PRESTASHOP_DB_NAME.* TO $PRESTASHOP_DB_USER@'%'"

# Configuramos el archivo /etc/mysql/mysql.conf.d/mysqld.cnf
sed -i "s/127.0.0.1/0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf

# Reiniciamos el servicio de MySQL
sudo systemctl restart mysql
