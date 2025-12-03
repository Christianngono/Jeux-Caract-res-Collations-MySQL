-- TPJ : Recherche FULLTEXT avec score de pertinence
-- Objectif : afficher les scores et tester WITH QUERY EXPANSION

DROP DATABASE IF EXISTS exploration_fulltext_score;
CREATE DATABASE exploration_fulltext_score CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE exploration_fulltext_score;

SET NAMES utf8mb4;
SET character_set_connection = utf8mb4;
SET collation_connection = utf8mb4_unicode_ci;

-- PARTIE A : Table avec index FULLTEXT

DROP TABLE IF EXISTS textes;
CREATE TABLE textes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  contenu TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  FULLTEXT INDEX idx_contenu (contenu)
);

-- Insertion de textes multilingues
INSERT INTO textes (contenu) VALUES ('Bonjour tout le monde! 😃🌍 Bienvenue dans notre école.');
INSERT INTO textes (contenu) VALUES ('Hola Mundo! 🌞 Bienvenidos a nuestra escuela.');
INSERT INTO textes (contenu) VALUES ('你好，世界！🐉 欢迎来到我们的学校。');
INSERT INTO textes (contenu) VALUES ('مرحبا بالعالم 🌙 أهلا بكم في مدرستنا.');
INSERT INTO textes (contenu) VALUES ('Привет мир 🚀 Добро пожаловать dans notre école.');
INSERT INTO textes (contenu) VALUES ('नमस्ते दुनिया 🌸 हमारे विद्यालय में आपका स्वागत है।');

-- PARTIE B : Recherche avec score

-- Recherche en français avec affichage du score
SELECT id, contenu,
       MATCH(contenu) AGAINST('école' IN NATURAL LANGUAGE MODE) AS score
FROM textes
ORDER BY score DESC;

-- Recherche en espagnol avec score
SELECT id, contenu,
       MATCH(contenu) AGAINST('escuela' IN NATURAL LANGUAGE MODE) AS score
FROM textes
ORDER BY score DESC;

-- PARTIE C : Recherche avec QUERY EXPANSION

-- Query expansion : élargit la recherche en ajoutant des termes liés
SELECT id, contenu,
       MATCH(contenu) AGAINST('école' WITH QUERY EXPANSION) AS score
FROM textes
ORDER BY score DESC;

-- PARTIE D : Comparaison stricte avec LIKE

SELECT id, contenu FROM textes WHERE contenu COLLATE utf8mb4_bin LIKE '%école%';
