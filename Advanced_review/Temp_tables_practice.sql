-- temporary tables

CREATE TEMPORARY TABLE temp_table
(first_name varchar(50),
last_name varchar(50),
favorite_movie varchar(100)
);

SELECT * 
FROM temp_tables;

INSERT INTO temp_table
values('Alex', 'Freberg', 'Lord of RIngs');

SELECT *
FROM temp_table


SELECT * 
FROM employee_salary;

CREATE TEMPORARY TABLE salary_over_50k
SELECT *
FROM employee_salary
WHERE salary >= 50000;

SELECT *
FROM salary_over_50k


## temp tables only work within this section
## use temp tables for more complex queries
## use CTE for when doing one level of advanced thing on a table
