-- string functions

SELECT length('oblivions');


# ordering names by their length
SELECT first_name, LENGTH(first_name) As name_length
FROM Parks_and_Recreation.employee_demographics
ORDER BY name_length
;

# use case: making sure every phone number given has a length of 10 digits

SELECT UPPER('sky')
;
SELECT LOWER('SkY');


SELECT TRIM('             skype.  ');


SELECT first_name, LEFT(first_name, 4), 
RIGHT(first_name, 4),
SUBSTRING(first_name,3,2),
birth_date,
SUBSTRING(birth_date,6,2) AS Birth_month
FROM parks_and_recreation.employee_demographics
;
## substring is quite helpful

SELECT LOCATE('x', 'Alexander');

SELECT first_name, LOCATE("s", first_name)
FROM Parks_and_Recreation.employee_demographics
;

SELECT first_name, last_name,
CONCAT(first_name, ' ', last_name)
FROM Parks_and_Recreation.employee_demographics

