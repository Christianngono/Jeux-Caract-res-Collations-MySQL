#!/bin/bash
# run_exo2.sh : Automatisation de TP2A.sql avec sortie contrôlée
# Auteur : Christian
# Date : 2025-12-05

# Variables de configuration
DB_NAME="exploration_types"
DB_USER="admin_chris"
DB_PASS="MonSuperMotDePasse"   #  à adapter selon ton environnement
SQL_FILE="TP2A.sql"
OUTPUT_FILE="sortie2.txt"
TIMESTAMP=$(date '+%Y-%m-%d_%H-%M-%S')
ARCHIVE_FILE="sortie2_${TIMESTAMP}.txt"


# 1. Réinitialiser le fichier de sortie
: > "$OUTPUT_FILE"

# 2. Exécuter le script SQL et rediriger la sortie
mysql -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" < "$SQL_FILE" > "$OUTPUT_FILE" 2>&1

# 3. Vérification et feedback
if [ $? -eq 0 ]; then
  echo "✅ Exécution réussie. Résultats enregistrés dans $OUTPUT_FILE"
  # 4. Sauvegarde dans un fichier horodaté
  cp "$OUTPUT_FILE" "$ARCHIVE_FILE"
  echo "📂 Archive créée : $ARCHIVE_FILE"
else
  echo "❌ Erreur lors de l'exécution. Vérifie les logs dans $OUTPUT_FILE"
fi
