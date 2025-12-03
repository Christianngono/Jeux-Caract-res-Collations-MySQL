-- TPD : Comparaisons et tris multi-colonnes avec collations
-- Objectif : observer l’impact des collations sur prénom/nom avec accents et majuscules

DROP DATABASE IF EXISTS exploration_multicolonnes;
CREATE DATABASE exploration_multicolonnes CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE exploration_multicolonnes;

SET NAMES utf8mb4;
SET character_set_connection = utf8mb4;
SET collation_connection = utf8mb4_unicode_ci;

-- PARTIE A : Table avec prénom et nom en utf8mb4_unicode_ci

DROP TABLE IF EXISTS personnes_unicode;
CREATE TABLE personnes_unicode (
  id INT AUTO_INCREMENT PRIMARY KEY,
  prenom VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  nom VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
);

INSERT INTO personnes_unicode (prenom, nom) VALUES
('Éric', 'Durand'),
('Eric', 'Durand'),
('éric', 'durand'),
('Ana', 'García'),
('Ana', 'Garcia'),
('Hans', 'Straße'),
('Hans', 'Strasse');

-- Tri par nom puis prénom avec unicode_ci
SELECT prenom, nom FROM personnes_unicode ORDER BY nom COLLATE utf8mb4_unicode_ci, prenom COLLATE utf8mb4_unicode_ci;

-- Tri par nom puis prénom avec general_ci
SELECT prenom, nom FROM personnes_unicode ORDER BY nom COLLATE utf8mb4_general_ci, prenom COLLATE utf8mb4_general_ci;

-- PARTIE B : Comparaison stricte avec utf8mb4_bin

DROP TABLE IF EXISTS personnes_bin;
CREATE TABLE personnes_bin (
  id INT AUTO_INCREMENT PRIMARY KEY,
  prenom VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  nom VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin
);

INSERT INTO personnes_bin (prenom, nom) VALUES
('Éric', 'Durand'),
('Eric', 'Durand'),
('éric', 'durand'),
('Ana', 'García'),
('Ana', 'Garcia'),
('Hans', 'Straße'),
('Hans', 'Strasse');

-- Tri strict sensible à la casse et aux accents
SELECT prenom, nom FROM personnes_bin ORDER BY nom COLLATE utf8mb4_bin, prenom COLLATE utf8mb4_bin;

-- Recherche stricte
SELECT prenom, nom FROM personnes_bin WHERE nom = 'Durand';
SELECT prenom, nom FROM personnes_bin WHERE nom = 'durand';
