(SELECT a.course_id,a.title,a.dept_name,a.credits, b.prereq_id
FROM course_1 a
LEFT JOIN prereq_1 b
ON a.course_id = b.course_id)
UNION 
(SELECT b.course_id,a.title,a.dept_name,a.credits, b.prereq_id
FROM course_1 a
right JOIN prereq_1 b
ON a.course_id = b.course_id)
;

