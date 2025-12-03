-- TPG : Emojis complexes et séquences ZWJ
-- Objectif : tester la compatibilité avec emojis composés (familles, drapeaux, combinaisons)

DROP DATABASE IF EXISTS exploration_emojis;
CREATE DATABASE exploration_emojis CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE exploration_emojis;

SET NAMES utf8mb4;
SET character_set_connection = utf8mb4;
SET collation_connection = utf8mb4_unicode_ci;

-- PARTIE A : Table avec emojis simples et complexes

DROP TABLE IF EXISTS emojis;
CREATE TABLE emojis (
  id INT AUTO_INCREMENT PRIMARY KEY,
  symbole VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
);

-- Emojis simples
INSERT INTO emojis (symbole) VALUES ('😃');       -- visage souriant
INSERT INTO emojis (symbole) VALUES ('🌍');       -- globe terrestre
INSERT INTO emojis (symbole) VALUES ('🐉');       -- dragon

-- Emojis complexes avec ZWJ (Zero Width Joiner)
INSERT INTO emojis (symbole) VALUES ('👨‍👩‍👧‍👦'); -- famille (homme + femme + fille + garçon)
INSERT INTO emojis (symbole) VALUES ('👩‍💻');     -- femme développeuse (femme + ordinateur)
INSERT INTO emojis (symbole) VALUES ('👨‍🚀');     -- homme astronaute (homme + fusée)

-- Emojis drapeaux (séquences de deux lettres régionales)
INSERT INTO emojis (symbole) VALUES ('🇫🇷');      -- France
INSERT INTO emojis (symbole) VALUES ('🇪🇸');      -- Espagne
INSERT INTO emojis (symbole) VALUES ('🇩🇪');      -- Allemagne

-- PARTIE B : Affichage et comparaison

SELECT id, symbole, HEX(symbole) FROM emojis;

-- Comparaison stricte avec utf8mb4_bin
SELECT symbole FROM emojis WHERE symbole = '👨‍👩‍👧‍👦' COLLATE utf8mb4_bin;

-- Comparaison souple avec unicode_ci
SELECT symbole FROM emojis WHERE symbole = '👨‍👩‍👧‍👦' COLLATE utf8mb4_unicode_ci;

-- PARTIE C : Tri

SELECT symbole FROM emojis ORDER BY symbole COLLATE utf8mb4_unicode_ci;
SELECT symbole FROM emojis ORDER BY symbole COLLATE utf8mb4_bin;
