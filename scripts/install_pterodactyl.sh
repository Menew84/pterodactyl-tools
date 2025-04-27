#!/bin/bash

echo "===================================="
echo "🚀 INSTALLATION PTERODACTYL PANEL"
echo "===================================="

# Variables
PTERO_DIR="/var/www/pterodactyl"
PTERO_REPO="https://github.com/pterodactyl/panel/releases/latest/download/panel.tar.gz"

# Vérifications
if [ "$(id -u)" -ne 0 ]; then
    echo "❌ Ce script doit être exécuté en tant que root (sudo)."
    exit 1
fi

# Vérifier la présence de Composer
if ! command -v composer &> /dev/null; then
    echo "❌ Composer n'est pas installé. Installe-le avant de continuer."
    exit 1
fi

# Vérifier Node.js et Yarn
if ! command -v node &> /dev/null || ! command -v yarn &> /dev/null; then
    echo "❌ NodeJS ou Yarn ne sont pas installés. Installe-les avant de continuer."
    exit 1
fi

# Création du dossier
mkdir -p "$PTERO_DIR"
cd "$PTERO_DIR" || exit 1

# Télécharger le panel
echo "⬇️ Téléchargement du panel..."
curl -L "$PTERO_REPO" -o panel.tar.gz

# Extraire
echo "📂 Extraction..."
tar -xzvf panel.tar.gz
rm panel.tar.gz

# Installer PHP
echo "🔧 Installation des dépendances PHP..."
composer install --no-dev --optimize-autoloader

# Configuration Laravel
echo "🔄 Configuration de Laravel..."
cp .env.example .env
php artisan key:generate

# Installer dépendances Node/Yarn
echo "🔧 Installation des dépendances NodeJS..."
npm install --legacy-peer-deps
yarn install
yarn build:production

# Permissions
echo "🔒 Permissions..."
chown -R www-data:www-data "$PTERO_DIR"
chmod -R 755 "$PTERO_DIR/storage" "$PTERO_DIR/bootstrap/cache"

# Restart nginx/php
echo "🔄 Restart des services..."
systemctl restart nginx
systemctl restart php8.2-fpm

echo "✅ INSTALLATION TERMINÉE ! Recharge ton navigateur (CTRL+F5) !"
