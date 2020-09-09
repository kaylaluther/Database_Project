SELECT originalTitle,region,language,startYear,averageRating,numVotes
FROM title_akas,title_basics
JOIN title_ratings ON title_ratings.tconst = title_basics.tconst
WHERE averageRating > 7 AND numVotes > 1000;

SELECT tconst,originalTitle,region,language,startYear,averageRating,numVotes
FROM title_akas,title_basics
JOIN title_ratings USING (tconst)
WHERE averageRating > 7 AND numVotes > 1000 AND titleType ='movie';

/* Mine */
SELECT title,region,language,startYear,averageRating,numVotes
	FROM (title_akas JOIN title_basics ON title_akas.titleId = title_basics.tconst)
    JOIN title_ratings ON title_ratings.tconst = title_basics.tconst
	WHERE averageRating > 7 AND numVotes > 1000 AND titleType ='movie' AND ordering = 1
    ORDER BY averageRating DESC;
    
SELECT title,region,language,startYear,averageRating,numVotes
	FROM (title_akas JOIN title_basics ON title_akas.titleId = title_basics.tconst)
    JOIN title_ratings ON title_ratings.tconst = title_basics.tconst
	WHERE averageRating > 7 AND numVotes > 1000 AND titleType ='movie'
    ORDER BY averageRating DESC;

/* Joannas*/
SELECT title, region, language, year, averageRating AS rating, numVotes AS votes
FROM ( (SELECT tconst, startYear AS year FROM title_basics WHERE titleType='movie') AS movies
JOIN
(SELECT * from title_ratings WHERE averageRating > 7 AND numVotes > 1000) AS ratings
USING (tconst) )
JOIN
(SELECT titleId, title, region, language FROM title_akas WHERE ordering=1) AS title_info
ON tconst=title_info.titleId;

SELECT title, region, language, year, averageRating AS rating, numVotes AS votes
FROM ( (SELECT tconst, startYear AS year FROM title_basics WHERE titleType='movie') AS movies
JOIN
(SELECT * from title_ratings WHERE averageRating > 7 AND numVotes > 1000) AS ratings
USING (tconst) )
JOIN
(SELECT titleId, title, region, language FROM title_akas) AS title_info
ON tconst=title_info.titleId;
