# Jeux-Caract-res-Collations-MySQL
Ce fichier de documentation. Il décrit les différents scripts SQL et leur objectif.

- **TP2.sql**  
  Introduction aux jeux de caractères `utf8mb4` et collations (`unicode_ci` vs `general_ci`).  
  Inclut des tests avec emojis et mots multilingues pour comparer tri et recherche.

- **TPA.sql**  
  Variante du TP2 avec insertion et tri de mots accentués et multilingues.  
  Permet de visualiser les différences de comportement entre collations disponibles.

- **TPB.sql**  
  Exploration des collations spécifiques par langue (espagnol, français, allemand via Unicode). 
  Montre comment les règles locales influencent le tri et la recherche.

- **TPC.sql**  
  Tests sur l’indexation et les performances avec collations.  
  Compare l’impact de `unicode_ci` et `general_ci` sur l’utilisation des index.

- **TPD.sql**  
  Étude de la sensibilité à la casse et aux accents (`utf8mb4_bin`).  
  Démontre la différence entre comparaisons strictes et souples.

- **TPE.sql**  
  Comparaisons multi-colonnes (prénom/nom) avec différentes collations.  
  Illustre l’effet des collations sur le tri combiné.

- **TPF.sql**  
  Tri par langue locale (français, espagnol, allemand).  
  Met en évidence les règles linguistiques propres à chaque collation.

- **TPG.sql**  
  Tests de normalisation Unicode (NFC vs NFD).  
  Compare les caractères composés (`é`) et décomposés (`e` + accent).

- **TPH.sql**  
  Manipulation d’emojis complexes (ZWJ, drapeaux, familles).  
  Vérifie la compatibilité de MySQL/MariaDB avec les séquences Unicode modernes.

- **TPI.sql**  
  Recherche plein texte (FULLTEXT) multilingue.  
  Montre l’utilisation des index FULLTEXT pour retrouver des mots dans plusieurs langues.

- **TPJ.sql**  
  Recherche FULLTEXT avec opérateurs booléens (+, -, *, guillemets).  
  Permet d’affiner les requêtes et d’inclure/exclure certains termes.

- **TPK.sql**  
  Recherche FULLTEXT avec score de pertinence et `WITH QUERY EXPANSION`.  
  Affiche les résultats classés par pertinence et élargit la recherche.

- **TPL.sql**  
  Recherche FULLTEXT multi-colonnes (titre + contenu).  
  Simule un moteur de recherche avancé en combinant plusieurs champs.

---


## ✅ Conclusion

Ce répertoire constitue une progression complète sur la gestion des jeux de caractères, collations et recherches avancées dans MySQL/MariaDB.  
Chaque TP illustre une facette différente : multilingue, accents, casse, normalisation, emojis, indexation et recherche FULLTEXT.


## Exercice 2 : Comparaison de collations

## Jeux-Caract-res-Collations-MySQL/Exercice2/

Ce dossier contient des scripts SQL destinés à explorer les différences entre collations dans MySQL/MariaDB.  
Chaque fichier illustre une variante de test (sensibilité à la casse, accents, tri, indexation) et génère une sortie observable.

---

## 📂 Contenu

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

## ✅ Conclusion

Ce dossier illustre pas à pas comment les collations influencent :  
- La comparaison de chaînes (`=`).  
- La sensibilité aux accents et majuscules.  
- Le tri et l’ordre des résultats.  
- L’utilisation des index et les performances.

---

### Exercice 3 : Modification des collations et exploration des erreurs 🔄

Ce dossier contient des scripts SQL destinés à tester la modification des collations sur une table existante et à observer les effets sur les comparaisons.  
Il illustre également les erreurs fréquentes liées aux jeux de caractères et collations incompatibles.

---

## 📂 Contenu

- **TP3.sql**  
  Script qui modifie la collation des colonnes d’une table (`comparaison`) pour harmoniser en `utf8mb4_unicode_ci`.  
  Vérifie ensuite les résultats des comparaisons (`café` vs `Café`) et montre que les colonnes deviennent équivalentes grâce à une collation insensible à la casse.

- **sortie.txt**  
  Fichier de sortie généré lors de l’exécution du script avec redirection.  
  Contient les résultats des commandes (`SHOW TABLES`, `DESCRIBE`, `SELECT *`) et les comparaisons après modification.

---

## ✅ Conclusion

Ce dossier illustre :  
- Comment modifier la collation d’une table existante.  
- L’importance d’harmoniser les collations pour éviter les erreurs (`Illegal mix of collations`).  
- Les effets pratiques sur la comparaison de chaînes multilingues.

---

#### # Exercice 4 : Exploration des erreurs courantes liées aux jeux de caractères 🚫

Ce dossier illustre les problèmes rencontrés lorsqu’on utilise un encodage limité (`utf8` à 3 octets) et qu’on tente d’insérer des caractères Unicode modernes comme les emojis.  
Il montre ensuite la correction en passant à `utf8mb4`, qui supporte pleinement les emojis et les caractères multilingues.

---

## 📂 Contenu

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

## Conclusion

Cet exercice montre que :
- utf8 (MySQL/MariaDB) est limité à 3 octets et ne supporte pas les emojis.
- utf8mb4 est l’encodage complet sur 4 octets, nécessaire pour les emojis et caractères modernes.
- Harmoniser la base, la table et la connexion en utf8mb4 permet d’éviter l’erreur Incorrect string value et d’insérer correctement les données.




## Commande d’exécution

Depuis l’emplacement du dossier `Exercice4` :

```bash
chris@Chris:~/Jeux-Caract-res-Collations-MySQL/Exercice4$ mysql -u admin_chris -p --default-character-set=utf8mb4 exploration_types < TP4.sql > sortie4.txt

---






