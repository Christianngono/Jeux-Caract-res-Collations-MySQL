#### # Exercice 4 : Exploration des erreurs courantes liées aux jeux de caractères 

Ce dossier illustre les problèmes rencontrés lorsqu’on utilise un encodage limité (`utf8` à 3 octets) et qu’on tente d’insérer des caractères Unicode modernes comme les emojis.  
Il montre ensuite la correction en passant à `utf8mb4`, qui supporte pleinement les emojis et les caractères multilingues.

---

#### Contenu

- **TP4.sql**  
  Script SQL qui :
  - Crée une table `test_encodage` avec encodage `utf8`.  
  - Montre l’échec d’une insertion contenant un emoji 😃.  
  - Corrige la table en `utf8mb4_unicode_ci`.  
  - Réinsère le texte avec succès et vérifie les données.

- **sortie4.txt**  
  Fichier de sortie généré lors de l’exécution du script.  
  Contient les résultats des commandes (`SHOW TABLES`, `DESCRIBE`, `SELECT *`) et la preuve que l’emoji est stocké correctement après correction.

---

#### Conclusion

Cet exercice montre que :
- utf8 (MySQL/MariaDB) est limité à 3 octets et ne supporte pas les emojis.
- utf8mb4 est l’encodage complet sur 4 octets, nécessaire pour les emojis et caractères modernes.
- Harmoniser la base, la table et la connexion en utf8mb4 permet d’éviter l’erreur Incorrect string value et d’insérer correctement les données.




#### Commande d’exécution

Depuis l’emplacement du dossier `Exercice4` :

```bash
chris@Chris:~/Jeux-Caract-res-Collations-MySQL/Exercice4$ mysql -u admin_chris -p --default-character-set=utf8mb4 exploration_types < TP4.sql > sortie4.txt

```
- Résultats s'affichent dans le fichier sortie4.txt
