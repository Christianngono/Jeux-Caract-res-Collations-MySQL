-- Date : 2023-12-04

-- 1. S'assurer que la base utilise utf8mb4

ALTER DATABASE exploration_types CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 2. Création de la table avec encodage utf8mb4

DROP TABLE IF EXISTS test_encodage;
CREATE TABLE test_encodage (
  id INT AUTO_INCREMENT PRIMARY KEY,
  texte VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
);

-- 3. Vérification initiale

SHOW TABLES;
DESCRIBE test_encodage;

-- 4. Insertion d'un texte avec emoji (réussite attendue)

INSERT INTO test_encodage (texte) VALUES ('Ceci est un test 😃');

-- 5. Vérification finale

SELECT * FROM test_encodage;

-- Notes :
-- - utf8 (MySQL/MariaDB) = encodage limité à 3 octets → ne supporte pas les emojis.
-- - utf8mb4 = encodage complet sur 4 octets → supporte les emojis et caractères Unicode modernes.
-- - En harmonisant la base, la table et la colonne en utf8mb4, l'insertion de l'emoji réussit.
