-- TP14 : Recherche FULLTEXT avec filtres combinés
-- Objectif : simuler un moteur de recherche avancé (titre + contenu + filtres)

DROP DATABASE IF EXISTS exploration_fulltext_filters;
CREATE DATABASE exploration_fulltext_filters CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE exploration_fulltext_filters;

SET NAMES utf8mb4;
SET character_set_connection = utf8mb4;
SET collation_connection = utf8mb4_unicode_ci;


-- PARTIE A : Table avec colonnes supplémentaires

DROP TABLE IF EXISTS docs;
CREATE TABLE docs (
  id INT AUTO_INCREMENT PRIMARY KEY,
  titre VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  contenu TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  langue VARCHAR(20),
  categorie VARCHAR(50),
  date_publication DATE,
  FULLTEXT INDEX idx_titre_contenu (titre, contenu)
);

-- Insertion de données multilingues avec métadonnées
INSERT INTO docs (titre, contenu, langue, categorie, date_publication) VALUES
('École en France', 'Bonjour tout le monde! Bienvenue dans notre école.', 'fr', 'education', '2025-01-10'),
('Escuela en España', 'Hola Mundo! Bienvenidos a nuestra escuela.', 'es', 'education', '2025-02-15'),
('学校在中国', '你好，世界！欢迎来到我们的学校。', 'zh', 'education', '2025-03-20'),
('مدرسة في العالم العربي', 'مرحبا بالعالم أهلا بكم في مدرستنا.', 'ar', 'education', '2025-04-05'),
('Школа в России', 'Привет мир Добро пожаловать в нашу школу.', 'ru', 'education', '2025-05-12'),
('विद्यालय भारत में', 'नमस्ते दुनिया हमारे विद्यालय में आपका स्वागत है।', 'hi', 'education', '2025-06-18'),
('Tech Conference', 'Exploring AI, ML and Data Science.', 'en', 'technology', '2025-07-01'),
('Sports Event', 'Football World Cup highlights.', 'en', 'sports', '2025-08-22');


-- PARTIE B : Recherches avec filtres

-- 1. Recherche en français uniquement
SELECT id, titre, contenu, langue,
       MATCH(titre, contenu) AGAINST('école' IN NATURAL LANGUAGE MODE) AS score
FROM docs
WHERE langue = 'fr'
ORDER BY score DESC;

-- 2. Recherche en catégorie "education" après février 2025
SELECT id, titre, contenu, categorie, date_publication,
       MATCH(titre, contenu) AGAINST('escuela' IN NATURAL LANGUAGE MODE) AS score
FROM docs
WHERE categorie = 'education' AND date_publication > '2025-02-01'
ORDER BY score DESC;

-- 3. Recherche en anglais dans catégorie "technology"
SELECT id, titre, contenu, categorie,
       MATCH(titre, contenu) AGAINST('AI' IN NATURAL LANGUAGE MODE) AS score
FROM docs
WHERE langue = 'en' AND categorie = 'technology'
ORDER BY score DESC;

-- 4. Recherche multilingue avec exclusion (pas de sports)
SELECT id, titre, contenu, categorie,
       MATCH(titre, contenu) AGAINST('school' IN NATURAL LANGUAGE MODE) AS score
FROM docs
WHERE categorie <> 'sports'
ORDER BY score DESC;
