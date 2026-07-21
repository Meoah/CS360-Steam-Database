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

-- INSERT INTO steam_accounts (username, is_publisher)
-- VALUES ('username', 0);

-- INSERT INTO items (collectible_name, collectible_type)
-- VALUES ('collectible name', 'collectible type');

-- INSERT INTO game
--     (game_id, title, price, genre, description, bytes, player_count, publisher_id)
-- VALUES
--     (1, 'game title', 0.00, 'genre', 'description', 'size of game', 1, 'publisher user id');

-- INSERT INTO transactions (transaction_id, game_id, price)
-- VALUES (1, 1, 0);

-- INSERT INTO published_games (user_id, game_id, publisher_username)
-- VALUES (1, 1, 'publisher username');

-- INSERT INTO purchased_games (user_id, game_id, transaction_id)
-- VALUES (1, 1, 1);

-- INSERT INTO inventory (user_id, item_id)
-- VALUES (1, 1);

-- INSERT INTO friends (user_id1, user_id2)
-- VALUES (1, 2);

-- INSERT INTO achievements
--     (user_id, game_id, achievement_name, achievement_obtained)
-- VALUES
--     (1, 1, 'achievement name', 0);

-- INSERT INTO wishlist (user_id, game_id)
-- VALUES (1, 1);

-- INSERT INTO reviews (user_id, game_id, review, review_score)
-- VALUES (1, 1, 'review text', 'review score');
