/* Mine */
SELECT DISTINCT title_episode.parentTconst, GROUP_CONCAT(DISTINCT title_episode.seasonNumber ORDER BY title_episode.seasonNumber ASC SEPARATOR ', '),
titleID, title, averageRating FROM title_episode
JOIN title_akas ON titleID = title_episode.parentTconst
JOIN title_ratings ON title_ratings.tconst=title_episode.parentTconst
HAVING SUM(DISTINCT seasonNumber) >1 
ORDER BY averageRating DESC
LIMIT 10;
/*Kayla*/
SELECT tconst, primaryTitle, rating FROM title_basics 
JOIN (SELECT parentTconst, AVG(averageRating) AS Rating FROM title_episode
JOIN title_ratings USING (tconst)
GROUP BY parentTconst
HAVING SUM(seasonNumber >1 )) AS series_ratings
ON title_basics.tconst=series_ratings.parentTconst
ORDER BY rating DESC LIMIT 10;

/* Joannas  */
SELECT tconst, primaryTitle, rating FROM
title_basics JOIN
(SELECT parentTconst, AVG(averageRating) AS rating FROM title_episode JOIN title_ratings USING(tconst)
GROUP BY parentTconst
HAVING SUM( DISTINCT seasonNumber) > 1) AS series_ratings
ON title_basics.tconst=series_ratings.parentTconst
ORDER BY rating DESC LIMIT 10;







