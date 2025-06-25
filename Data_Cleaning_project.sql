-- data cleaning

SELECT * 
FROM layoffs;

-- 1. remove duplicates of there are any.alter
-- 2. standardize the data
-- 3. deal with Null values or blank values
-- .4 remove any unneccasary columns

# makes a empty table with the same columns as layoffs staging
CREATE TABLE layoffs_staging
Like layoffs;

SELECT * 
FROM layoffs_staging ;

## import all the data over
INSERT layoffs_staging
SELECT * 
FROM layoffs;

## now we only work off the staging database
# this is important because we dont want to work off the raw data in case of mistakes
## This is good standard practice

SELECT * 
FROM layoffs_staging
;


SELECT * ,
ROW_NUMBER() OVER( 
PARTITION BY company, industry, total_laid_off, percentage_laid_off, 'date') AS row_num
FROM layoffs_staging;
## This will assign a unique row number to everything that is in the group being partitioned by,
## so in this case every row/entry with the same
## company, industry, total_laid_off, percentage_laid_off, 'date' will have more than a '1'
## in the row number
## this is good for detecting duplicate rows


## I  double added the table to the staging table
SELECT COUNT(*) AS total_rows
FROM layoffs_staging;

SELECT COUNT(*) AS total_rows
FROM layoffs;

DROP TABLE IF EXISTS layoffs_staging;

## I dropped the table and then made it again

## WITH makes a temporary table
WITH duplicate_cte as
(
SELECT * ,
ROW_NUMBER() OVER( 
PARTITION BY company, industry, total_laid_off, percentage_laid_off, `date`, country, funds_raised_millions) AS row_num
FROM layoffs_staging
)
SELECT * 
FROM duplicate_cte 
WHERE row_num > 1
;
## this finds all duplicate rows


#checking to see if it is indeed a duplicate
#always good to check the data
SELECT * 
FROM layoffs_staging
WHERE company = 'hibob'
;
## time to delete the duplicates

CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` text,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` text,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT * 
FROM layoffs_staging2;

INSERT INTO layoffs_staging2
SELECT * ,
ROW_NUMBER() OVER( 
PARTITION BY company, industry, total_laid_off, percentage_laid_off, `date`, country, funds_raised_millions) AS row_num
FROM layoffs_staging

;
## always identify what you are deleting
SELECT *
FROM layoffs_staging2
WHERE row_num > 1
;

DELETE 
FROM layoffs_staging2
WHERE row_num > 1

;
-- standardizing data

SELECT DISTINCT(company)
FROM layoffs_staging2
;

## trim removes leading or trailing spaces as a default
SELECT company, TRIM(company)
FROM layoffs_staging2
;

UPDATE layoffs_staging2
SET company = TRIM(company);
;

## making sure all industries are truly distinct
SELECT DISTINCT industry
FROM layoffs_staging2
ORDER BY 1
;


SELECT * 
FROM layoffs_staging2
WHERE industry like '%crypto%'
;

## making all crypto like industries into 'crypto'
UPDATE layoffs_staging2
SET industry = 'crypto'
WHERE industry LIKE '%crypto%'

;

SELECT DISTINCT country, TRIM(country)
FROM layoffs_staging2
ORDER BY 1;

SELECT DISTINCT country, TRIM(trailing '.' FROM country)
FROM layoffs_staging2
ORDER BY 1;
;

## trimming '.' from all united states
UPDATE layoffs_staging2
SET country = TRIM(trailing '.' FROM country)
WHERE country like "united states"

;

select `date`,
STR_TO_DATE(`date`, '%m/%d/%Y')
FROM layoffs_staging2
;

UPDATE layoffs_staging2
SET `date` =  STR_TO_DATE(`date`, '%m/%d/%Y')
;

## there is a row with 'none' preventing above from running
DELETE FROM layoffs_staging2 
where `date` = 'None' 
;

select `date`
FROM layoffs_staging2
##all good
;

## always do altering in a staging table
ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` date;
;

SELECT *
from layoffs_staging2
;


-- dealing with nulls

##dataset uses 'none' not null
SELECT * 
FROM layoffs_staging2 
WHERE total_laid_off = 'none'
;


SELECT * 
FROM layoffs_staging2
;

SELECT * 
FROM layoffs_staging2 
WHERE total_laid_off = 'none'
AND percentage_laid_off = 'none'
;

SELECT DISTINCT industry 
FROM layoffs_staging2
WHERE industry = 'none'
OR industry = ''
;
SELECT DISTINCT industry 
FROM layoffs_staging2
WHERE industry = 'none'

;

SELECT *
FROM layoffs_staging2
WHERE industry = 'none'
OR industry = ''
;

SELECT *
FROM layoffs_staging2
WHERE company  = 'AirBNB'
;

SELECT * 
FROM layoffs_staging2 as t1
JOIN layoffs_staging2 as t2 
	ON t1.company = t2.company
    and t1.location = t2.location
WHERE (t1.industry = 'none' or t1.industry = '')
and t2.industry != 'none' and t2.industry != ''
;

UPDATE layoffs_staging2 as t1
JOIN layoffs_staging as t2 
	ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE (t1.industry = 'none' or t1.industry = '')
and t2.industry != 'none' and t2.industry != ''
;

SELECT * 
FROM layoffs_staging2 
WHERE total_laid_off = 'none'
AND percentage_laid_off = 'none'
;

DELETE
FROM layoffs_staging2
WHERE total_laid_off = 'none'
AND percentage_laid_off = 'none'
;
-- getting rid of row_num column 

ALTER TABLE layoffs_staging2
DROP COLUMN row_num
;

SELECT * 
FROM  layoffs_staging2

