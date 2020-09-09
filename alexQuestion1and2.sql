SELECT directors FROM title_crew
INNER JOIN title_basics ON COUNT(primaryTitle);

SELECT primaryTitle
FROM title_basics
INNER JOIN title_episode ON seasonNumber >1
WHERE titleType = 'tvseries' AND (SELECT averageRating FROM title_ratings ORDER BY averageRating DESC)
LIMIT 10;