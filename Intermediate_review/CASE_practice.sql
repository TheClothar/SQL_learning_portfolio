-- case statements
# really just if/else statements, pretty simple stuff


SELECT first_name,
last_name,
CASE
	WHEN age <= 30 THEN 'YOUNG'
    WHEN age BETWEEN 31 and 50 then 'old'
    WHEN age > 50 then 'about to die'
END as age_bracket
FROM Parks_and_Recreation.employee_demographics;

-- Pay increase and bonus
-- < 50000 = 5%
-- > 70000 = 7%
-- finance = 10% bonus



SELECT  first_name, last_name, salary,
CASE 
	WHEN salary < 50000 THEN salary * 1.05
    WHEN salary > 70000 THEN salary * 1.07
    WHEN dept_id = 6 THEN salary * 1.1
    END as new_salary
FROM Parks_and_Recreation.employee_salary
;
SELECT * 
FROM Parks_and_Recreation.employee_salary

