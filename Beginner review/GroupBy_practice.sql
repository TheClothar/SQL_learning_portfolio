-- Group by

SELECT gender
FROM Parks_and_Recreation.employee_demographics
GROUP BY gender
;

SELECT gender, AVG(age)
FROM Parks_and_Recreation.employee_demographics
GROUP BY gender
;

##SELECT always comes before the column that is going to be retrieved
## SELECT argument has to match group by argument if not using an aggregate fucntion

SELECT occupation
FROM Parks_and_Recreation.employee_salary
GROUP BY occupation
;

### add new columns that are aggregate functions, still grouped by gender
SELECT gender, AVG(age), MIN(age), MAX(age), COUNT(age)
FROM Parks_and_Recreation.employee_demographics
GROUP BY gender
;
 
 
 -- Order by
 
 # rank of Order BY makes a difference
 # gender sorted first
SELECT *
FROM Parks_and_Recreation.employee_demographics
ORDER BY gender, age
;

# age sorted first
SELECT *
FROM Parks_and_Recreation.employee_demographics
ORDER BY age, gender










