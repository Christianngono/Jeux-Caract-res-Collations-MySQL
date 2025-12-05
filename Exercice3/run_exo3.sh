#!/bin/bash
# run_exo3.sh : Automatisation de TP3.sql avec horodatage et mot de passe
# Auteur : Christian
# Date : 2025-12-05

# Variables de configuration
DB_NAME="exploration_types"
DB_USER="admin_chris"
DB_PASS=""   # remplace par ton vrai mot de passe MySQL
SQL_FILE="TP3.sql"
OUTPUT_FILE="sortie3.txt"

# 1. Réinitialiser sortie3.txt
: > "$OUTPUT_FILE"

# 2. Fonction pour écrire avec horodatage
log_step() {
  echo "=== [$(date '+%Y-%m-%d %H:%M:%S')] $1 ===" >> "$OUTPUT_FILE"
}

# 3. Exécution pas à pas avec horodatage
log_step "Début de l'exécution de $SQL_FILE"

mysql -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" < "$SQL_FILE" >> "$OUTPUT_FILE" 2>&1
if [ $? -eq 0 ]; then
  log_step "Exécution réussie de $SQL_FILE"
else
  log_step "Erreur lors de l'exécution de $SQL_FILE"
  exit 1
fi

log_step "Fin du run_exo3.sh"

