-- TP2A : Comparaison de collations avec sortie lisible
-- Date : 2023-12-03

-- 1. Création de la table
DROP TABLE IF EXISTS comparaison;
CREATE TABLE comparaison (
  id INT AUTO_INCREMENT PRIMARY KEY,
  texteA VARCHAR(50) COLLATE utf8mb4_bin,
  texteB VARCHAR(50) COLLATE utf8mb4_general_ci
);

-- 2. Insertion de données
INSERT INTO comparaison (texteA, texteB) VALUES ('café', 'Café');

-- 3. Comparaison stricte et souple
SELECT * FROM comparaison WHERE texteA = texteB;
SELECT * FROM comparaison WHERE texteB = 'café';

-- 4. Contrôles supplémentaires
SHOW TABLES;
DESCRIBE comparaison;
SELECT * FROM comparaison;
