SELECT
    @num_director_lines := 1 + LENGTH(directors) - LENGTH(REPLACE(directors, ',', '')) AS num_director_lines,
    SUBSTRING_INDEX(directors, ',', 1) AS directors1,
    IF(@num_director_lines > 1, SUBSTRING_INDEX(SUBSTRING_INDEX(directors, ',', 2), ',', -1), '') AS directors2,
    IF(@num_director_lines > 2, SUBSTRING_INDEX(SUBSTRING_INDEX(directors, ',', 3), ',', -1), '') AS directors3
FROM title_crew;