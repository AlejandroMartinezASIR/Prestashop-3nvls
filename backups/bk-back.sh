#!/bin/bash

# Variables
USER="root"
PASSWORD="root"
DATABASE="prestashop"
BACKUP_DIR="/root/backup"
DATE=$(date +\%Y\%m\%d)
BACKUP_FILE="$BACKUP_DIR/backup_prestashop_$DATE.sql"

# Crear el directorio de backup si no existe
mkdir -p $BACKUP_DIR

# Eliminar si hay copia existente
rm -f $BACKUP_DIR/backup_prestashop_$DATE.sql.gz

# Crear el backup (sin tablespaces)
mysqldump --no-tablespaces -u $USER -p$PASSWORD $DATABASE > $BACKUP_FILE

# Comprimir el backup
gzip $BACKUP_FILE

echo "Backup completado: $BACKUP_FILE.gz"
