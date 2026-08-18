DROP TABLE IF EXISTS Game_Audit_Log;
CREATE TABLE Game_Audit_Log (
    audit_id INTEGER PRIMARY KEY AUTOINCREMENT,
    game_id INTEGER,
    publisher_id TEXT,
    action_type TEXT,
    changed_at TEXT DEFAULT (DATETIME('now', 'localtime')),

    --Old values
    old_title TEXT,
    old_price NUMERIC,
    old_genre TEXT,
    old_description TEXT,
    --New values
    new_title TEXT,
    new_price NUMERIC,
    new_genre TEXT,
    new_description TEXT
);

-- Auditing Triggers START ---------------------------------------------------/
-- TABLE Game triggers
-- Validate New Game price, send error if negative
CREATE TRIGGER game_validate_newGamePrice
BEFORE INSERT ON game
BEGIN
    SELECT
        CASE
            WHEN NEW.price < 0 THEN
                RAISE (ABORT, 'Game price cannot be negative.')
        END;
            INSERT INTO Game_Audit_Log (game_id, publisher_id, action_type, new_title, new_price, new_genre, new_description)
            VALUES (NEW.game_id, NEW.publisher_id, 'INSERT', NEW.title, NEW.price, NEW.genre, NEW.description);
END;
-- Validate updated Game price, send error if negative
CREATE TRIGGER game_validate_updatedGamePrice
BEFORE UPDATE ON game
BEGIN
    SELECT
        CASE
            WHEN NEW.price < 0 THEN
                RAISE (ABORT, 'Game price cannot be negative.')
        END;
            INSERT INTO Game_Audit_Log (game_id, publisher_id, action_type, old_title, old_price, old_genre, old_description, new_title, new_price, new_genre, new_description)
            VALUES (OLD.game_id, OLD.publisher_id, 'UPDATE', OLD.title, OLD.price, OLD.genre, OLD.description, NEW.title, NEW.price, NEW.genre, NEW.description);
END;
-- Log when game is deleted
CREATE TRIGGER game_log_deletedGame
AFTER DELETE ON game
BEGIN
    INSERT INTO Game_Audit_Log (game_id, publisher_id, action_type, old_title, old_price, old_genre, old_description)
    VALUES (OLD.game_id, OLD.publisher_id, 'DELETE', OLD.title, OLD.price, OLD.genre, OLD.description);
END;

-- TABLE transactions triggers
-- Log when new record is inserted
CREATE TRIGGER transactions_log_newTransaction
AFTER INSERT ON transactions
BEGIN
    INSERT INTO Game_Audit_Log (game_id, action_type, price)
    VALUES (NEW.game_id, 'INSERT, on transactions',NEW.price);
END;


-- Auditing Triggers END-----------------------------------------------------
-- Convenience Triggers START -----------------------------------------------/
-- Convenience Triggers END -------------------------------------------------

-- Check log
SELECT * FROM Game_Audit_Log;