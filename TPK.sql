-- TPK : Recherche FULLTEXT multi-colonnes
-- Objectif : tester la recherche sur plusieurs colonnes (titre + contenu)

DROP DATABASE IF EXISTS exploration_fulltext_multi;
CREATE DATABASE exploration_fulltext_multi CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE exploration_fulltext_multi;

SET NAMES utf8mb4;
SET character_set_connection = utf8mb4;
SET collation_connection = utf8mb4_unicode_ci;

-- PARTIE A : Table avec index FULLTEXT sur plusieurs colonnes

DROP TABLE IF EXISTS articles;
CREATE TABLE articles (
  id INT AUTO_INCREMENT PRIMARY KEY,
  titre VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  contenu TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  FULLTEXT INDEX idx_titre_contenu (titre, contenu)
);

-- Insertion de données multilingues
INSERT INTO articles (titre, contenu) VALUES 
('École en France', 'Bonjour tout le monde! 😃🌍 Bienvenue dans notre école.'),
('Escuela en España', 'Hola Mundo! 🌞 Bienvenidos a nuestra escuela.'),
('学校在中国', '你好，世界！🐉 欢迎来到我们的学校。'),
('مدرسة في العالم العربي', 'مرحبا بالعالم 🌙 أهلا بكم في مدرستنا.'),
('Школа в России', 'Привет мир 🚀 Добро пожаловать в нашу школу.'),
('विद्यालय भारत में', 'नमस्ते दुनिया 🌸 हमारे विद्यालय में आपका स्वागत है।');

-- PARTIE B : Recherches multi-colonnes
-- Recherche sur titre + contenu
SELECT id, titre, contenu,
       MATCH(titre, contenu) AGAINST('école' IN NATURAL LANGUAGE MODE) AS score
FROM articles
ORDER BY score DESC;

-- Recherche en espagnol
SELECT id, titre, contenu,
       MATCH(titre, contenu) AGAINST('escuela' IN NATURAL LANGUAGE MODE) AS score
FROM articles
ORDER BY score DESC;

-- Recherche en chinois
SELECT id, titre, contenu,
       MATCH(titre, contenu) AGAINST('学校' IN NATURAL LANGUAGE MODE) AS score
FROM articles
ORDER BY score DESC;

-- PARTIE C : Comparaison stricte avec LIKE

SELECT id, titre, contenu FROM articles WHERE titre COLLATE utf8mb4_bin LIKE '%école%';
SELECT id, titre, contenu FROM articles WHERE contenu COLLATE utf8mb4_bin LIKE '%école%';
