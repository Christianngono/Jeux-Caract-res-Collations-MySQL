-- TPA : Collations spécifiques par langue dans MySQL/MariaDB
-- Objectif : comparer les différences de tri et recherche selon les collations linguistiques

DROP DATABASE IF EXISTS exploration_collations;
CREATE DATABASE exploration_collations CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE exploration_collations;

SET NAMES utf8mb4;
SET character_set_connection = utf8mb4;
SET collation_connection = utf8mb4_unicode_ci;

-- PARTIE A : Espagnol (ñ vs n, accents)

DROP TABLE IF EXISTS espagnol;
CREATE TABLE espagnol (
  id INT AUTO_INCREMENT PRIMARY KEY,
  mot VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci
);

INSERT INTO espagnol (mot) VALUES
('nino'),     -- sans ñ
('niño'),     -- avec ñ
('mañana'),   -- avec ñ et accent
('manana');   -- sans accent

-- Tri espagnol
SELECT mot FROM espagnol ORDER BY mot COLLATE utf8mb4_spanish_ci;

-- Tri général
SELECT mot FROM espagnol ORDER BY mot COLLATE utf8mb4_general_ci;

-- PARTIE B : Allemand (ß vs ss)

DROP TABLE IF EXISTS allemand;
CREATE TABLE allemand (
  id INT AUTO_INCREMENT PRIMARY KEY,
  mot VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
);

INSERT INTO allemand (mot) VALUES
('straße'),   -- ß
('strasse');  -- ss

-- Tri avec unicode (gère ß correctement)
SELECT mot FROM allemand ORDER BY mot COLLATE utf8mb4_unicode_ci;

-- Tri avec général
SELECT mot FROM allemand ORDER BY mot COLLATE utf8mb4_general_ci;


-- PARTIE C : Français (accents é vs e)

DROP TABLE IF EXISTS francais;
CREATE TABLE francais (
  id INT AUTO_INCREMENT PRIMARY KEY,
  mot VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
);

INSERT INTO francais (mot) VALUES
('ecole'),
('école'),
('École'),
('Ecole');

-- Tri français (unicode)
SELECT mot FROM francais ORDER BY mot COLLATE utf8mb4_unicode_ci;

-- Tri général
SELECT mot FROM francais ORDER BY mot COLLATE utf8mb4_general_ci;

-- PARTIE D : Comparaison multilingue
DROP TABLE IF EXISTS multilingue;
CREATE TABLE multilingue (
  id INT AUTO_INCREMENT PRIMARY KEY,
  mot VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
);

INSERT INTO multilingue (mot) VALUES
('école'),     -- Français
('escuela'),   -- Espagnol
('schule'),    -- Allemand
('学校'),       -- Chinois
('مدرسة'),     -- Arabe
('школа'),     -- Russe
('विद्यालय');   -- Hindi

-- Tri unicode (multilingue)
SELECT mot FROM multilingue ORDER BY mot COLLATE utf8mb4_unicode_ci;

-- Tri général
SELECT mot FROM multilingue ORDER BY mot COLLATE utf8mb4_general_ci;
