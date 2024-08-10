-- This script Creates a Trigger
CREATE TRIGGER after_adding_new_order
AFTER INSERT ON orders
FOR EACH ROW
UPDATE items
SET quantity = quantity - NEW.number
WHERE name = NEW.item_name
