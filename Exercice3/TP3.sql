-- Date : 2023-12-04

-- 1. Harmonisation des collations des deux colonnes
ALTER TABLE comparaison MODIFY texteA VARCHAR(50) COLLATE utf8mb4_unicode_ci;
ALTER TABLE comparaison MODIFY texteB VARCHAR(50) COLLATE utf8mb4_unicode_ci;

-- 2. Vérification des modifications
SHOW TABLES;
DESCRIBE comparaison;

-- 3. Comparaison des colonnes après modification
SELECT * FROM comparaison WHERE texteA = texteB;

-- Notes :
-- Les deux colonnes utilisent maintenant la même collation (utf8mb4_unicode_ci).
-- 'café' et 'Café' devraient être considérés comme égaux car la collation est insensible à la casse.

