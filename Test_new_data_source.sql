## Testing a new and more extensive data source as to see whether its accurate,
## because I suspect it is not.

SELECT * 
FROM injury1953
WHERE date LIKE "20%"
;

SELECT *
FROM injuriesTo2020
WHERE date like "2020-07%"
;


CREATE TEMPORARY TABLE temp_injury2010 AS
SELECT *
FROM injury1953
WHERE `date` BETWEEN '2010-10-03' AND '2020-07-31'

;
SELECT COUNT(date)
FROM temp_injury2010
;
SELECT * 
FROM temp_injury2010
WHERE Notes LIKE "%achilles%"
;

SELECT COUNT(notes)
FROM injuriesTo2020
WHERE LOWER(notes) LIKE "%achilles%"
## 263
;

SELECT COUNT(notes)
FROM temp_injury2010
WHERE LOWER(notes) LIKE "%achille%"
## 39


### result this data is trash and not nearly as accurate


