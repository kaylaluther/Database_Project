Delimiter //

CREATE FUNCTION dept_count(dept_name varchar(20))
	RETURNS INTEGER
    BEGIN
    DECLARE d_count INTEGER;
		SELECT COUNT(*) INTO d_count
        FROM instructor
        WHERE instructor.dept_name=dept_name;
	RETURN d_count;
END//

SELECT dept_count("Physics")//

SELECT dept_name, budget
FROM department
WHERE dept_count(dept_name) > 2//

Delimiter ;
