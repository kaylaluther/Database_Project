SELECT DISTINCT name, salary FROM instructor
WHERE (SELECT MAX(salary) FROM instructor) AND dept_name = "Physics";

SELECT name, MAX(salary) FROM instructor
WHERE dept_name = "Physics"
GROUP BY name
ORDER BY name
LIMIT 1;


