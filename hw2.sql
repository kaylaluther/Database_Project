Delimiter //

CREATE FUNCTION total_credits(credits decimal(2,0))
	RETURNS INTEGER
    BEGIN
    DECLARE total INTEGER;
		SELECT SUM(credits) INTO total
        FROM course
        WHERE course.course_id=course_id;
	RETURN total;
END//

SELECT total_credits("CS-347")//

SELECT course_id, credits
FROM course
WHERE total_credits(credits) > 2//

Delimiter ;

SELECT name, ID, SUM(credits) AS "Total_credits" FROM course
JOIN teaches ON course.course_id = teaches.course_id
JOIN instructor USING(ID)
WHERE ID='12121' AND year >2000;