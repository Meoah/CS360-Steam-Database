/*Validate Game price, send error if negative*/
CREATE TRIGGER validate_gamePrice
BEFORE INSERT ON game
FOR EACH ROW
BEGIN
    IF NEW.price < 0 THEN
        RAISE (ABORT, 'Game price cannot be negative.');
    END IF;
END;