-- unions
## merges columns together

## this is non sensical(bad data) because columns should not have things of different types
SELECT age, gender
FROM Parks_and_Recreation.employee_demographics
UNION DISTINCT
SELECT first_name, last_name
FROM employee_salary
;

## columns should be of the same type like so
## distict makes it so that rows are not repeated ( also default)
SELECT first_name, last_name
FROM Parks_and_Recreation.employee_demographics
UNION DISTINCT
SELECT first_name, last_name
FROM employee_salary
;

## All allows all rows regardless of if they are repeats
SELECT first_name, last_name
FROM Parks_and_Recreation.employee_demographics
UNION ALL
SELECT first_name, last_name
FROM employee_salary
;


# create a list of favorable employees to fire based on their pay and age.
SELECT first_name, last_name, 'old man' AS label
FROM parks_and_recreation.employee_demographics
WHERE age > 40 AND gender = 'Male'
UNION
SELECT first_name, last_name, 'old lady' AS label
FROM parks_and_recreation.employee_demographics
WHERE age > 40 AND gender = 'Female'
UNION
SELECT first_name, last_name, 'highly paid' AS label
FROM parks_and_recreation.employee_salary
WHERE salary > 60000
ORDER BY first_name, last_name 



