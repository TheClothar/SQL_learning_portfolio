-- triggers and events

## trigger is a block of code that executes automatically when an event takes place on a specific table


DELIMITER $$
DROP TRIGGER if EXISTS employee_insert;

CREATE TRIGGER employee_insert
	AFTER INSERT ON employee_salary
    FOR EACH ROW
BEGIN
	INSERT INTO Parks_and_Recreation.employee_demographics (employee_id, first_name, last_name)
    VALUES ( NEW.employee_id, NEW.first_name, NEW.last_name);
END $$
DELIMITER ;

INSERT INTO employee_salary (employee_id, first_name, last_name,
 occupation, salary, dept_id)
VALUES(13, 'jean', 'silverman', 'ceo', 1000000, NULL)
;

SELECT *
FROM Parks_and_Recreation.employee_salary


;

-- EVENTS
##triggers a block of code when a event



SELECT * 
FROM employee_demographics;

DELIMITER $$
CREATE EVENT delete_retirees3
ON SCHEDULE EVERY 30 SECOND
DO
BEGIN
	DELETE
    FROM emloyee_demographics
    WHERE age >= 60;

END $$

Delimiter ;

SHOW VARIABLES LIKE 'EVENT%'

