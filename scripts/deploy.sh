#!/bin/bash

echo "===================================="
echo "🚀 DEPLOY SCRIPT PTERODACTYL TOOLS"
echo "===================================="

# Vérifier si le dossier scripts existe sinon le créer
mkdir -p ~/scripts

# Déplacer tous les scripts dans ~/scripts si besoin
echo "📂 Déplacement des scripts..."
mv install_pterodactyl.sh ~/scripts/
mv update_pterodactyl.sh ~/scripts/
mv clear_cache.sh ~/scripts/
mv backup_pterodactyl.sh ~/scripts/
mv check_update_ptero.sh ~/scripts/
mv menu.sh ~/scripts/

# Donner les bonnes permissions
echo "🔒 Attribution des permissions..."
chmod +x ~/scripts/*.sh

echo "✅ Tous les scripts sont installés dans ~/scripts/"
echo "✅ Tu peux maintenant lancer : sudo ~/scripts/menu.sh"
