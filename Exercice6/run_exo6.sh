#!/bin/bash

# Variables
DB_USER="admin_chris"
DB_NAME="exploration_types"
SQL_FILE="TP6.sql"
OUTPUT_FILE="sortie6.txt"

echo "=== Exécution de l'Exercice 6 ==="
echo "Utilisateur MySQL : $DB_USER"
echo "Base de départ    : $DB_NAME"
echo "Script SQL        : $SQL_FILE"
echo "Fichier sortie    : $OUTPUT_FILE"
echo "------------------------------------------------------------"

# Vérification des fichiers
if [ ! -f "$SQL_FILE" ]; then
  echo "Erreur : fichier $SQL_FILE introuvable."
  exit 1
fi

# Exécution du script SQL
mysql -u "$DB_USER" -p "$DB_NAME" < "$SQL_FILE" > "$OUTPUT_FILE"

# Vérification de la sortie
if [ -f "$OUTPUT_FILE" ]; then
  echo "Exécution terminée. Résultats disponibles dans $OUTPUT_FILE"
  echo "------------------------------------------------------------"
  cat "$OUTPUT_FILE"
else
  echo "Erreur : sortie non générée."
fi
