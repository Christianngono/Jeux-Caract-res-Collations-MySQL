SET NAMES utf8mb4;

USE bibliotheque_multilingue;

-- Requête Unicode CI
SELECT 'utf8mb4_unicode_ci' AS Collation, titre
FROM livres
WHERE titre LIKE '%ecole%' COLLATE utf8mb4_unicode_ci;

-- Requête Spanish CI
SELECT 'utf8mb4_spanish_ci' AS Collation, titre
FROM livres
WHERE langue = 'espagnol'
ORDER BY titre COLLATE utf8mb4_spanish_ci;

-- Requête Binary
SELECT 'utf8mb4_bin' AS Collation, titre
FROM livres
WHERE titre LIKE '%école%' COLLATE utf8mb4_bin;

-- Export ASCII comparatif
SELECT 'Recherche : "ecole"' AS Ligne
UNION ALL SELECT 'utf8mb4_unicode_ci | "école"=trouvé | "ÉCOLE"=trouvé | "ecole"=trouvé'
UNION ALL SELECT 'utf8mb4_spanish_ci | "niño"=tri ✔ | "escuela"=ordre ✔ | "École"=trouvé'
UNION ALL SELECT 'utf8mb4_bin | "école"=trouvé | "ÉCOLE"=NON | "ecole"=NON';
