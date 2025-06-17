-- limit and aliasing

#limits to only 3 rows
SELECT * 
FROM Parks_and_Recreation.employee_demographics
LIMIT 3
;

## can be powerful when combined with order by
## here we have the three oldest employees
SELECT * 
FROM Parks_and_Recreation.employee_demographics
ORDER BY age DESC
LIMIT 3
;

# start at postion 2 and then take next two rows
SELECT * 
FROM Parks_and_Recreation.employee_demographics
ORDER BY age DESC
LIMIT 2, 2
;

-- aliasing
## changing name of column

SELECT gender, AVG(age) as avg_age
FROM Parks_and_Recreation.employee_demographics
GROUP BY GENDER
HAVING avg_age > 40




