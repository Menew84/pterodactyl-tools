#!/bin/bash

echo "===================================="
echo "📦 SAUVEGARDE PTERODACTYL PANEL"
echo "===================================="

# Dossier du panel
PTERO_DIR="/var/www/pterodactyl"
BACKUP_DIR="/var/backups/pterodactyl"

# Date actuelle
DATE=$(date +%Y%m%d_%H%M%S)

# Vérifier si le dossier de backup existe
mkdir -p "$BACKUP_DIR"

# Faire une copie compressée
echo "📂 Sauvegarde du panel en cours..."
tar -czvf "$BACKUP_DIR/pterodactyl_backup_$DATE.tar.gz" "$PTERO_DIR"

echo "✅ Sauvegarde terminée dans $BACKUP_DIR/pterodactyl_backup_$DATE.tar.gz"
