SELECT department.dept_name, result1.total_amt, department.budget, (department.budget - result1.total_amt) AS remaining_budget
FROM department,  
( SELECT instructor.dept_name, SUM(instructor.salary) total_amt  
FROM instructor 
GROUP BY dept_name) result1 
WHERE result1.dept_name = department.dept_name;

SELECT department.dept_name, result1.total_amt, department.budget, 
(department.budget - result1.total_amt) expected_salary
FROM department,
( SELECT instructor.dept_name, AVG(instructor.salary) total_amt  
FROM instructor 
GROUP BY dept_name) result1
WHERE result1.dept_name = department.dept_name;

DELIMITER //
CREATE PROCEDURE expectedSalary()
BEGIN
	SELECT department.dept_name, department.budget, AVG(instructor.salary),
		IF(AVG(instructor.salary) < department.budget, 1, 0) AS isHireable
    FROM department 
        INNER JOIN instructor USING(dept_name)
	GROUP BY department.dept_name;
END // 
DELIMITER ;
CALL expectedSalary();

