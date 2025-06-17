-- having vs where

## this wont work because group BY hasnt been created yet so it cant use WHERE for aggregated functions
SELECT gender, AVG(age)
FROM Parks_and_Recreation.employee_demographics
WHERE AVG(age) > 40
GROUP BY gender
;

## Having is used when using Group BY and WHERE for aggregated funcitons

SELECT gender, AVG(age)
FROM Parks_and_Recreation.employee_demographics
GROUP BY gender
HAVING  AVG(age) > 40
;
  ## this works because WHERE is not using aggreagated function
SELECT occupation, AVG(salary)
FROM parks_and_recreation.employee_salary
WHERE occupation LIKE '%manager%'
GROUP BY occupation
;

## The combo of the two
SELECT occupation, AVG(salary)
FROM parks_and_recreation.employee_salary
WHERE occupation LIKE '%manager%'
GROUP BY occupation
HAVING AVG(salary) > 75000



