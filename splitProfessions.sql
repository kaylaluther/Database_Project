SELECT
    @num_profession_lines := 1 + LENGTH(primaryProfession) - LENGTH(REPLACE(primaryProfession, ',', '')) AS num_profession_lines,
    SUBSTRING_INDEX(primaryProfession, ',', 1) AS primaryProfession1,
    IF(@num_profession_lines > 1, SUBSTRING_INDEX(SUBSTRING_INDEX(primaryProfession, ',', 2), ',', -1), '') AS primaryProfessions2,
    IF(@num_profession_lines > 2, SUBSTRING_INDEX(SUBSTRING_INDEX(primaryProfession, ',', 3), ',', -1), '') AS primaryProfessions3
FROM name_basics;