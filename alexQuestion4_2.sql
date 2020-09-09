(SELECT title_basics.primaryTitle, title_crew.directors 
FROM title_basics 
INNER JOIN title_crew ON title_basics.titleType='movie')
UNION
(SELECT title_basics.primaryTitle, title_crew.directors
FROM title_basics 
INNER JOIN title_crew ON title_crew.directors > 1);

