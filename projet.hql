-- Création de la base de données bigdata_athlete
CREATE DATABASE IF NOT EXISTS bigdata_athlete;

-- Création de la table tab3_athlete
CREATE TABLE IF NOT EXISTS bigdata_athlete.tab3_athlete (
    ID BIGINT,
    Name STRING,
    Sex CHAR(3),
    Age INT,
    Height INT,
    Weight INT,
    Team STRING,
    NOC STRING,
    Games STRING,
    Year INT,
    Season STRING,
    City STRING,
    Sport STRING,
    Event STRING,
    Medal STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/app/master_bigdata/'
TBLPROPERTIES ("skip.header.line.count"="1");

-- Sélection de toutes les lignes de la table
SELECT * FROM bigdata_athlete.tab3_athlete;

-- Sélection des 20 premières lignes de la table
SELECT * FROM bigdata_athlete.tab3_athlete LIMIT 20;

-- Analyse de la moyenne du poids par sexe
SELECT
    Sex,
    AVG(Weight) AS AverageWeight,
    COUNT(*) AS Frequency
FROM
    (SELECT Sex, Weight
     FROM bigdata_athlete.tab3_athlete
     WHERE Sex IN ('F', 'M') AND Weight IS NOT NULL) subquery
GROUP BY Sex
ORDER BY Sex;

-- Analyse de la moyenne de la taille par sexe
SELECT
    Sex,
    AVG(Height) AS AverageHeight
FROM
    (SELECT Sex, Height
     FROM bigdata_athlete.tab3_athlete
     WHERE Sex IN ('F', 'M') AND Height IS NOT NULL) subquery
GROUP BY Sex
ORDER BY Sex;

-- Analyse de la distribution du poids par sexe
SELECT 
    Sex, 
    Weight, 
    COUNT(*) as Frequency
FROM bigdata_athlete.tab3_athlete
WHERE Sex IN ('F', 'M') AND Weight IS NOT NULL
GROUP BY Sex, Weight
ORDER BY Sex, Weight;

-- Analyse de la distribution de la taille par sexe
SELECT 
    Sex, 
    Height, 
    COUNT(*) as Frequency
FROM bigdata_athlete.tab3_athlete
WHERE Sex IN ('F', 'M') AND Height IS NOT NULL
GROUP BY Sex, Height
ORDER BY Sex, Height;

-- Classement des 10 pays les plus performants  
SELECT
    Team,
    COUNT(*) AS TotalMedals
FROM
    bigdata_athlete.tab3_athlete
WHERE
    Medal IN ('Gold', 'Silver', 'Bronze')
GROUP BY
    Team
ORDER BY
    TotalMedals DESC
LIMIT 10;

-- Classement des 10 pays les plus performants en termes de médailles d'or
SELECT
    Team,
    COUNT(*) AS Gold
FROM {table_name}
WHERE Medal = 'Gold'
GROUP BY Team
ORDER BY Gold DESC
LIMIT 10;

-- Classement des 10 pays les plus performants en termes de médailles d'argent 
SELECT
    Team,
    COUNT(*) AS Silver
FROM bigdata_athlete.tab3_athlete
WHERE Medal = 'Silver'
GROUP BY Team
ORDER BY Silver DESC
LIMIT 10;

-- Classement des 10 pays les plus performants en termes de médailles bronze 
SELECT
    Team,
    COUNT(*) AS Bronze
FROM bigdata_athlete.tab3_athlete
WHERE Medal = 'Bronze'
GROUP BY Team
ORDER BY Bronze DESC
LIMIT 10;

-- Classement des 10 pays les plus performants avec le nombre de médailles (d'or d'argent et de bronze)
SELECT
    Team,
    COUNT(*) AS TotalMedals,
    SUM(CASE WHEN Medal = 'Gold' THEN 1 ELSE 0 END) AS Gold,
    SUM(CASE WHEN Medal = 'Silver' THEN 1 ELSE 0 END) AS Silver,
    SUM(CASE WHEN Medal = 'Bronze' THEN 1 ELSE 0 END) AS Bronze
FROM bigdata_athlete.tab3_athlete
WHERE Medal IN ('Gold', 'Silver', 'Bronze')
GROUP BY Team
ORDER BY TotalMedals DESC
LIMIT 10;

-- Analyse du total de médailles par sexe (Hommes et Femmes)
SELECT
    Sex,
    COUNT(*) AS TotalMedals
FROM
    bigdata_athlete.tab3_athlete
WHERE
    Medal IN ('Gold', 'Silver', 'Bronze')
GROUP BY
    Sex
ORDER BY
    TotalMedals DESC;

-- Analyse détaillée du total de médailles par sexe avec le nombre de médailles (d'or d'argent et de bronze)
SELECT
    Sex,
    COUNT(*) AS TotalMedals,
    SUM(CASE WHEN Medal = 'Gold' THEN 1 ELSE 0 END) AS Gold,
    SUM(CASE WHEN Medal = 'Silver' THEN 1 ELSE 0 END) AS Silver,
    SUM(CASE WHEN Medal = 'Bronze' THEN 1 ELSE 0 END) AS Bronze
FROM bigdata_athlete.tab3_athlete
WHERE Medal IN ('Gold', 'Silver', 'Bronze')
GROUP BY Sex
ORDER BY TotalMedals DESC;

-- Classement des 10 meilleurs pays masculins en termes de victoires médailles
SELECT
    Team,
    Sex,
    COUNT(*) AS TotalMedals,
    SUM(CASE WHEN Medal = 'Gold' THEN 1 ELSE 0 END) AS Gold,
    SUM(CASE WHEN Medal = 'Silver' THEN 1 ELSE 0 END) AS Silver,
    SUM(CASE WHEN Medal = 'Bronze' THEN 1 ELSE 0 END) AS Bronze
FROM bigdata_athlete.tab3_athlete
WHERE Medal IN ('Gold', 'Silver', 'Bronze') AND Sex IN ('M')
GROUP BY Team,Sex
ORDER BY TotalMedals DESC
LIMIT 10;

-- Classement des 10 meilleurs pays féminins en termes de victoires médailles
SELECT
    Team,
    Sex,
    COUNT(*) AS TotalMedals,
    SUM(CASE WHEN Medal = 'Gold' THEN 1 ELSE 0 END) AS Gold,
    SUM(CASE WHEN Medal = 'Silver' THEN 1 ELSE 0 END) AS Silver,
    SUM(CASE WHEN Medal = 'Bronze' THEN 1 ELSE 0 END) AS Bronze
FROM bigdata_athlete.tab3_athlete
WHERE Medal IN ('Gold', 'Silver', 'Bronze') AND Sex IN ('F')
GROUP BY Team,Sex
ORDER BY TotalMedals DESC
LIMIT 10;

-- Les 10 sports les plus présents aux Jeux Olympiques
SELECT
    Sport,
    COUNT(DISTINCT ID) AS NombreParticipants
FROM
    bigdata_athlete.tab3_athlete
GROUP BY Sport
ORDER BY NombreParticipants DESC
LIMIT 10;

-- Le nombre de médailles remportées par sports ( TOP 10 Classement des performants par Sport)
SELECT
    Sport,
    COUNT(*) AS TotalMedals,
    SUM(CASE WHEN Medal = 'Gold' THEN 1 ELSE 0 END) AS Gold,
    SUM(CASE WHEN Medal = 'Silver' THEN 1 ELSE 0 END) AS Silver,
    SUM(CASE WHEN Medal = 'Bronze' THEN 1 ELSE 0 END) AS Bronze
FROM bigdata_athlete.tab3_athlete
WHERE Medal IN ('Gold', 'Silver', 'Bronze') 
GROUP BY Sport
ORDER BY TotalMedals DESC
LIMIT 10;

-- Analyse du nombre de participants par année
SELECT
    Year,
    COUNT(DISTINCT ID) AS NombreParticipants
FROM
    bigdata_athlete.tab3_athlete
WHERE Year IS NOT NULL AND ID IS NOT NULL    
GROUP BY Year
ORDER BY Year DESC, NombreParticipants DESC;

-- Analyse du nombre de médailles remportées par année 
SELECT
    Year,
    COUNT(*) AS TotalMedals,
    SUM(CASE WHEN Medal = 'Gold' THEN 1 ELSE 0 END) AS Gold,
    SUM(CASE WHEN Medal = 'Silver' THEN 1 ELSE 0 END) AS Silver,
    SUM(CASE WHEN Medal = 'Bronze' THEN 1 ELSE 0 END) AS Bronze
FROM bigdata_athlete.tab3_athlete
WHERE Medal IN ('Gold', 'Silver', 'Bronze') 
GROUP BY Year
ORDER BY Year DESC, TotalMedals DESC;