-- TP5 : Collations sensibles à la casse (case-sensitive)
-- Objectif : comparer utf8mb4_bin et utf8mb4_cs pour voir la différence entre École et école

DROP DATABASE IF EXISTS exploration_case;
CREATE DATABASE exploration_case CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE exploration_case;

SET NAMES utf8mb4;
SET character_set_connection = utf8mb4;
SET collation_connection = utf8mb4_unicode_ci;

-- PARTIE A : Table avec collation unicode_ci (insensible à la casse)

DROP TABLE IF EXISTS mots_unicode;
CREATE TABLE mots_unicode (
  id INT AUTO_INCREMENT PRIMARY KEY,
  mot VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
);

INSERT INTO mots_unicode (mot) VALUES
('ecole'),
('école'),
('École'),
('Ecole');

-- Recherche insensible à la casse
SELECT mot FROM mots_unicode WHERE mot = 'ecole';


-- PARTIE B : Table avec collation utf8mb4_bin (sensible à la casse et aux accents)

DROP TABLE IF EXISTS mots_bin;
CREATE TABLE mots_bin (
  id INT AUTO_INCREMENT PRIMARY KEY,
  mot VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin
);

INSERT INTO mots_bin (mot) VALUES
('ecole'),
('école'),
('École'),
('Ecole');

-- Recherche sensible à la casse et aux accents
SELECT mot FROM mots_bin WHERE mot = 'ecole';
SELECT mot FROM mots_bin WHERE mot = 'École';
SELECT mot FROM mots_bin WHERE mot = 'école';

-- PARTIE C : Comparaison pratique

-- unicode_ci : 'ecole', 'Ecole', 'École', 'école' sont considérés équivalents
-- utf8mb4_bin : chaque variante est distinguée (casse et accents pris en compte)

-- Tri avec unicode_ci
SELECT mot FROM mots_unicode ORDER BY mot;

-- Tri avec utf8mb4_bin
SELECT mot FROM mots_bin ORDER BY mot;
