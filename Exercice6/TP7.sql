SET NAMES utf8mb4;
SET character_set_connection = utf8mb4;
SET character_set_results = utf8mb4;
SET character_set_client = utf8mb4;

CREATE DATABASE IF NOT EXISTS bibliotheque_multilingue
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE bibliotheque_multilingue;

DROP TABLE IF EXISTS livres;
CREATE TABLE livres (
  id INT AUTO_INCREMENT PRIMARY KEY,
  titre VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  auteur VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  langue VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  resume TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
);

INSERT INTO livres (titre, auteur, langue, resume) VALUES
('L\'école des femmes', 'Molière', 'français', 'Une comédie classique 🎭'),
('ÉCOLE de magie', 'Jean Dupont', 'français', 'Un résumé avec des accents ✨'),
('La escuela de la vida', 'Carlos Ruiz', 'espagnol', 'Un récit sur l\'apprentissage 📚'),
('El niño y la escuela', 'Gabriel García', 'espagnol', 'Historia con acentos y emoción 😍'),
('Escuela internacional', 'María López', 'espagnol', 'Un cuento sobre diversidad 🌍');

-- Recherches comparatives

-- Recherche insensible à la casse et aux accents
SELECT 'utf8mb4_unicode_ci' AS Collation, titre
FROM livres
WHERE titre LIKE '%ecole%' COLLATE utf8mb4_unicode_ci;

-- Recherche espagnole triée
SELECT 'utf8mb4_spanish_ci' AS Collation, titre
FROM livres
WHERE langue = 'espagnol'
ORDER BY titre COLLATE utf8mb4_spanish_ci;

-- Recherche sensible à la casse et aux accents
ALTER TABLE livres MODIFY titre VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;

SELECT 'utf8mb4_bin' AS Collation, titre
FROM livres
WHERE titre LIKE '%école%' COLLATE utf8mb4_bin;

-- Schéma ASCII imprimé directement

SELECT 'Recherche : "ecole"' AS Ligne
UNION ALL SELECT 'utf8mb4_unicode_ci'
UNION ALL SELECT ' ├── "école"   → trouvé'
UNION ALL SELECT ' ├── "ÉCOLE"   → trouvé'
UNION ALL SELECT ' └── "ecole"   → trouvé'
UNION ALL SELECT '   (insensible à casse et accents)'
UNION ALL SELECT ''
UNION ALL SELECT 'utf8mb4_spanish_ci'
UNION ALL SELECT ' ├── "niño"    → tri correct (ñ après n)'
UNION ALL SELECT ' ├── "escuela" → ordre respecté'
UNION ALL SELECT ' └── "École"   → trouvé'
UNION ALL SELECT '   (respect des règles linguistiques espagnoles)'
UNION ALL SELECT ''
UNION ALL SELECT 'utf8mb4_bin'
UNION ALL SELECT ' ├── "école"   → trouvé'
UNION ALL SELECT ' ├── "ÉCOLE"   → NON trouvé'
UNION ALL SELECT ' └── "ecole"   → NON trouvé'
UNION ALL SELECT '   (comparaison stricte, sensible à casse et accents)';
