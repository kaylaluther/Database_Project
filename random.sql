Delimiter //
CREATE PROCEDURE ndirector_count(IN title_crew varchar(20), OUT d_count INTEGER)
	BEGIN
	SELECT COUNT(*) INTO d_count
    FROM title_crew
    WHERE title_crew.directors=directors;
END//

Delimiter ;
CALL ndirector_count("director",@d_count);
SELECT @d_count;

SELECT title_episode.parentTconst,title_ratings.averageRating,  
GROUP_CONCAT(DISTINCT title_episode.seasonNumber ORDER BY title_episode.seasonNumber ASC SEPARATOR ', ') 
FROM title_episode, title_ratings 
WHERE title_episode.parentTconst = title_ratings.tconst 
GROUP BY title_episode.parentTconst;

SELECT DISTINCT name_basics.primaryName, title_principals.nconst, category FROM title_principals
INNER JOIN name_basics ON title_principals.nconst=name_basics.nconst
WHERE category = "director";

SELECT title_basics.tconst, primaryTitle FROM title_basics
JOIN title_crew ON title_basics.tconst = title_crew.tconst;

SELECT title_principals.tconst, title_principals.nconst FROM title_principals
JOIN title_crew ON title_principals.nconst = title_crew.directors;

SELECT primaryName, primaryProfession, nconst
FROM name_basics, title_crew
WHERE primaryProfession='director' AND name_basics.nconst=title_crew.directors;
    
SELECT directors FROM title_crew
GROUP BY directors
HAVING COUNT(*);

SELECT primaryName, directors, count(*) as Total from title_crew, name_basics 
WHERE name_basics.primaryName=title_crew.directors 
GROUP BY directors;

SELECT title_principals.nconst, count(*) as Total from title_principals
WHERE category='director'
GROUP BY title_principals.nconst
HAVING Total >10;

SELECT originalTitle, parentTconst, seasonNumber, averageRating
FROM title_basics, title_episode, title_ratings
WHERE title_episode.parentTconst = title_basics.tconst
HAVING title_episode.seasonNumber > 1
ORDER BY averageRating DESC;

SELECT parentTconst, seasonNumber, averageRating
FROM title_basics, title_episode, title_ratings
WHERE title_episode.parentTconst = title_ratings.tconst;

SELECT title_basics.originalTitle, title_episode.seasonNumber, title_episode.parentTconst
FROM title_basics, title_episode WHERE titleType = "tvSeries" AND seasonNumber = 2;

SELECT primaryTitle, title_basics.tconst, seasonNumber  FROM title_basics, title_episode
WHERE titleType='tvSeries'
HAVING seasonNumber>1
ORDER BY seasonNumber DESC;

SELECT DISTINCT title_episode.parentTconst, title_episode.seasonNumber, titleID, title FROM title_episode
JOIN title_akas ON titleID = title_episode.parentTconst WHERE title_episode.seasonNumber >1;

SELECT DISTINCT title_episode.parentTconst, title_episode.seasonNumber, titleID, title, averageRating FROM title_episode
JOIN title_akas ON titleID = title_episode.parentTconst
JOIN title_ratings ON title_ratings.tconst=title_episode.parentTconst
WHERE seasonNumber >1 AND averageRating > 9.8
ORDER BY averageRating DESC;

WITH seriesRating AS (SELECT parentTconst, AVG(averageRating)
FROM title_episode
JOIN title_ratings USING (tconst)
GROUP BY parentTconst
HAVING seasonNumber >1);

SELECT DISTINCT title_episode.parentTconst, GROUP_CONCAT(DISTINCT title_episode.seasonNumber ORDER BY title_episode.seasonNumber ASC SEPARATOR ', '),
titleID, title FROM title_episode
JOIN title_akas ON titleID = title_episode.parentTconst
JOIN title_ratings ON title_ratings.tconst=title_episode.parentTconst
JOIN ;

CREATE OR REPLACE VIEW seriesRatings AS 
	SELECT parentTconst, averageRating, title
	FROM title_episode, title_ratings, title_akas
    WHERE parentTconst=titleId;
    
SELECT * FROM seriesRatings;


SELECT DISTINCT title_principals.tconst, title_principals.nconst, primaryName 
FROM title_principals,name_basics, title_crew 
WHERE title_principals.nconst = title_crew.writers
UNION 
SELECT  title_principals.tconst, title_akas.titleId, title_akas.title FROM title_akas, title_principals
WHERE title_akas.titleId = title_principals.tconst;

SELECT DISTINCT title_principals.nconst, primaryName, title_principals.tconst, title
FROM title_principals, name_basics, title_crew 
INNER JOIN title_akas ON tconst = titleId AND types = 'original' AND isOriginalTitle=1
WHERE title_principals.nconst = title_crew.writers AND title_principals.category='writer';

select title, language from title_akas WHERE language IS NOT NULL ORDER BY language;