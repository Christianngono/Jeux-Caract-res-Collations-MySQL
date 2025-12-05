## Exercice 2 : Comparaison de collations

## Jeux-Caract-res-Collations-MySQL/Exercice2/

Ce dossier contient des scripts SQL destinés à explorer les différences entre collations dans MySQL/MariaDB.  
Chaque fichier illustre une variante de test (sensibilité à la casse, accents, tri, indexation) et génère une sortie observable.

---

## Contenu

- **TP2A.sql**  
  Crée une table avec deux colonnes (`utf8mb4_bin` vs `utf8mb4_general_ci`).  
  Insère des données (`café` / `Café`) et compare les résultats pour montrer la sensibilité à la casse et aux accents.

- **TP2B.sql**  
  Étend les tests avec plusieurs mots accentués (`école`, `ecole`, `École`, etc.).  
  Compare les résultats et montre les différences de tri entre collations strictes et souples.

- **TP2C.sql**  
  Ajoute des index et observe leur utilisation avec `EXPLAIN`.  
  Permet de comparer les performances et l’impact des collations sur les recherches et tris.

- **sortie.txt**  
  Fichier de sortie généré lors de l’exécution des scripts avec redirection.  
  Contient les résultats des `SELECT`, `SHOW TABLES`, `DESCRIBE` et comparaisons.

---

## Conclusion

Ce dossier illustre pas à pas comment les collations influencent :  
- La comparaison de chaînes (`=`).  
- La sensibilité aux accents et majuscules.  
- Le tri et l’ordre des résultats.  
- L’utilisation des index et les performances.

---

- Commandes à exécuter :

```bash
chris@Chris:~/Jeux-Caract-res-Collations-MySQL$ mysql -u admin_chris -p exploration_types < TP2A.sql > sortie2.txt
chris@Chris:~/Jeux-Caract-res-Collations-MySQL/Exercice2$ mysql -u admin_chris -p exploration_types < TP2A.sql

```

- # run_exo2.sh : Automatisation de TP2A.sql avec sortie contrôlée

Créer un fichier run_exo2.sh

```bash
chris@Chris:~/Jeux-Caract-res-Collations-MySQL/Exercice2$ nano run_exo2.sh

```
- Y ajouter un script 

- Exécuter :

```Bash
chris@Chris:~/Jeux-Caract-res-Collations-MySQL/Exercice2$ chmod +x run_exo2.sh
chris@Chris:~/Jeux-Caract-res-Collations-MySQL/Exercice2$ ./run_exo2.sh

```
- Résultats sont dans le fichier sortie2.txt

