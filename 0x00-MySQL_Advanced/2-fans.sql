-- This script ranks counties
DROP FUNCTION IF EXISTS searching_and_suming;
DELIMITER $$
CREATE FUNCTION searching_and_suming(origin_c varchar(255))
RETURNS INT
BEGIN
    DECLARE result INT;
    SELECT SUM(fans) INTO result
    FROM metal_bands
    WHERE origin = origin_c;
    RETURN result;
END $$
DELIMITER ;

SELECT origin, searching_and_suming(origin) AS nb_fans
FROM (SELECT DISTINCT origin FROM metal_bands) AS unique_origins
ORDER BY nb_fans DESC, origin ASC;
