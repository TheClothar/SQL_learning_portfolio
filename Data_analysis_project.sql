-- exploratory Data analysis

SELECT * 
FROM layoffs_staging2;

### the reason this is not working is because those feild types are text, 
### I have to turn them into int and 
SELECT MAX(total_laid_off), MAX(percentage_laid_off)
FROM layoffs_staging2
;
SELECT COUNT(*)
FROM layoffs_staging2;

SELECT total_laid_off, percentage_laid_off 
FROM layoffs_staging2 LIMIT 5;

DESCRIBE layoffs_staging2;

## have to change the Nones to NULL to alter the table type accordingly
UPDATE layoffs_staging2
SET total_laid_off = NULL
WHERE total_laid_off = 'None';

UPDATE layoffs_staging2
SET percentage_laid_off = NULL
WHERE percentage_laid_off = 'None'
;

## altering the table before I can convert the numbers to int and decimals
ALTER TABLE layoffs_staging2
MODIFY total_laid_off INT;

ALTER TABLE layoffs_staging2
MODIFY percentage_laid_off DECIMAL(5,2);

SELECT percentage_laid_off
FROM layoffs_staging2
WHERE percentage_laid_off NOT REGEXP '^[0-9]+(\.[0-9]+)?$';

DESCRIBE layoffs_staging2;
### ok we goof now.


## this now works, lets keep exploring.
SELECT MAX(total_laid_off), MAX(percentage_laid_off)
FROM layoffs_staging2
;

SELECT * 
FROM layoffs_staging2
WHERE percentage_laid_off = 1 
ORDER BY funds_raised_millions desc;

## i have to change the funds_raised_millions into int to get correct DESC


UPDATE layoffs_staging2
SET funds_raised_millions = NULL
WHERE TRIM(LOWER(funds_raised_millions)) = 'none'
;

SELECT DISTINCT percentage_laid_off
FROM layoffs_staging2
WHERE percentage_laid_off NOT REGEXP '^[0-9]+(\.[0-9]+)?$';

DESCRIBE layoffs_staging2
;

ALTER TABLE layoffs_staging2
MODIFY funds_raised_millions INT;

SELECT funds_raised_millions
FROM layoffs_staging2
;

SELECT * 
FROM layoffs_staging2
WHERE percentage_laid_off = 1 
ORDER BY funds_raised_millions desc
;

SELECT company, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 desc
;

SELECT MIN(`date`), MAX(`date`)
FROM layoffs_staging
;

SELECT industry, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY industry
ORDER BY 2 desc
;


### need to use sum here because each country has alot of different entries
SELECT country, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY country
ORDER BY 2 desc
;

SELECT stage, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY stage
ORDER BY 2 desc
;

## rollign total layoffs

## not very effective like this with random month
SELECT SUBSTRING(`date`,6,2) AS `MONTH`, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY `MONTH`
;

SELECT SUBSTRING(`date`,1,7) AS `MONTH`, SUM(total_laid_off)
FROM layoffs_staging2
WHERE SUBSTRING(`DATE`, 1, 7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 DESC
;


SELECT * 
FROM layoffs_staging2
;

WITH rolling_total as
(
SELECT SUBSTRING(`date`,1,7) AS `MONTH`, SUM(total_laid_off) as sum_total_off
FROM layoffs_staging2
WHERE SUBSTRING(`DATE`, 1, 7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 DESC
)
SELECT `MONTH`,sum_total_off,
SUM(sum_total_off) OVER(ORDER BY `MONTH`) AS rollign_total
FROM rolling_total
;

SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, `date`
ORDER BY company ASC
;

SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, YEAR(`date`)
ORDER BY 3 ASC
;

## want to see who laid off the most people per year

WITH company_year (company,years, total_laid_off) AS
(
SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, YEAR(`date`)

)
SELECT *, DENSE_RANK() OVER (PARTITION BY years ORDER BY total_laid_off DESC) AS Ranking
FROM company_year
WHERE years IS NOT NULL
ORDER BY Ranking asc
;

## just want the top five companies per year
WITH company_year (company,years, total_laid_off) AS
(
SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, YEAR(`date`)

), Company_year_rank AS
(
SELECT *, DENSE_RANK() OVER (PARTITION BY years ORDER BY total_laid_off DESC) AS Ranking
FROM company_year
WHERE years IS NOT NULL
)
SELECT * 
FROM company_year_rank
WHERE ranking <= 5
;
