-- TP : Jeux de caractères et collations dans MySQL/MariaDB

-- 1. Supprimer la base si elle existe déjà pour repartir propre
DROP DATABASE IF EXISTS exploration_types;
CREATE DATABASE exploration_types CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 2. Utiliser la base
USE exploration_types;

-- 3. Forcer la session à utiliser utf8mb4 (important pour les emojis)
SET NAMES utf8mb4;
SET character_set_connection = utf8mb4;
SET collation_connection = utf8mb4_unicode_ci;

-- PARTIE A : Table principale avec messages multilingues et emojis

DROP TABLE IF EXISTS messages;
CREATE TABLE messages (
  id INT AUTO_INCREMENT PRIMARY KEY,
  texte TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
);

-- Insertion de données multilingues et avec emojis
INSERT INTO messages (texte) VALUES ('Bonjour tout le monde! 😃🌍');
INSERT INTO messages (texte) VALUES ('Hola Mundo! 🌞');
INSERT INTO messages (texte) VALUES ('你好，世界！🐉');
INSERT INTO messages (texte) VALUES ('مرحبا بالعالم 🌙');   -- Arabe
INSERT INTO messages (texte) VALUES ('Привет мир 🚀');       -- Russe
INSERT INTO messages (texte) VALUES ('नमस्ते दुनिया 🌸');     -- Hindi

-- Consultation des données
SELECT * FROM messages;

-- PARTIE B : Comparaison collations avec mots accentués

DROP TABLE IF EXISTS mots;
CREATE TABLE mots (
  id INT AUTO_INCREMENT PRIMARY KEY,
  mot VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
);

-- Insertion de mots avec accents et variations
INSERT INTO mots (mot) VALUES 
('ecole'),
('école'),
('École'),
('Ecole'),
('mañana'),   -- Espagnol avec ñ
('manana'),   -- Sans accent
('straße'),   -- Allemand ß
('strasse');  -- Variante sans ß

-- Tri avec utf8mb4_unicode_ci
SELECT mot FROM mots ORDER BY mot COLLATE utf8mb4_unicode_ci;

-- Tri avec utf8mb4_general_ci
SELECT mot FROM mots ORDER BY mot COLLATE utf8mb4_general_ci;

-- PARTIE C : Comparaison des recherches

-- Recherche stricte avec utf8mb4_unicode_ci (accents différenciés)
SELECT mot 
FROM mots 
WHERE mot = 'ecole' COLLATE utf8mb4_unicode_ci;

-- Recherche souple avec utf8mb4_general_ci (accents ignorés)
SELECT mot 
FROM mots 
WHERE mot = 'ecole' COLLATE utf8mb4_general_ci;

-- Recherche LIKE avec utf8mb4_unicode_ci
SELECT mot 
FROM mots 
WHERE mot LIKE 'ecole' COLLATE utf8mb4_unicode_ci;

-- Recherche LIKE avec utf8mb4_general_ci
SELECT mot 
FROM mots 
WHERE mot LIKE 'ecole' COLLATE utf8mb4_general_ci;

-- PARTIE D : Tri multilingue

DROP TABLE IF EXISTS multilingue;
CREATE TABLE multilingue (
  id INT AUTO_INCREMENT PRIMARY KEY,
  mot VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
);

-- Insertion de mots dans différentes langues
INSERT INTO multilingue (mot) VALUES
('école'),     -- Français
('escuela'),   -- Espagnol
('schule'),    -- Allemand
('学校'),       -- Chinois
('مدرسة'),     -- Arabe
('школа'),     -- Russe
('विद्यालय');   -- Hindi

-- Tri avec utf8mb4_unicode_ci
SELECT mot FROM multilingue ORDER BY mot COLLATE utf8mb4_unicode_ci;

-- Tri avec utf8mb4_general_ci
SELECT mot FROM multilingue ORDER BY mot COLLATE utf8mb4_general_ci;

-- PARTIE E : Export / Dump
-- Pour sauvegarder la base exploration_types et rejouer le TP ailleurs :
-- Exécuter dans le terminal (hors SQL) :
-- mysqldump -u admin_chris -p exploration_types > TP2_dump.sql
-- Pour restaurer :
-- mysql -u admin_chris -p exploration_types < TP2_dump.sql
