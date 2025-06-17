SELECT *
FROM Parks_and_Recreation.employee_salary
WHERE first_name = 'leslie' ;

SELECT *
FROM Parks_and_Recreation.employee_salary
WHERE salary >= 50000;

SELECT *
FROM Parks_and_Recreation.employee_demographics
WHERE gender != 'Female';

SELECT *
FROM Parks_and_Recreation.employee_demographics
WHERE gender != 'Female'
AND NOT age > 44;


# some PEMDAS examples in SQL
SELECT *
FROM Parks_and_Recreation.employee_demographics
WHERE (age > 39 AND gender = 'Male') OR last_name = 'Wyatt'
;


-- LIKE Statement
-- % and _

## name contains an a
SELECT *
FROM Parks_and_Recreation.employee_demographics
WHERE first_name LIKE '%a%'
;


#name starting with a and two letters after it
SELECT *
FROM Parks_and_Recreation.employee_demographics
WHERE first_name LIKE 'a__'




