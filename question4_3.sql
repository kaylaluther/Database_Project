SELECT primaryTitle, primaryName, deathYear FROM title_basics
JOIN name_basics ON tconst=knownForTitles
WHERE deathYear IN (SELECT deathYear FROM name_basics WHERE deathYear > 2005)
AND isAdult=1
ORDER BY deathYear;


