#!/bin/bash

# Configuramos para mostrar los comandos y finalizar si hay error
set -ex

#Importamos las variables de entorno
source .env

# Instalamos el servidor LAMP
cd /tmp

# Descargamos la última versión de Prestashop
wget https://assets.prestashop3.com/dst/edition/corporate/8.2.1/prestashop_edition_classic_version_8.2.1.zip

# Descomprimimos el archivo
unzip prestashop_edition_classic_version_8.2.1.zip -d prestashop

# Eliminamos instalaciones anteriores
sudo rm -rf /var/www/html/*

# Movemos los archivos a la carpeta de Apache
sudo mv prestashop/* /var/www/html/

# Copiamos ela rchivo .htaccess
sudo cp /home/ubuntu/p2/conf/.htaccess  /var/www/html/

# restartamos el servicio de Apache
sudo systemctl restart apache2
