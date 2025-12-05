#!/bin/bash

DB_USER="admin_chris"
DB_NAME="exploration_types"
SQL_FILE="TP8.sql"
OUTPUT_FILE="sortie8.txt"

echo "=== Exécution de l'Exercice 8 ==="
mysql -u "$DB_USER" -p "$DB_NAME" < "$SQL_FILE" > "$OUTPUT_FILE"

echo "Résultats SQL disponibles dans $OUTPUT_FILE"
echo "------------------------------------------------------------"
cat "$OUTPUT_FILE"

# Étape 2 : Génération graphique avec Python
python3 << 'EOF'
import matplotlib.pyplot as plt

# Données comparatives (simplifiées)
collations = ["unicode_ci", "spanish_ci", "bin"]
ecole = [1, 1, 1]   # "école" trouvé
ECOLE = [1, 1, 0]   # "ÉCOLE" trouvé ou non
ecole_plain = [1, 1, 0] # "ecole" trouvé ou non

x = range(len(collations))

plt.bar(x, ecole, width=0.2, label='"école"', align='center')
plt.bar([i+0.2 for i in x], ECOLE, width=0.2, label='"ÉCOLE"', align='center')
plt.bar([i+0.4 for i in x], ecole_plain, width=0.2, label='"ecole"', align='center')

plt.xticks([i+0.2 for i in x], collations)
plt.ylabel("Résultat (1=trouvé, 0=non)")
plt.title("Comparatif des collations")
plt.legend()
plt.savefig("comparatif_collations.png")
print("Graphique généré : comparatif_collations.png")
EOF
