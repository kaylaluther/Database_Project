SELECT DISTINCT title_principals.nconst, primaryName, title_principals.tconst, 
GROUP_CONCAT(DISTINCT title_basics.originalTitle ORDER BY title_basics.originalTitle ASC SEPARATOR ', ')
FROM title_principals, name_basics, title_crew, title_basics
JOIN title_akas ON tconst = titleId AND types = 'original' AND region='US' 
JOIN title_episode ON seasonNumber = 1 AND episodeNumber=1
WHERE title_principals.nconst = title_crew.writers AND title_principals.category='writer';

SELECT DISTINCT name_basics.nconst, primaryName, title_principals.tconst, originalTitle
FROM title_principals, name_basics, title_crew, title_basics
JOIN title_akas ON tconst = titleId AND types = 'original' AND region='US'
JOIN title_episode ON seasonNumber = 1 AND episodeNumber=1
WHERE title_principals.nconst = title_crew.writers AND title_principals.category='writer';

SELECT DISTINCT 
GROUP_CONCAT(DISTINCT primaryName ORDER BY primaryName ASC SEPARATOR ', '), title_principals.tconst
FROM title_principals, name_basics, title_crew, title_basics
JOIN title_akas ON tconst = titleId AND types = 'original' AND region='US' 
JOIN title_episode ON seasonNumber = 1
WHERE title_principals.nconst = title_crew.writers AND title_principals.category='writer';

SELECT DISTINCT name_basics.nconst, primaryName, title_principals.tconst, originalTitle
FROM title_principals, name_basics, title_crew, title_basics
WHERE title_principals.nconst = title_crew.writers AND title_principals.category='writer';