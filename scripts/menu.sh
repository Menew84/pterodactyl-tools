#!/bin/bash

while true; do
    clear
    echo "=========================================="
    echo "    🖥️  PTERODACTYL SERVER MANAGER"
    echo "=========================================="
    echo "1. Installer Pterodactyl Panel"
    echo "2. Mettre à jour Pterodactyl Panel"
    echo "3. Sauvegarder le Panel"
    echo "4. Nettoyer Cache Laravel"
    echo "5. Vérifier les mises à jour disponibles"
    echo "6. Quitter"
    echo "=========================================="
    read -rp "Entrez votre choix : " choice

    case $choice in
        1)
            sudo ~/scripts/install_pterodactyl.sh
            read -rp "Appuie sur Entrée pour revenir au menu..."
            ;;
        2)
            sudo ~/scripts/update_pterodactyl.sh
            read -rp "Appuie sur Entrée pour revenir au menu..."
            ;;
        3)
            sudo ~/scripts/backup_pterodactyl.sh
            read -rp "Appuie sur Entrée pour revenir au menu..."
            ;;
        4)
            sudo ~/scripts/clear_cache.sh
            read -rp "Appuie sur Entrée pour revenir au menu..."
            ;;
        5)
            sudo ~/scripts/check_update_ptero.sh
            read -rp "Appuie sur Entrée pour revenir au menu..."
            ;;
        6)
            echo "👋 Bye !"
            exit 0
            ;;
        *)
            echo "❌ Choix invalide. Merci de choisir entre 1 et 6."
            sleep 2
            ;;
    esac
done
