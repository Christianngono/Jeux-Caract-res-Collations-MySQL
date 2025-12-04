-- TP4 : Indexation et performances avec collations
-- Date : 2023-12-03

-- 1. Table avec collation utf8mb4_unicode_ci

DROP TABLE IF EXISTS mots_unicode;
CREATE TABLE mots_unicode (
  id INT AUTO_INCREMENT PRIMARY KEY,
  mot VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  INDEX idx_mot_unicode (mot)
);

-- Insertion de données multilingues
INSERT INTO mots_unicode (mot) VALUES
('ecole'), ('école'), ('École'), ('Ecole'),
('mañana'), ('manana'),
('straße'), ('strasse'),
('学校'), ('школа'), ('مدرسة'), ('विद्यालय');

-- Contrôles
SHOW TABLES;
DESCRIBE mots_unicode;
SELECT * FROM mots_unicode;

-- Recherche avec index
EXPLAIN SELECT * FROM mots_unicode WHERE mot = 'école';
EXPLAIN SELECT * FROM mots_unicode WHERE mot LIKE 'ecole%';

-- Tri avec index
EXPLAIN SELECT * FROM mots_unicode ORDER BY mot;


-- 2. Table avec collation utf8mb4_general_ci

DROP TABLE IF EXISTS mots_general;
CREATE TABLE mots_general (
  id INT AUTO_INCREMENT PRIMARY KEY,
  mot VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  INDEX idx_mot_general (mot)
);

-- Insertion des mêmes données
INSERT INTO mots_general (mot) VALUES
('ecole'), ('école'), ('École'), ('Ecole'),
('mañana'), ('manana'),
('straße'), ('strasse'),
('学校'), ('школа'), ('مدرسة'), ('विद्यालय');

-- Contrôles
SHOW TABLES;
DESCRIBE mots_general;
SELECT * FROM mots_general;

-- Recherche avec index
EXPLAIN SELECT * FROM mots_general WHERE mot = 'école';
EXPLAIN SELECT * FROM mots_general WHERE mot LIKE 'ecole%';

-- Tri avec index
EXPLAIN SELECT * FROM mots_general ORDER BY mot;

-- 3. Comparaison pratique
-- utf8mb4_unicode_ci : recherche stricte, accents différenciés, index utilisé correctement
-- utf8mb4_general_ci : recherche plus souple, accents ignorés, index peut matcher plus de résultats
