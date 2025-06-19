-- joins


##Inner Join
## This will be too ambiguous becuase the tables are not specified
SELECT * 
FROM parks_and_recreation.employee_demographics
INNER JOIN employee_salary
	ON employee_id = employee_id
;
    
#Inner Join that works
##use aliasing to make life easier
SELECT *
FROM parks_and_recreation.employee_demographics AS dem
INNER JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;
 
-- Outer joins


SELECT *
FROM parks_and_recreation.employee_demographics AS dem
LEFT OUTER JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id
    ##No Ron Swanson, so ron swanson from salary table will not be included
;

SELECT *
FROM parks_and_recreation.employee_demographics AS dem
RIGHT OUTER JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id
    ##No Ron Swanson, so ron swansons demographic info will now show up as null
;
#RIGHT vs LEFT basically specifies the leading table, the leading table will have EVERYTHING from that table


-- self join


SELECT * 
FROM Parks_and_Recreation.employee_salary emp1
JOIN parks_and_recreation.employee_salary emp2
	ON emp1.employee_id + 2 = emp2.employee_id
# example use of assigning some employees to others
;

SELECT emp1.first_name AS secret_santa,
emp2.first_name AS recipient
FROM Parks_and_Recreation.employee_salary emp1
JOIN parks_and_recreation.employee_salary emp2
	ON emp1.employee_id + 2 = emp2.employee_id
## secret santa list simplified
;

-- joining multiple tables together

SELECT *
FROM Parks_and_Recreation.parks_departments
;

SELECT *
FROM parks_and_recreation.employee_demographics AS dem
INNER JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id
INNER JOIN parks_departments AS pd
	ON sal.dept_id = pd.department_id



	