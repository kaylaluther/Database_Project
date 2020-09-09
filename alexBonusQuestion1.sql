SELECT n.course_id, n.title, n.dept_name, n.credits
FROM course_1 AS n
LEFT OUTER JOIN prereq_1 ON n.course_id=prereq_1.course_id
UNION ALL
SELECT n.course_id, n.title, n.dept_name, n.credits
FROM course_1 AS n
RIGHT OUTER JOIN prereq_1 ON n.course_id=prereq_1.course_id ;