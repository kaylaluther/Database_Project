SELECT DISTINCT title, language, region, genres, startYear 
FROM title_akas
JOIN title_basics ON startYear>=2000 AND genres='Fantasy'
WHERE language='en' AND region='US';