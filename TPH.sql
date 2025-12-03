-- TPH : Recherche plein texte (FULLTEXT) avec collations et multilingue
-- Objectif : tester la recherche linguistique avancée

DROP DATABASE IF EXISTS exploration_fulltext;
CREATE DATABASE exploration_fulltext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE exploration_fulltext;

SET NAMES utf8mb4;
SET character_set_connection = utf8mb4;
SET collation_connection = utf8mb4_unicode_ci;

-- PARTIE A : Table avec index FULLTEXT

DROP TABLE IF EXISTS articles;
CREATE TABLE articles (
  id INT AUTO_INCREMENT PRIMARY KEY,
  contenu TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  FULLTEXT INDEX idx_contenu (contenu)
);

-- Insertion de textes multilingues
INSERT INTO articles (contenu) VALUES ('Bonjour tout le monde! 😃🌍 Bienvenue dans notre école.');
INSERT INTO articles (contenu) VALUES ('Hola Mundo! 🌞 Bienvenidos a nuestra escuela.');
INSERT INTO articles (contenu) VALUES ('你好，世界！🐉 欢迎来到我们的学校。');
INSERT INTO articles (contenu) VALUES ('مرحبا بالعالم 🌙 أهلا بكم في مدرستنا.');
INSERT INTO articles (contenu) VALUES ('Привет мир 🚀 Добро пожаловать в нашу школу.');
INSERT INTO articles (contenu) VALUES ('नमस्ते दुनिया 🌸 हमारे विद्यालय में आपका स्वागत है।');


-- PARTIE B : Recherches plein texte

-- Recherche en français
SELECT id, contenu FROM articles WHERE MATCH(contenu) AGAINST('école' IN NATURAL LANGUAGE MODE);

-- Recherche en espagnol
SELECT id, contenu FROM articles WHERE MATCH(contenu) AGAINST('escuela' IN NATURAL LANGUAGE MODE);

-- Recherche en chinois
SELECT id, contenu FROM articles WHERE MATCH(contenu) AGAINST('学校' IN NATURAL LANGUAGE MODE);

-- Recherche en arabe
SELECT id, contenu FROM articles WHERE MATCH(contenu) AGAINST('مدرسة' IN NATURAL LANGUAGE MODE);

-- Recherche en russe
SELECT id, contenu FROM articles WHERE MATCH(contenu) AGAINST('школа' IN NATURAL LANGUAGE MODE);

-- Recherche en hindi
SELECT id, contenu FROM articles WHERE MATCH(contenu) AGAINST('विद्यालय' IN NATURAL LANGUAGE MODE);

-- PARTIE C : Comparaison collations

-- Recherche stricte avec utf8mb4_bin
SELECT id, contenu FROM articles WHERE contenu COLLATE utf8mb4_bin LIKE '%école%';

-- Recherche souple avec unicode_ci
SELECT id, contenu FROM articles WHERE contenu COLLATE utf8mb4_unicode_ci LIKE '%ecole%';
