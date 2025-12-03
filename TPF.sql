-- TPF : Normalisation Unicode (NFC vs NFD)
-- Objectif : comparer les caractères composés et décomposés

DROP DATABASE IF EXISTS exploration_normalisation;
CREATE DATABASE exploration_normalisation CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE exploration_normalisation;

SET NAMES utf8mb4;
SET character_set_connection = utf8mb4;
SET collation_connection = utf8mb4_unicode_ci;

-- PARTIE A : Table avec mots normalisés (NFC)

DROP TABLE IF EXISTS mots_nfc;
CREATE TABLE mots_nfc (
  id INT AUTO_INCREMENT PRIMARY KEY,
  mot VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
);

-- Insertion avec caractère é (U+00E9)
INSERT INTO mots_nfc (mot) VALUES ('école');

-- PARTIE B : Table avec mots décomposés (NFD)

DROP TABLE IF EXISTS mots_nfd;
CREATE TABLE mots_nfd (
  id INT AUTO_INCREMENT PRIMARY KEY,
  mot VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
);

-- Insertion avec e + accent aigu (U+0065 + U+0301)
INSERT INTO mots_nfd (mot) VALUES (CONCAT('e', UNHEX('CC81'), 'cole'));

-- PARTIE C : Comparaison des recherches

-- Recherche dans NFC
SELECT mot FROM mots_nfc WHERE mot = 'école';

-- Recherche dans NFD
SELECT mot FROM mots_nfd WHERE mot = 'école';

-- Comparaison stricte avec utf8mb4_bin
SELECT mot FROM mots_nfc WHERE mot = 'école' COLLATE utf8mb4_bin;
SELECT mot FROM mots_nfd WHERE mot = 'école' COLLATE utf8mb4_bin;

-- PARTIE D : Tri et affichage

SELECT mot, HEX(mot) FROM mots_nfc;
SELECT mot, HEX(mot) FROM mots_nfd;
