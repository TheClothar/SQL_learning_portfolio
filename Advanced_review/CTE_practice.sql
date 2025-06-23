-- CTE

WITH CTE_Example AS
(
SELECT gender, AVG(salary), MAX(salary), MIN(salary), COUNT(salary)
FROM employee_demographics as dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT *
FROM CTE_Example
;

## much cleaner than a subquery
WITH CTE_Example AS
(
SELECT gender, AVG(salary) as avg_sal , MAX(salary) as max_sal,
	MIN(salary) as min_sal, COUNT(salary) as count_sal
FROM employee_demographics as dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT AVG(avg_sal)
FROM CTE_Example

;
##cannot use CTE after ';'

WITH CTE_Example AS
(
SELECT employee_id, gender , birth_date
FROM employee_demographics 
WHERE birth_date > '1985-01-01'
),
CTE_example2 AS
(
SELECT employee_id, salary
FROM Parks_and_Recreation.employee_salary
WHERE salary > 50000
)
SELECT *
FROM CTE_Example
JOIN CTE_example2
	ON CTE_Example.employee_id = CTE_example2.employee_id




