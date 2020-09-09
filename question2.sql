SELECT title_principals.nconst, primaryName, count(*) as Total from title_principals, name_basics
WHERE title_principals.category='director' AND title_principals.nconst = name_basics.nconst
GROUP BY title_principals.nconst
HAVING Total >10;

SELECT nconst, primaryName, count(*) as Total 
FROM (SELECT tconst FROM title_basics WHERE titleType='movie') AS Titles
JOIN (SELECT tconst, nconst FROM title_principals WHERE title_principals.category='director' ) AS Directors
USING (tconst)
JOIN name_basics USING (nconst)
GROUP BY Directors.nconst
HAVING Total >10;