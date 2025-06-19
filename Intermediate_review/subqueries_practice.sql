-- subqueries 

SELECT *
FROM parks_and_recreation.employee_demographics;

SELECT *
FROM park_and_recreation.employee_salary;

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE employee_id IN 
		(SELECT employee_id
			FROM employee_salary
            WHERE dept_id = 1)
            ;
            
# selecting people in employee demographics where the employee_id in employee_salary is equal to one
# query within a query



SELECT first_name, salary, (SELECT AVG(salary) FROM employee_salary) AS average_salary
 FROM Parks_and_Recreation.employee_salary
;

SELECT gender, AVG(age), MIN(age), max(age), COUNT(age)
FROM Parks_and_Recreation.employee_demographics
GROUP BY gender;



