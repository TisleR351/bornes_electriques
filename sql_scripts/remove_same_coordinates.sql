-- Dans le but d'éviter d'afficher les points les uns sur les autres, nous devons
-- filtrer notre base de données pour quelle supprime chaque entrée de la table
-- qui contient les mêmes latitudes/longitudes.
DELETE FROM borne_electrique
WHERE (consolidated_longitude, consolidated_latitude) IN (
    SELECT consolidated_longitude, consolidated_latitude
    FROM (SELECT consolidated_longitude, consolidated_latitude
          FROM borne_electrique) AS temp
    GROUP BY consolidated_longitude, consolidated_latitude
    HAVING COUNT(*) > 1
);