-- stored procedures

CREATE procedure large_salaries()
SELECT *
FROM employee_salary
WHERE salary > 50000
;

call large_salaries();


DELIMITER //
CREATE PROCEDURE Large_salaries3()
BEGIN
	SELECT *
	FROM employee_salary
	WHERE salary > 50000;
	SELECT *
	FROM employee_salary
	WHERE salary >= 10000;
END //

DELIMITER ;

CALL large_salaries3