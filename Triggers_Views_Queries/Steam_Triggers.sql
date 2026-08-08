DROP TABLE IF EXISTS Game_Audit_Log;
CREATE TABLE Game_Audit_Log (
    audit_id INTEGER PRIMARY KEY AUTOINCREMENT,
    game_id INTEGER,
    publisher_id TEXT,
    action_type TEXT,
    changed_at TEXT DEFAULT (DATETIME('now', 'localtime'))

    --Old values
    old_title TEXT,
    old_price NUMERIC,
    old_genre TEXT,
    old_description TEXT,
    --New values
    new_title TEXT,
    new_price NUMERIC,
    new_genre TEXT
    new_description TEXT
);

/*Validate Game price, send error if negative*/
CREATE TRIGGER validate_newGamePrice
BEFORE INSERT ON game
BEGIN
    SELECT
        CASE
            WHEN NEW.price < 0 THEN
                RAISE (ABORT, 'Game price cannot be negative.')
        END;
END;