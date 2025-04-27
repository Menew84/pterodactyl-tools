#!/bin/bash

echo "===================================="
echo "📡 CHECK MISE À JOUR PTERODACTYL PANEL"
echo "===================================="

# Récupérer la dernière version depuis GitHub
LATEST_VERSION=$(curl -s https://api.github.com/repos/pterodactyl/panel/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')

# Récupérer la version locale actuelle
if [ -f /var/www/pterodactyl/composer.json ]; then
    CURRENT_VERSION=$(grep '"version":' /var/www/pterodactyl/composer.json | head -n 1 | sed -E 's/.*"([^"]+)".*/\1/')
else
    CURRENT_VERSION="Inconnue"
fi

echo "Version actuelle installée : $CURRENT_VERSION"
echo "Dernière version disponible  : $LATEST_VERSION"

if [ "$CURRENT_VERSION" != "$LATEST_VERSION" ]; then
    echo "⚠️ Mise à jour disponible ! Pense à utiliser le script de mise à jour."
else
    echo "✅ Tu es déjà à jour !"
fi
