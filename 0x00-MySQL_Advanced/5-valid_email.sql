-- This script creates a trigger
DROP TRIGGER IF EXISTS after_update_email;
DELIMITER $$
CREATE TRIGGER after_update_email
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
    IF NEW.email != OLD.email THEN
        SET NEW.valid_email = 0;
    END IF;
END $$
DELIMITER ;
