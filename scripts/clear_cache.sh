#!/bin/bash

echo "===================================="
echo "🧹 NETTOYAGE CACHE LARAVEL (PTERODACTYL)"
echo "===================================="

# Aller dans le dossier du panel
cd /var/www/pterodactyl || exit 1

# Nettoyage du cache Laravel
echo "🔧 Nettoyage config cache..."
php artisan config:clear

echo "🔧 Nettoyage route cache..."
php artisan route:clear

echo "🔧 Nettoyage view cache..."
php artisan view:clear

# Restart nginx et php-fpm
echo "🔄 Redémarrage de nginx et php-fpm..."
sudo systemctl restart nginx
sudo systemctl restart php8.2-fpm

echo "✅ Cache Laravel vidé avec succès ! Recharge ton navigateur (CTRL + F5) !"
