SELECT primaryName, knownForTitles, title FROM name_basics, title_akas
WHERE titleId=knownForTitles;
