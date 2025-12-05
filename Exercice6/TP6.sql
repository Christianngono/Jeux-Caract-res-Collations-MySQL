--Projet Final - Bibliothèque multilingue

-- Forcer la connexion en utf8mb4 pour supporter les emojis et scripts multilingues
SET NAMES utf8mb4;
SET character_set_connection = utf8mb4;
SET character_set_results = utf8mb4;
SET character_set_client = utf8mb4;

-- 1. Création de la base de données
CREATE DATABASE IF NOT EXISTS bibliotheque_multilingue
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE bibliotheque_multilingue;

-- 2. Création de la table livres
DROP TABLE IF EXISTS livres;
CREATE TABLE livres (
  id INT AUTO_INCREMENT PRIMARY KEY,
  titre VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  auteur VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  langue VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  resume TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
);

-- 3. Insertion de données multilingues avec accents et emojis
INSERT INTO livres (titre, auteur, langue, resume) VALUES
('L\'école des femmes', 'Molière', 'français', 'Une comédie classique 🎭'),
('La escuela de la vida', 'Carlos Ruiz', 'espagnol', 'Un récit sur l\'apprentissage 📚'),
('学校物語', '山田太郎', 'chinois', '物語についての短い説明'),
('Die Schule am See', 'Hans Müller', 'allemand', 'Eine Geschichte über eine Schule am See'),
('ÉCOLE de magie', 'Jean Dupont', 'français', 'Un résumé avec des accents ✨'),
('El niño y la escuela', 'Gabriel García', 'espagnol', 'Historia con acentos y emoción 😍'),
('School Days', 'John Smith', 'anglais', 'A short summary with emoji 😊'),
('Школа жизни', 'Иван Петров', 'russe', 'Краткое описание книги'),
('Escuela internacional', 'María López', 'espagnol', 'Un cuento sobre diversidad 🌍'),
('المدرسة الكبيرة', 'أحمد علي', 'arabe', 'ملخص قصير عن الكتاب 📖');

-- 4. Recherche avec collation
-- Recherche insensible à la casse et aux accents
SELECT * FROM livres WHERE titre LIKE '%ecole%' COLLATE utf8mb4_unicode_ci;

-- Recherche des livres en espagnol triés par titre
SELECT * FROM livres WHERE langue = 'espagnol'
ORDER BY titre COLLATE utf8mb4_spanish_ci;

-- 5. Modification des collations
ALTER TABLE livres MODIFY titre VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;

-- Recherche sensible à la casse
SELECT * FROM livres WHERE titre LIKE '%école%' COLLATE utf8mb4_bin;
