# Rapports Exercice6 -Bibliothèque multilingue


- Fichiers utilisés

TP6.sql : Script SQL pour créer et manipuler une base de données multilingue.

run_exo6.sh : Script Bash pour automatiser l’exécution du fichier SQL et générer une sortie.

sortie6.txt : Résultats de l’exécution du script SQL.

- Objectifs du TP

Créer une base de données bibliotheque_multilingue avec support complet de l’UTF-8 (utf8mb4).

Insérer des données multilingues (français, espagnol, chinois, allemand, anglais, russe, arabe) avec accents et emojis.

Tester les collations pour comparer les comportements :

utf8mb4_unicode_ci (insensible à la casse et aux accents).

utf8mb4_spanish_ci (tri spécifique à l’espagnol).

utf8mb4_bin (comparaison stricte, sensible à la casse).

- Contenu du script SQL (TP6.sql)

Connexion UTF-8 : SET NAMES utf8mb4; et configuration des collations.

Création de la base et de la table : bibliotheque_multilingue et table livres.

Insertion de données : 10 livres multilingues avec accents et emojis.

Recherches :

Recherche insensible à la casse : titres contenant « ecole ».

Recherche des livres en espagnol triés par titre.

Modification de la collation en utf8mb4_bin.

Recherche sensible à la casse : titres contenant « école ».

- Script Bash (run_exo6.sh)

```bash
#!/bin/bash

# Vérifier la présence du fichier SQL
if [ ! -f TP6.sql ]; then
  echo "Erreur : fichier TP6.sql introuvable."
  exit 1
fi

# Exécuter le script SQL avec l'utilisateur MySQL admin_chris sur la base exploration_types
mysql -u admin_chris -p exploration_types < TP6.sql > sortie6.txt

# Afficher les résultats
cat sortie6.txt

```
- Résultats observés (sortie6.txt)
Se trouvent dans le fichier sortie6.txt

- Analyse

utf8mb4_unicode_ci : permet de retrouver « école » et « ÉCOLE » sans distinction de casse.

utf8mb4_spanish_ci : applique un tri adapté à l’espagnol (ordre alphabétique spécifique).

utf8mb4_bin : impose une comparaison stricte, seules les correspondances exactes sont retournées.

- Commandes à exécuter dans le terminal (WSL Ubuntu)
# Se placer dans le dossier Exercice6
cd ~/Exercice6

# Vérifier les fichiers présents
ls

# Rendre le script exécutable
chmod +x run_exo6.sh

# Lancer l’exécution
./run_exo6.sh

# Consulter les résultats
cat sortie6.txt

- Conclusion

Cet exercice démontre l’importance des collations dans MySQL pour gérer les données multilingues et les recherches. Les résultats montrent clairement la différence entre une recherche insensible à la casse, un tri linguistique spécifique et une recherche stricte sensible à la casse.