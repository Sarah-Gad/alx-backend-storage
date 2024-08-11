-- This script defines a stored Procedure.
DROP PROCEDURE IF EXISTS ComputeAverageScoreForUser;
DELIMITER $$
CREATE PROCEDURE ComputeAverageScoreForUser (IN user_id INT)
BEGIN
    DECLARE sum DECIMAL(10, 2);
    DECLARE num INT;
    DECLARE aver_score DECIMAL(10, 2);
    SELECT SUM(score) INTO sum
    FROM corrections
    WHERE corrections.user_id = user_id;
    SELECT COUNT(score) INTO num
    FROM corrections
    WHERE corrections.user_id = user_id;
    IF num > 0 THEN
        SET aver_score = sum / num;
    ELSE
        SET aver_score = 0;
    END IF;
    UPDATE users
    SET users.average_score = aver_score
    WHERE users.id = user_id;
END $$
DELIMITER ;
