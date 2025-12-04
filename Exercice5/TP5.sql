-- Date : 2024-10-03

-- 1. Insertion de données pour la recherche et le tri

-- On suppose que la table comparaison existe déjà (créée dans les exercices précédents)
-- et qu'elle utilise une collation insensible aux accents (ex: utf8mb4_unicode_ci ou utf8mb4_general_ci)

INSERT INTO comparaison (texteA, texteB) VALUES ('école', 'ecole');
INSERT INTO comparaison (texteA, texteB) VALUES ('élève', 'eleve');
INSERT INTO comparaison (texteA, texteB) VALUES ('étude', 'etude');

-- 2. Recherche avec collation

-- Ici, "élève" et "eleve" sont considérés comme égaux si la collation est insensible aux accents
SELECT * FROM comparaison WHERE texteA = 'eleve';

-- 3. Tri avec collation

-- Les mots accentués sont triés comme s'ils n'avaient pas d'accents
SELECT * FROM comparaison ORDER BY texteA;

-- 4. Vérifications supplémentaires

SHOW TABLES;
DESCRIBE comparaison;
SELECT * FROM comparaison;

-- Notes :
-- - Avec utf8mb4_unicode_ci ou utf8mb4_general_ci, les accents sont ignorés pour les comparaisons et tris.
-- - Exemple : "élève" et "eleve" sont considérés identiques.
-- - Le tri place "école", "ecole", "étude" comme si les accents n’existaient pas.
