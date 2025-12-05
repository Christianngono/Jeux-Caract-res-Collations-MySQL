# Rapport Exercice 8 – Comparatif des Collations MySQL

## Objectif
Automatiser l’exécution du fichier `TP8.sql` pour comparer les collations (`utf8mb4_unicode_ci`, `utf8mb4_spanish_ci`, `utf8mb4_bin`) et générer :
- Les résultats SQL dans `sortie8.txt`
- Un schéma ASCII imprimé dans le terminal
- Un graphique visuel `comparatif_collations.png`

---

## Organisation du dossier

```bash
chris@Chris:~/Jeux-Caract-res-Collations-MySQL/Exercice6$ ls
TP6.sql  TP7.sql  TP8.sql
run_exo6.sh  run_exo7.sh  run_exo8.sh
sortie6.txt  sortie7.txt  sortie8.txt
comparatif_collations.png

```

### Contenus des fichiers : TP8.sql run_exo8.sh

## Fichier TP8.sql

Ce fichier contient :
- Les requêtes SQL pour tester les collations
- L’impression comparative
- L’export des résultats
Exécution directe :

```bash
chris@Chris:~/Jeux-Caract-res-Collations-MySQL/Exercice6$ mysql -u admin_chris -p exploration_types < TP8.sql

```
Ou exporter vers un fichier sortie.sql

```bash
chris@Chris:~/Jeux-Caract-res-Collations-MySQL/Exercice6$ mysql -u admin_chris -p exploration_types < TP8.sql > sortie8.txt

```

## Fichier run_exo8.sh

Script Bash qui :
- Exécute TP8.sql
- Génère sortie8.txt
- Lance un bloc Python pour produire comparatif_collations.png

Préparation : attribuer les accès

```bash
chris@Chris:~/Jeux-Caract-res-Collations-MySQL/Exercice6$ chmod +x run_exo8.sh

```
Puis exécuter le fichier run_exo8.sh

```bash
chris@Chris:~/Jeux-Caract-res-Collations-MySQL/Exercice6$ ./run_exo8.sh

```
- Résultats obtenus : dans le fichier sortie8.txt, et le fichier image comparatif_collations.png sur le terminal Vscode WSL Ubuntu

````bash
Collation	titre
utf8mb4_unicode_ci	L'école des femmes
utf8mb4_unicode_ci	ÉCOLE de magie
Collation	titre
utf8mb4_spanish_ci	El niño y la escuela
utf8mb4_spanish_ci	Escuela internacional
utf8mb4_spanish_ci	La escuela de la vida
Collation	titre
utf8mb4_bin	L'école des femmes
Ligne
Recherche : "ecole"
utf8mb4_unicode_ci | "école"=trouvé | "ÉCOLE"=trouvé | "ecole"=trouvé
utf8mb4_spanish_ci | "niño"=tri ✔ | "escuela"=ordre ✔ | "École"=trouvé
utf8mb4_bin | "école"=trouvé | "ÉCOLE"=NON | "ecole"=NON

````
- Graphique généré
Un fichier comparatif_collations.png est produit automatiquement par le script Python intégré à run_exo8.sh.
Il illustre en barres comparatives les résultats (trouvé = 1, NON trouvé = 0)

````bash
chris@Chris:~/Jeux-Caract-res-Collations-MySQL/Exercice6$ sudo apt update
chris@Chris:~/Jeux-Caract-res-Collations-MySQL/Exercice6$ sudo apt install python3-matplotlib -y
chris@Chris:~/Jeux-Caract-res-Collations-MySQL/Exercice6$ ./run_exo8.sh

````

- Vérifier le dossier Exercice6 du répertoire du projet pour voir l'image Graphique "comparatif_collations.png" 













