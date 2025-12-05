### Exercice 3 : Modification des collations et exploration des erreurs 

Ce dossier contient des scripts SQL destinés à tester la modification des collations sur une table existante et à observer les effets sur les comparaisons.  
Il illustre également les erreurs fréquentes liées aux jeux de caractères et collations incompatibles.

---

### Contenu

- **TP3.sql**  
  Script qui modifie la collation des colonnes d’une table (`comparaison`) pour harmoniser en `utf8mb4_unicode_ci`.  
  Vérifie ensuite les résultats des comparaisons (`café` vs `Café`) et montre que les colonnes deviennent équivalentes grâce à une collation insensible à la casse.

- **sortie.txt**  
  Fichier de sortie généré lors de l’exécution du script avec redirection.  
  Contient les résultats des commandes (`SHOW TABLES`, `DESCRIBE`, `SELECT *`) et les comparaisons après modification.

---

### Conclusion

Ce dossier illustre :  
- Comment modifier la collation d’une table existante.  
- L’importance d’harmoniser les collations pour éviter les erreurs (`Illegal mix of collations`).  
- Les effets pratiques sur la comparaison de chaînes multilingues.

---

- Commandes à exécuter :

```bash
chris@Chris:~/Jeux-Caract-res-Collations-MySQL/Exercice3$ mysql -u admin_chris -p exploration_types < TP3.sql > sortie3.txt
chris@Chris:~/Jeux-Caract-res-Collations-MySQL/Exercice3$ mysql -u admin_chris -p exploration_types < TP3.sql

```

- Automatiser le TP3.sql pour qu'il s'exécute et réinitialise grace au fichier run_exo3.sh

### Créer un fichier run_exo3.sh

```bash
chris@Chris:~/Jeux-Caract-res-Collations-MySQL/Exercice3$ nano run_exo3.sh

```
- y ajouter un script adéquat puis relancer le fichier run_exo3.sh

```bash
chris@Chris:~/Jeux-Caract-res-Collations-MySQL/Exercice3$ chmod +x run_exo3.sh
chris@Chris:~/Jeux-Caract-res-Collations-MySQL/Exercice3$ ./run_exo3.sh

```
- Résultats dans sortie3.txt




