-- TP3 : Comparaison de mots accentués avec différentes collations
-- Date : 2023-12-03

-- 1. Création de la table avec deux colonnes et collations différentes
DROP TABLE IF EXISTS comparaison_mots;
CREATE TABLE comparaison_mots (
  id INT AUTO_INCREMENT PRIMARY KEY,
  mot_bin VARCHAR(50) COLLATE utf8mb4_bin,
  mot_general VARCHAR(50) COLLATE utf8mb4_general_ci
);

-- 2. Insertion de données pour la comparaison
INSERT INTO comparaison_mots (mot_bin, mot_general) VALUES 
('ecole', 'ecole'),
('école', 'école'),
('École', 'École'),
('Ecole', 'Ecole');

-- 3. Comparaison stricte avec utf8mb4_bin
SELECT * FROM comparaison_mots WHERE mot_bin = 'ecole';

-- 4. Comparaison souple avec utf8mb4_general_ci
SELECT * FROM comparaison_mots WHERE mot_general = 'ecole';

-- 5. Tri avec utf8mb4_bin
SELECT mot_bin FROM comparaison_mots ORDER BY mot_bin COLLATE utf8mb4_bin;

-- 6. Tri avec utf8mb4_general_ci
SELECT mot_general FROM comparaison_mots ORDER BY mot_general COLLATE utf8mb4_general_ci;

-- 7. Contrôles supplémentaires
SHOW TABLES;
DESCRIBE comparaison_mots;
SELECT * FROM comparaison_mots;
