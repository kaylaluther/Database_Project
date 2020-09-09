SELECT nconst, 
    @num_knownForTitles_lines := 1 + LENGTH(knownForTitles) - LENGTH(REPLACE(knownForTitles, ',', '')) AS num_profession_lines,
    SUBSTRING_INDEX(knownForTitles, ',', 1) AS knownForTitles1,
    IF(@num_knownForTitles_lines > 1, SUBSTRING_INDEX(SUBSTRING_INDEX(knownForTitles, ',', 2), ',', -1), '') AS knownForTitles2,
    IF(@num_knownForTitles_lines > 2, SUBSTRING_INDEX(SUBSTRING_INDEX(knownForTitles, ',', 3), ',', -1), '') AS knownForTitles3,
    IF(@num_knownForTitles_lines > 3, SUBSTRING_INDEX(SUBSTRING_INDEX(knownForTitles, ',', 4), ',', -1), '') AS knownForTitles4
FROM name_basics;
