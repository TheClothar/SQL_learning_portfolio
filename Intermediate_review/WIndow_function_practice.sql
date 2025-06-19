-- window function

SELECT gender, AVG(salary) as avg_salary
FROM employee_demographics as dem
JOIN employee_salary as sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender;

## group by really rolls everything up into one roll.

SELECT gender, AVG(salary) OVER()
FROM employee_demographics as dem
JOIN employee_salary as sal
	ON dem.employee_id = sal.employee_id
;## average for both genders

SELECT gender, AVG(salary) OVER( PARTITION BY gender)
FROM employee_demographics as dem
JOIN employee_salary as sal
	ON dem.employee_id = sal.employee_id
;
## average for each gender


SELECT dem.first_name, dem.last_name, gender, AVG(salary) OVER( PARTITION BY gender)
FROM employee_demographics as dem
JOIN employee_salary as sal
	ON dem.employee_id = sal.employee_id
;


SELECT dem.first_name, dem.last_name, gender, SUM(salary) OVER( PARTITION BY gender)
FROM employee_demographics as dem
JOIN employee_salary as sal
	ON dem.employee_id = sal.employee_id
;


#rolling totals with gender
SELECT dem.first_name, dem.last_name, gender, salary,
 SUM(salary) OVER( PARTITION BY gender  ORDER BY dem.employee_id) as Rolling_total
FROM employee_demographics as dem
JOIN employee_salary as sal
	ON dem.employee_id = sal.employee_id
;

SELECT dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER()
FROM employee_demographics as dem
JOIN employee_salary as sal
	ON dem.employee_id = sal.employee_id
;

SELECT dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER( PARTITION BY gender ORDER BY salary DESC) AS row_num,
RANK() OVER (PARTITION BY gender ORDER BY salary DESC) AS rank_num
FROM employee_demographics as dem
JOIN employee_salary as sal
	ON dem.employee_id = sal.employee_id
;

