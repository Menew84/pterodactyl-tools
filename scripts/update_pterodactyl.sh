#!/bin/bash

echo "===================================="
echo "🚀 MISE À JOUR PTERODACTYL PANEL"
echo "===================================="

# Variables
PTERO_DIR="/var/www/pterodactyl"
BACKUP_DIR="/var/www/pterodactyl_backup_$(date +%Y%m%d_%H%M%S)"
PTERO_REPO="https://github.com/pterodactyl/panel/releases/latest/download/panel.tar.gz"

# Vérifications
if [ "$(id -u)" -ne 0 ]; then
    echo "❌ Ce script doit être exécuté en tant que root (sudo)."
    exit 1
fi

read -p "⚠️ Es-tu sûr de vouloir mettre à jour ? (y/n): " confirm
if [ "$confirm" != "y" ]; then
    echo "❌ Annulation."
    exit 1
fi

# Sauvegarde
echo "📦 Sauvegarde en cours..."
cp -r "$PTERO_DIR" "$BACKUP_DIR"

# Télécharger nouvelle version
cd "$PTERO_DIR" || exit 1
echo "⬇️ Téléchargement de la mise à jour..."
curl -L "$PTERO_REPO" -o panel.tar.gz

# Extraction
echo "📂 Extraction..."
tar -xzvf panel.tar.gz
rm panel.tar.gz

# Mise à jour PHP
echo "🔧 Mise à jour des dépendances PHP..."
composer install --no-dev --optimize-autoloader

# Mise à jour NodeJS/Yarn
echo "🔧 Mise à jour NodeJS/Yarn..."
npm install --legacy-peer-deps
yarn install
yarn build:production

# Permissions
echo "🔒 Correction permissions..."
chown -R www-data:www-data "$PTERO_DIR"
chmod -R 755 "$PTERO_DIR/storage" "$PTERO_DIR/bootstrap/cache"

# Restart
echo "🔄 Restart des services..."
systemctl restart nginx
systemctl restart php8.2-fpm

echo "✅ MISE À JOUR TERMINÉE ! Recharge ton navigateur (CTRL+F5) !"
