#!/bin/bash

# Configuramos para mostrar los comandos y finalizar si hay error
set -ex

#Importamos las variables de entorno
source .env

# Instalamos las dependencias necesarias
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:ondrej/php -y
sudo apt update
sudo apt install -y apache2 php8.1 php8.1-mysql php8.1-xml php8.1-curl php8.1-intl php8.1-zip php8.1-gd php8.1-mbstring php8.1-bcmath unzip wget

# módulos y reinicia Apache
sudo a2enmod rewrite
sudo systemctl restart apache2

# Copiamos el archivo de configuración de Apache
cp /home/ubuntu/p2/conf/000-default.conf /etc/apache2/sites-available

# Cambiamos los permisos de la carpeta
sudo chown -R www-data:www-data /var/www/html/

# Cambiamos los permisos de la carpeta
sudo chmod -R 755 /var/www/html/

# Activamos el sitio
sudo a2ensite 000-default.conf

# Configuramos parametros de frontends
sudo sed -i 's/^memory_limit = .*/memory_limit = 512M/' "$PHP_INI"
sudo sed -i 's/^upload_max_filesize = .*/upload_max_filesize = 300M/' "$PHP_INI"
sudo sed -i 's/^post_max_size = .*/post_max_size = 300M/' "$PHP_INI"
sudo sed -i 's/^max_execution_time = .*/max_execution_time = 300/' "$PHP_INI"
sudo sed -i 's/^max_input_time = .*/max_input_time = 300/' "$PHP_INI"

# Reiniciamos el servicio de Apache
sudo systemctl reload apache2
