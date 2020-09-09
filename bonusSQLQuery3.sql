SELECT primaryTitle, isAdult, primaryName, deathYear FROM title_basics
JOIN name_basics ON tconst=knownForTitles
WHERE deathYear IN (SELECT deathYear FROM name_basics WHERE deathYear > 2005)
AND isAdult=1
ORDER BY deathYear;

SELECT title_episode.parentTconst,title_ratings.averageRating,  
GROUP_CONCAT(DISTINCT title_episode.seasonNumber ORDER BY title_episode.seasonNumber ASC SEPARATOR ', ') 
FROM title_episode, title_ratings 
WHERE title_episode.parentTconst = title_ratings.tconst 
GROUP BY title_episode.parentTconst;

