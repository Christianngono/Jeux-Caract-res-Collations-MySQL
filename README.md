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

# Conclusion

Ce répertoire constitue une progression complète sur la gestion des jeux de caractères, collations et recherches avancées dans MySQL/MariaDB.  
Chaque TP illustre une facette différente : multilingue, accents, casse, normalisation, emojis, indexation et recherche FULLTEXT.

- commandes d'exécutions :

```bash
chris@Chris:~/Jeux-Caract-res-Collations-MySQL$ mysql -u admin_chris -p exploration_types < TP2.sql > sortie.txt
chris@Chris:~/Jeux-Caract-res-Collations-MySQL$ mysql -u admin_chris -p exploration_types < TP2.sql
chris@Chris:~/Jeux-Caract-res-Collations-MySQL$ mysql -u admin_chris -p exploration_types < TPA.sql > sortieA.txt
...

```






