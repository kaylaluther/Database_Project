SELECT * FROM title_episode 
RIGHT JOIN title_crew
ON title_episode.tconst = title_crew.tconst;

SELECT * FROM title_episode
WHERE episodeNumber <= 5 
ORDER BY tconst DESC;

SELECT title, category
FROM title_akas
RIGHT JOIN title_principals
ON title_akas.titleId = title_principals.nconst;