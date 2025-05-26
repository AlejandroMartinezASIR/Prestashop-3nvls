#!/bin/bash

# Variables
ORIGEN="/var/www/html/"
DESTINO_BASE="/root/backups"
FECHA=$(date +%Y-%m-%d)
DESTINO="$DESTINO_BASE/$FECHA"
ULTIMA=$(find "$DESTINO_BASE" -maxdepth 1 -type d -name "20*" | sort | tail -n 1)
LOG="$DESTINO_BASE/backup.log"

# Crear carpeta destino
mkdir -p "$DESTINO"

# Si existe una copia anterior, usar --link-dest para copiar solo los cambios
if [[ "$ULTIMA" != "$DESTINO" && -d "$ULTIMA" ]]; then
    rsync -avh --delete --link-dest="$ULTIMA" "$ORIGEN" "$DESTINO" >> "$LOG" 2>&1
else
    rsync -avh --delete "$ORIGEN" "$DESTINO" >> "$LOG" 2>&1
fi

# Registrar la copia
echo "[$(date '+%Y-%m-%d %H:%M:%S')] Copia incremental completada en $DESTINO" >> "$LOG"

#Crea una copia nueva en /root/backups/AAAA-MM-DD.
#Usa la última copia para comparar con --link-dest.
#Solo guarda los cambios; los archivos no modificados son enlaces duros.
#Se puede navegar por cada carpeta como si fuera una copia completa