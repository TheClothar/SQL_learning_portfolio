SELECT * 
FROM injuries_2010_2020
;

CREATE TABLE injuriesTo2020
LIKE injuries_2010_2020
;
INSERT injuriesTo2020
SELECT *
FROM injuries_2010_2020

;


SELECT *
FROM injuriesTo2020
;

SELECT * 
FROM injuriesTo2020
WHERE LOWER(Notes) LIKE "%achilles%"

;
SELECT *
FROM injuriesTo2020
WHERE LOWER(Notes) LIKE '%achilles%'
  AND (LOWER(Notes) LIKE '%torn%' OR LOWER(Notes) LIKE '%rupture%');
;

UPDATE injuriesTo2020
SET Notes = "torn_achilles"
WHERE
 LOWER(Notes) LIKE '%achilles%'
  AND (LOWER(Notes) LIKE '%torn%'OR LOWER(Notes) LIKE "'%turn%" OR LOWER(Notes) LIKE '%rupture%')
;

SELECT relinquished, Notes
FROM injuriesTo2020
WHERE Notes LIKE "%achilles%"
GROUP BY relinquished, Notes

;

SELECT DISTINCT relinquished, Notes
FROM injuriesTo2020
WHERE Lower(Notes) = "torn_achilles"
;
## there were 24 achilles tears in this time period
## this is a good start


;
SELECT Notes, relinquished
FROM injuriesTo2020



;


SELECT * 
FROM injury_2021_2024
;

CREATE TABLE injuriesTo2024
LIKE injury_2021_2024
;

INSERT injuriesTo2024
SELECT * 
FROM injury_2021_2024

;
SELECT * 
FROM injuriesTo2024
;

UPDATE injuriesTo2024
SET REASON = LOWER(REASON)
;

SELECT PLAYER, REASON
FROM injuriesTo2024
WHERE REASON LIKE "%acl%"
GROUP BY PLAYER, REASON

;

SELECT PLAYER, REASON
FROM injuriesTo2024
WHERE REASON LIKE "%achille%"
GROUP BY PLAYER, REASON

