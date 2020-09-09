Delimiter //
CREATE TRIGGER format_year BEFORE UPDATE ON teaches
	FOR EACH ROW
    BEGIN	
		IF NEW.year = NULL THEN
			SET NEW.year = 2019;
		END IF;
	END;
	//
Delimiter ;

SELECT * FROM teaches;

INSERT INTO teaches VALUES (76777, 'CS-101', 1, 'Summer', null);

SELECT * FROM teaches;

