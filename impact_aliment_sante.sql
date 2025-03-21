-- FICHIER SQL DE L`ANALYSE POUR L`IMPACT DE LA NUTRITION SUR LA SANTE


SELECT *
FROM my-data-project-63717.projets_sante.impact_nutrition_sante
LIMIT 10;


-- REQUETE DE SELECT POUR: OBETENIR LES ALIMENTS AVEC LEUR CONTENU NUTRITIONNEL POUR UNE DATE


SELECT Food_Item, `Protein ` , `Carbohydrates ` , `Fat `, `Cholesterol `, Date
FROM my-data-project-63717.projets_sante.impact_nutrition_sante;


SELECT `Protein ` FROM `my-data-project-63717.projets_sante.impact_nutrition_sante` LIMIT 1000;


--CAST(... AS STRING) : JE TRANSFORME LES COLONNES NUMERIQUES COMME PROTEIN , CARBOHYDRATES FAT ET CHORESTEROL EN TYPE STRING CAR JE SOUHAITES SUPRIMMER LES ESPACES.




CREATE OR REPLACE TABLE `my-data-project-63717.projets_sante.impact_nutrition_sante_clean` AS
SELECT
`Food_Item`,
CAST(`User_ID` AS STRING) AS `User_ID`,
CAST(`Protein ` AS STRING) AS `Protein`,
CAST(`Category` AS STRING) AS `Category`,
CAST(`Calories ` AS STRING) AS `Calories`,
CAST(`Carbohydrates ` AS STRING) AS `rbohydrates`,
CAST(`Fat ` AS STRING) AS `Fat`,
CAST(`Cholesterol ` AS STRING) AS `Cholesterol`,
CAST(`Fiber ` AS STRING) AS `Fiber`,
CAST(`Sugars ` AS STRING) AS `Sugars`,
CAST(`Sodium ` AS STRING) AS `Sodium`,
CAST(`Meal_Type` AS STRING) AS `Meal_Type`,
`Date`
FROM `my-data-project-63717.projets_sante.impact_nutrition_sante`;






-- REQUETE SELECT AVEC LA NOUVELLE TABLE POUR VOIR LES MODIFICATION QUE JAI EFFECUER POUR EFFACER LES SPACE INVISIBLES.




SELECT Food_Item, Protein, Carbohydrates, Fat, Cholesterol, Date
FROM my-data-project-63717.projets_sante.impact_nutrition_sante_clean;






/*CAST(... AS FLOAT64) : CETTE COMANDE ES UTILISEE POUR CONVERTIR LES COLONNES DE TYPE STING QUI ON ETAIS MODIFIER PAR LA COMMANDE PRECEDENTE
EN TYPE NUMERIQUE
*/




CREATE OR REPLACE TABLE `my-data-project-63717.projets_sante.impact_nutrition_sante_final` AS
SELECT
CAST(`User_ID` AS STRING) AS `User_ID`,
`Food_Item`,
CAST(`Protein ` AS FLOAT64) AS `Protein`,
CAST(`Carbohydrates ` AS FLOAT64) AS `rbohydrates`,
CAST(`Fat ` AS FLOAT64) AS `Fat`,
CAST(`Cholesterol ` AS FLOAT64) AS `Cholesterol`,
CAST(`Fiber ` AS FLOAT64) AS `Fiber`,
CAST(`Sugars ` AS FLOAT64) AS `Sugars`,
CAST(`Meal_Type` AS STRING) AS `Meal_Type`,
CAST(`Calories ` AS INT64) AS `Calories`,
`Date`
FROM `my-data-project-63717.projets_sante.impact_nutrition_sante`;




--REQUETE SELECT POUR VERIFIER LA CONVERSION DES COLONNES DE CARACTERES STRING EN NUMERIQUE


SELECT *
FROM `my-data-project-63717.projets_sante.impact_nutrition_sante_final`
LIMIT 10;




/*Sélection d'aliments pour une date donnée : Permet de récupérer les aliments et leurs informations nutritionnelles pour une date spécifique.*/


SELECT User_ID, Food_Item , Protein , rbohydrates , Cholesterol , Fat,date
FROM `my-data-project-63717.projets_sante.impact_nutrition_sante_final`
WHERE Date =DATE('2024-12-24');


-- Calcul de la moyenne des calories : Calcule la moyenne des calories consommées sur un jour donné.(329.26923076923)


SELECT AVG(Calories) AS moyenne_glucides
FROM `my-data-project-63717.projets_sante.impact_nutrition_sante_final`
WHERE Date = DATE('2024-12-24');




--REQUETES POUR TROUVER L ALIMENT AVEC LE PLUS DE GLUCIDES .


SELECT Food_Item , rbohydrates
FROM `my-data-project-63717.projets_sante.impact_nutrition_sante_final`
ORDER BY rbohydrates DESC
LIMIT 1;




--REQUETES POUR LE TOP 5 DES ALIMENT LE PLUS RICHE EN PROTEINES : AFFICHE LES 5 ALIMENTS LES PLUS RICHES EN PROTEINES .


SELECT Food_Item , Protein
FROM my-data-project-63717.projets_sante.impact_nutrition_sante_final
ORDER BY Protein DESC
LIMIT 5 ;




/*
Description de la mise à jour des données (UPDATE SQL)
Dans ce projet, nous avons détecté des anomalies dans la colonne Protein de notre table impact_nutrition_sante. Certaines valeurs étaient irréalistes, notamment :
Water (Eau) affichait 50g de protéines, ce qui est impossible.
Chips contenait 50g de protéines, alors que ce type d'aliment contient généralement entre 5g et 10g.
Broccoli était répertorié avec 50g de protéines, alors que sa vraie valeur est environ 2-4g.
Pour corriger ces erreurs, nous avons exécuté les requêtes suivantes :
*/
UPDATE `my-data-project-63717.projets_sante.impact_nutrition_sante_final`
SET Protein = 0.0
WHERE Food_Item = Water;


UPDATE` my-data-project-63717.projets_sante.impact_nutrition_sante_final`
SET Protein = 7.0
WHERE Food_Item = 'Chips';


UPDATE `my-data-project-63717.projets_sante.impact_nutrition_sante_final`
SET Protein = 3.0
WHERE Food_Item = 'Broccoli';


--Requête pour obtenir les aliments consommés sur une période spécifique


SELECT Food_Item, SUM(Calories) AS Calories_totales
FROM my-data-project-63717.projets_sante.impact_nutrition_sante_final
WHERE Date BETWEEN '2024-01-24' AND '2024-12-31'
GROUP BY Food_Item
ORDER BY calories_totales DESC;