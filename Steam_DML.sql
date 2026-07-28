--DML Triggers
--Check if the game price is negative before inserting a new game into the game table
CREATE TRIGGER validate_gamePrice
BEFORE INSERT ON game
FOR EACH ROW
BEGIN
    IF NEW.price < 0 THEN
        RAISE (ABORT, 'Game price cannot be negative.');
    END IF;
END;
--

BEGIN TRANSACTION;

DELETE FROM reviews;
DELETE FROM wishlist;
DELETE FROM achievements;
DELETE FROM friends;
DELETE FROM inventory;
DELETE FROM purchased_games;
DELETE FROM published_games;
DELETE FROM transactions;
DELETE FROM game;
DELETE FROM items;
DELETE FROM steam_accounts;

DELETE FROM sqlite_sequence
WHERE name IN ('steam_accounts', 'items', 'achievements');

COMMIT;

-- Inserting the Steam_Accounts
INSERT INTO steam_accounts (username, is_publisher)
VALUES
    ('User 1', FALSE),
    ('User 2', FALSE),
    ('User 3', FALSE),
    ('User 4', FALSE),
    ('User 5', FALSE),
    ('User 6', TRUE),
    ('User 7', TRUE),
    ('User 8', TRUE),
    ('User 9', TRUE),
    ('User 10', TRUE);

-- Inserting the Collectible Items
INSERT INTO items (collectible_name, collectible_type)
VALUES
    ('collectible 1', 'collectible type');

-- Inserting Games
INSERT INTO game
    (game_id, title, price, genre, description, bytes, player_count, publisher_id)
VALUES
    (1, 'Cuphead', 19.99, 'Action, Indie', 'Cuphead is a classic run and gun action game heavily focused on boss battles. Inspired by cartoons of the 1930s, the visuals and audio are painstakingly created with the same techniques of the era, i.e. traditional hand drawn cel animation, watercolor backgrounds, and original jazz recordings.', '4GB', 19026, 'User 6'),
    (2, 'Persona 5 Royal', 59.99, 'RPG', 'Lead the Phantom Thieves of Hearts in this award winning, stylish turn-based RPG filled with dungeon crawling, party customization, strategic combat, and Persona fusion. Explore Tokyo, build relationships, battle Shadows, and infiltrate the minds of the corrupt to make them change their ways!', '41 GB', 35474, 'User 7'),
    (3, 'Destiny 2', 0.00, 'Action, Adventure, Free To Play', 'Explore the mysteries of Sol and experience exhilirating first-person shooter combat in Destiny 2. Unlock powerful abilities and collect unique gear across story missions, co-op, and PvP modes.', '105 GB', 316750, 'User 8'),
    (4, 'DOOM: The Dark Ages', 69.99, 'Action', 'DOOM: The Dark Ages is the prequel to the critically acclaimed DOOM (2016) and DOOM Eternal that tells an epic cinematic story worthy of the DOOM Slayer’s legend. Players will step into the blood-stained boots of the DOOM Slayer, in this never-before-seen dark and sinister medieval war against Hell.', '100 GB', 31470, 'User 9'),
    (5, 'DELTARUNE', 24.99, 'Indie, RPG', 'Dive into the parallel story to UNDERTALE! Fight or spare your way through action-packed battles as you explore a mysterious world alongside an endearing cast of new and familiar characters. Chapters 1-5 are available now, with more planned as free updates!', '1 GB', 291816, 'User 10'),
    (6, 'Team Fortress 2', 0.00, 'Action, Free To Play', 'Nine distinct classes provide a broad range of tactical abilities and personalities. Constantly updated with new game modes, maps, equipment and, most importantly, hats!', '15 GB', 253997, 'User 6'),
    (7, 'STAR WARS Squadrons', 39.99, 'Action, Simulation', 'Master the art of starfighter combat in the authentic piloting experience STAR WARS™: Squadrons. Feel the adrenaline of first-person multiplayer space dogfights alongside your squadron, and buckle up in a thrilling STAR WARS™ story.', '40 GB', 36492, 'User 7'),
    (8, 'FINAL FANTASY XVI', 49.99, 'Action, RPG', 'An epic dark fantasy where fates are decided by mighty Eikons and the Dominants who wield them. This is the tale of Clive Rosfield, a tragic warrior who swears revenge on the Dark Eikon Ifrit, a mysterious entity that leaves naught but calamity in its wake.', '170 GB', 27508, 'User 8'),
    (9, 'HELLDIVERS 2', 39.99, 'Action', 'The Galaxy’s Last Line of Offence. Enlist in the Helldivers and join the fight for freedom across a hostile galaxy in a fast, frantic, and ferocious third-person shooter.', '135 GB', 458709, 'User 9'),
    (10, 'Call of Duty: Modern Warfare', 59.99, 'Action', 'Experience a visceral Campaign or assemble your team in the ultimate online playground with multiple Special Ops challenges and a mix of Multiplayer maps and modes.', '175 GB', 61667, 'User 10');

-- Inserting Transactions
INSERT INTO transactions (transaction_id, game_id, price)
VALUES
    (1, 1, 19.99),
    (2, 2, 59.99),
    (3, 3, 0.00),
    (4, 4, 69.99),
    (5, 5, 24.99),
    (6, 6, 0.00),
    (7, 7, 39.99),
    (8, 8, 49.99),
    (9, 9, 39.99),
    (10, 10, 59.99);

-- Inserting Published Games by Publisher Accounts
INSERT INTO published_games (user_id, game_id, publisher_username)
VALUES
    (6, 1, 'User 6'),
    (7, 2, 'User 7'),
    (8, 3, 'User 8'),
    (9, 4, 'User 9'),
    (10, 5, 'User 10'),
    (6, 6, 'User 6'),
    (7, 7, 'User 7'),
    (8, 8, 'User 8'),
    (9, 9, 'User 9'),
    (10, 10, 'User 10');

-- Inserting Purchased Games by Regular Accounts
INSERT INTO purchased_games (user_id, game_id, transaction_id)
VALUES
    (1, 1, 1),
    (2, 2, 2),
    (3, 3, 3),
    (4, 4, 4),
    (5, 5, 5),
    (1, 6, 6),
    (2, 7, 7),
    (3, 8, 8),
    (4, 9, 9),
    (5, 10, 10);

-- Inserting who has what item
INSERT INTO inventory (user_id, item_id)
VALUES
    (1, 1),
    (2, 1),
    (3, 1),
    (4, 1),
    (5, 1);

-- Inserting friends data
INSERT INTO friends (user_id1, user_id2)
VALUES
    (1, 2),
    (1, 3),
    (2, 3),
    (4, 5),
    (5, 1);

-- Inserting who achieved what achievements
INSERT INTO achievements
    (user_id, game_id, achievement_name, achievement_obtained)
VALUES
    (1, 1, 'Beat the Devil', 1),
    (2, 2, 'Phantom Thief', 1),
    (3, 3, 'Guardian', 1),
    (4, 4, 'DOOM Slayer', 1),
    (5, 5, 'Knight of Heart', 1),
    (1, 6, 'Hat Trick', 1),
    (2, 7, 'Ace Pilot', 1),
    (3, 8, 'Eikon Master', 1),
    (4, 9, 'Helldiver', 1),
    (5, 10, 'War Hero', 1);

-- Inserting Wishlist
INSERT INTO wishlist (user_id, game_id)
VALUES
    (1, 2),
    (2, 3),
    (3, 4),
    (4, 5),
    (5, 6),
    (1, 7),
    (2, 8),
    (3, 9),
    (4, 10),
    (5, 1);

-- Inserting reviews
INSERT INTO reviews (user_id, game_id, review, review_score)
VALUES
    (1, 1, 'Amazing game!', 5),
    (2, 2, 'My favorite RPG!', 5),
    (3, 3, 'Great free-to-play game.', 4),
    (4, 4, 'DOOM never disappoints.', 5),
    (5, 5, 'Charming and unique.', 4),
    (1, 6, 'Endless fun with friends.', 5),
    (2, 7, 'Star Wars fans must play!', 5),
    (3, 8, 'Epic story and gameplay.', 5),
    (4, 9, 'Chaotic and fun.', 4),
    (5, 10, 'Classic CoD experience.', 4);
