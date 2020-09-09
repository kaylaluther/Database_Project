WITH RECURSIVE cte_count(n)
AS (
	SELECT 1 
    UNION ALL
    SELECT n + 1
    FROM cte_count
	WHERE n < 3
)
SELECT n
FROM cte_count;

WITH RECURSIVE rec_prereq(course_id,prereq_id)
AS (
	SELECT course_id, prereq_id
    FROM prereq_1
    UNION 
    SELECT rec_prereq.course_id, prereq_1.prereq_id
    FROM rec_prereq, prereq_1
	WHERE rec_prereq.prereq_id=prereq_1.course_id
)
SELECT *
FROM rec_prereq;

CREATE TABLE student_grades(
	ID int , 
    GPA numeric (4,2),
    PRIMARY KEY(ID));
    
INSERT INTO student_grades VALUES(1,3.5), (2,2.5), (15,3.9), (22,3.7);

SELECT * FROM student_grades;
    
SELECT ID, GPA, RANK() OVER(ORDER BY GPA DESC) AS s_rank
FROM student_grades;

SELECT ID, GPA, RANK() OVER(ORDER BY GPA DESC) AS s_rank
FROM student_grades
ORDER BY s_rank;

SELECT ID, GPA, RANK() OVER(ORDER BY GPA ASC) AS s_rank
FROM student_grades
ORDER BY s_rank;

SELECT ID, GPA, NTILE(4) OVER(ORDER BY GPA DESC) AS quartile 
FROM student_grades;

