-- TPE : Collations et tri par langue
-- Objectif : comparer le tri français, espagnol et allemand sur un même jeu de données

DROP DATABASE IF EXISTS exploration_locales;
CREATE DATABASE exploration_locales CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE exploration_locales;

SET NAMES utf8mb4;
SET character_set_connection = utf8mb4;
SET collation_connection = utf8mb4_unicode_ci;

-- PARTIE A : Jeu de données multilingue

DROP TABLE IF EXISTS mots;
CREATE TABLE mots (
  id INT AUTO_INCREMENT PRIMARY KEY,
  mot VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
);

INSERT INTO mots (mot) VALUES
('école'),     -- Français
('ecole'),
('École'),
('mañana'),    -- Espagnol avec ñ
('manana'),
('niño'),      -- Espagnol avec ñ
('nino'),
('straße'),    -- Allemand ß
('strasse'),
('Ana'),
('Éric'),
('Hans');

-- PARTIE B : Tri avec collation française

SELECT mot FROM mots ORDER BY mot COLLATE utf8mb4_unicode_ci;   -- Unicode par défaut
-- Pour comparer, utiliser utf8mb4_general_ci
SELECT mot FROM mots ORDER BY mot COLLATE utf8mb4_general_ci;

-- PARTIE C : Tri avec collation espagnole

SELECT mot FROM mots ORDER BY mot COLLATE utf8mb4_spanish_ci;

-- PARTIE D : Tri avec collation allemande (via unicode)

-- MariaDB/MySQL ne fournit pas utf8mb4_german_ci, donc on utilise unicode_ci
SELECT mot FROM mots ORDER BY mot COLLATE utf8mb4_unicode_ci;

-- PARTIE E : Comparaison pratique

-- Français : accents différenciés, 'école' ≠ 'ecole'
-- Espagnol : ñ est trié après n, 'mañana' ≠ 'manana'
-- Allemand : ß est distingué de ss avec unicode_ci
