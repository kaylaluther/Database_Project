SELECT DISTINCT primaryName, primaryProfession, nconst, directors, count(*) as Total
	FROM name_basics, title_crew
	WHERE name_basics.primaryName=title_crew.directors
    GROUP BY directors;
    
SELECT primaryName, directors, count(*) as Total from title_crew, name_basics 
    WHERE name_basics.primaryName=title_crew.directors 
    GROUP BY directors;

SELECT DISTINCT primaryName, primaryProfession, nconst
	FROM name_basics
	WHERE primaryProfession="director";
    
SELECT nconst, primaryName, knownForTitles, primaryTitle FROM name_basics, title_basics 
	WHERE name_basics.knownForTitles=title_basics.primaryTitle;
    
SELECT primaryName, knownForTitles, primaryProfession
FROM  name_basics 
JOIN title_crew 
  ON name_basics.knownForTitles=title_crew.tconst
  WHERE primaryProfession="director" AND (SELECT COUNT(directors) FROM title_crew WHERE name_basics.nconst=title_crew.directors) >= 10;
    