
# 🦖 Pterodactyl Panel Management Scripts

**Scripts simplifiés pour installer, gérer, et maintenir facilement un serveur Pterodactyl Panel.**

---

## 🧩 Prérequis

- **Système recommandé :** Ubuntu 22.04 LTS
- **Spécifications minimales pour la VM :**
  - CPU : 2 vCPU
  - RAM : 4 Go minimum (8 Go recommandé)
  - Disque : 20 Go SSD minimum
  - Connexion Internet stable
- **Accès root requis** pour installer les dépendances.

---

## 📂 Contenu des Scripts

| Script                  | Fonction |
|:-------------------------|:---------|
| `install_pterodactyl.sh`  | Installer le Panel proprement (PHP, Nginx, MariaDB, Pterodactyl, etc.) |
| `update_pterodactyl.sh`   | Mettre à jour ou réparer l'installation du Panel |
| `clear_cache.sh`          | Nettoyer le cache de Laravel (configuration, routes, vues) |
| `backup_pterodactyl.sh`   | Sauvegarder le dossier complet du Panel |
| `check_update_ptero.sh`   | Vérifier si une nouvelle version du Panel est disponible |
| `menu.sh`                 | Menu interactif pour piloter tous les scripts sans effort |
| `deploy.sh`               | Déploiement automatique rapide des outils |

---

## 🚀 Installation Facile

1. **Téléchargez les fichiers sur votre serveur.**

2. **Placez-vous dans le bon dossier (là où est `installer.sh`) :**

```bash
cd ~/scripts
```

3. **Donnez les permissions d'exécution et lancez l'installation :**

```bash
chmod +x installer.sh
./installer.sh
```

**👉 Tous les scripts seront automatiquement placés dans `/root/scripts` et rendus exécutables.**

---

## 🎮 Utilisation rapide

Après installation, vous pouvez :

- Lancer le **menu interactif** :

```bash
cd ~/scripts
./menu.sh
```

- Ou exécuter un script spécifique :

```bash
./install_pterodactyl.sh
./update_pterodactyl.sh
./clear_cache.sh
...
```

---

## 📚 Conseils

- **Pensez à sauvegarder régulièrement** votre serveur avec `backup_pterodactyl.sh`.
- **Avant une mise à jour**, utilisez `check_update_ptero.sh` pour vérifier la dernière version.
- **Après modification manuelle**, utilisez `clear_cache.sh` pour éviter les erreurs Laravel.

---

## ✨ Auteur

- GitHub : [Menew84](https://github.com/Menew84)
- Projet : `pterodactyl-tools`
- Dernière mise à jour : 27/04/2025

---

> Projet conçu pour simplifier la vie des utilisateurs de **Pterodactyl Panel** débutants comme expérimentés. 🚀
