# Exercice 5 : Recherche et tri avec différentes collations

Ce dossier illustre comment les collations influencent la recherche et le tri des chaînes de caractères.  
Il montre que les collations insensibles aux accents considèrent des mots comme équivalents et les trient sans tenir compte des accents.

---

## Contenu

- **TP5.sql**  
  Script SQL qui :
  - Insère plusieurs valeurs (`école/ecole`, `élève/eleve`, `étude/etude`) dans la table `comparaison`.  
  - Recherche les entrées où `texteA = 'eleve'` et montre que `élève` est considéré identique.  
  - Trie les entrées par `texteA` et illustre que les accents sont ignorés dans l’ordre des résultats.  
  - Vérifie la structure et le contenu de la table.

- **sortie5.txt**  
  Fichier de sortie généré lors de l’exécution du script.  
  Contient les résultats des insertions, recherches et tris.

## Conclusion

Cet exercice montre que :
- Les collations insensibles aux accents (utf8mb4_unicode_ci, utf8mb4_general_ci) considèrent élève et eleve comme égaux.
- Le tri ignore les accents et majuscules, ce qui peut modifier l’ordre attendu.
- La collation choisie a un impact direct sur la recherche et le tri des données textuelles.

---

## Commande d’exécution

Depuis l’emplacement du dossier `Exercice5` :

```bash
chris@Chris:~/Jeux-Caract-res-Collations-MySQL/Exercice5$ mysql -u admin_chris -p --default-character-set=utf8mb4 exploration_types < TP5.sql > sortie5.txt


