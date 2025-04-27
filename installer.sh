#!/bin/bash

echo "===================================="
echo "🚀 INSTALLATEUR COMPLET PTERODACTYL TOOLS"
echo "===================================="

# Variables
GITHUB_REPO="https://github.com/Menew84/pterodactyl-tools.git"
INSTALL_DIR="$HOME/scripts"

# Installer les paquets nécessaires
echo "🔧 Vérification de wget, unzip et git..."
sudo apt update
sudo apt install -y wget unzip git

# Cloner le dépôt
echo "⬇️ Téléchargement des outils depuis GitHub..."
git clone "$GITHUB_REPO" "$INSTALL_DIR"

# Donner les permissions
echo "🔒 Attribution des permissions..."
chmod +x "$INSTALL_DIR"/*.sh

# Déployer automatiquement
echo "🚀 Déploiement des outils..."
cd "$INSTALL_DIR" || exit 1
./deploy.sh

# Lancer le menu
echo "🎛️ Lancement du menu interactif..."
sudo ./menu.sh
