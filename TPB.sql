-- TPB : Performances et indexation avec collations
-- Objectif : comparer l’impact des collations sur les recherches et tris avec index

DROP DATABASE IF EXISTS exploration_index;
CREATE DATABASE exploration_index CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE exploration_index;

SET NAMES utf8mb4;
SET character_set_connection = utf8mb4;
SET collation_connection = utf8mb4_unicode_ci;

-- PARTIE A : Table avec index en utf8mb4_unicode_ci
-- 
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

-- Recherche avec index
EXPLAIN SELECT * FROM mots_unicode WHERE mot = 'école';
EXPLAIN SELECT * FROM mots_unicode WHERE mot LIKE 'ecole%';

-- Tri avec index
EXPLAIN SELECT * FROM mots_unicode ORDER BY mot;

-- PARTIE B : Table avec index en utf8mb4_general_ci

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

-- Recherche avec index
EXPLAIN SELECT * FROM mots_general WHERE mot = 'école';
EXPLAIN SELECT * FROM mots_general WHERE mot LIKE 'ecole%';

-- Tri avec index
EXPLAIN SELECT * FROM mots_general ORDER BY mot;
-- PARTIE C : Comparaison pratique
-- 
-- Unicode_ci : recherche stricte, accents différenciés, index utilisé correctement
-- General_ci : recherche plus souple, accents ignorés, index peut matcher plus de résultats

-- Exemple de comparaison directe
SELECT mot FROM mots_unicode WHERE mot = 'ecole';
SELECT mot FROM mots_general WHERE mot = 'ecole';

SELECT mot FROM mots_unicode ORDER BY mot;
SELECT mot FROM mots_general ORDER BY mot;
