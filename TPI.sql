-- TPI : Recherche FULLTEXT avec opérateurs booléens
-- Objectif : affiner les recherches avec +, -, * et guillemets

DROP DATABASE IF EXISTS exploration_fulltext_bool;
CREATE DATABASE exploration_fulltext_bool CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE exploration_fulltext_bool;

SET NAMES utf8mb4;
SET character_set_connection = utf8mb4;
SET collation_connection = utf8mb4_unicode_ci;

-- PARTIE A : Table avec index FULLTEXT

DROP TABLE IF EXISTS documents;
CREATE TABLE documents (
  id INT AUTO_INCREMENT PRIMARY KEY,
  contenu TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  FULLTEXT INDEX idx_contenu (contenu)
);

-- Insertion de textes multilingues
INSERT INTO documents (contenu) VALUES ('Bonjour tout le monde! 😃🌍 Bienvenue dans notre école.');
INSERT INTO documents (contenu) VALUES ('Hola Mundo! 🌞 Bienvenidos a nuestra escuela.');
INSERT INTO documents (contenu) VALUES ('你好，世界！🐉 欢迎来到我们的学校。');
INSERT INTO documents (contenu) VALUES ('مرحبا بالعالم 🌙 أهلا بكم في مدرستنا.');
INSERT INTO documents (contenu) VALUES ('Привет мир 🚀 Добро пожаловать в нашу школу.');
INSERT INTO documents (contenu) VALUES ('नमस्ते दुनिया 🌸 हमारे विद्यालय में आपका स्वागत है।');

-- PARTIE B : Recherches avec opérateurs booléens

-- 1. Inclure obligatoirement un mot (+)
SELECT id, contenu FROM documents 
WHERE MATCH(contenu) AGAINST('+école' IN BOOLEAN MODE);

-- 2. Exclure un mot (-)
SELECT id, contenu FROM documents 
WHERE MATCH(contenu) AGAINST('escuela -Hola' IN BOOLEAN MODE);

-- 3. Recherche avec troncature (*)
SELECT id, contenu FROM documents 
WHERE MATCH(contenu) AGAINST('escol*' IN BOOLEAN MODE);

-- 4. Recherche exacte avec guillemets
SELECT id, contenu FROM documents 
WHERE MATCH(contenu) AGAINST('"Bonjour tout le monde"' IN BOOLEAN MODE);

-- 5. Combinaison complexe
SELECT id, contenu FROM documents 
WHERE MATCH(contenu) AGAINST('+escuela +"Hola Mundo" -Bienvenidos' IN BOOLEAN MODE);
