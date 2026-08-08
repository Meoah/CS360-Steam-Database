DROP TABLE IF EXISTS reviews;
DROP TABLE IF EXISTS wishlist;
DROP TABLE IF EXISTS achievements;
DROP TABLE IF EXISTS friends;
DROP TABLE IF EXISTS inventory;
DROP TABLE IF EXISTS purchased_games;
DROP TABLE IF EXISTS published_games;
DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS game;
DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS steam_accounts;


CREATE TABLE steam_accounts (
    user_id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT,
    is_publisher INTEGER CHECK (is_publisher IN (0, 1))
);

CREATE TABLE items (
    item_id INTEGER PRIMARY KEY AUTOINCREMENT,
    collectible_name TEXT,
    collectible_type TEXT
);

CREATE TABLE game (
    game_id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    price NUMERIC NOT NULL,
    genre TEXT NOT NULL,
    description TEXT,
    bytes TEXT,
    player_count INTEGER NOT NULL,
    publisher_id INTEGER NOT NULL,
    FOREIGN KEY (publisher_id) REFERENCES steam_accounts (user_id)
);

CREATE TABLE transactions (
    transaction_id INTEGER PRIMARY KEY,
    game_id INTEGER NOT NULL,
    price INTEGER NOT NULL, -- Where is the FK coming from??
    FOREIGN KEY (game_id) REFERENCES game (game_id),
    FOREIGN KEY (price) REFERENCES game (price)
);

CREATE TABLE published_games (
    user_id INTEGER NOT NULL,
    game_id INTEGER NOT NULL,
    publisher_username TEXT,
    PRIMARY KEY (user_id, game_id),
    FOREIGN KEY (user_id) REFERENCES steam_accounts (user_id),
    FOREIGN KEY (game_id) REFERENCES game (game_id)
);

CREATE TABLE purchased_games (
    user_id INTEGER NOT NULL,
    game_id INTEGER NOT NULL,
    transaction_id INTEGER NOT NULL,
    PRIMARY KEY (user_id, game_id, transaction_id),
    FOREIGN KEY (user_id) REFERENCES steam_accounts (user_id),
    FOREIGN KEY (game_id) REFERENCES game (game_id),
    FOREIGN KEY (transaction_id) REFERENCES transactions (transaction_id)
);

CREATE TABLE inventory (
    user_id INTEGER NOT NULL,
    item_id INTEGER NOT NULL,
    PRIMARY KEY (user_id, item_id),
    FOREIGN KEY (user_id) REFERENCES steam_accounts (user_id),
    FOREIGN KEY (item_id) REFERENCES items (item_id)
);

CREATE TABLE friends (
    user_id1 INTEGER NOT NULL,
    user_id2 INTEGER NOT NULL,
    PRIMARY KEY (user_id1, user_id2),
    FOREIGN KEY (user_id1) REFERENCES steam_accounts (user_id),
    FOREIGN KEY (user_id2) REFERENCES steam_accounts (user_id),
    CHECK (user_id1 <> user_id2)
);

CREATE TABLE achievements (
    achievement_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    game_id INTEGER NOT NULL,
    achievement_name TEXT,
    achievement_obtained INTEGER CHECK (achievement_obtained IN (0, 1)),
    FOREIGN KEY (user_id) REFERENCES steam_accounts (user_id),
    FOREIGN KEY (game_id) REFERENCES game (game_id)
);

CREATE TABLE wishlist (
    user_id INTEGER NOT NULL,
    game_id INTEGER NOT NULL,
    PRIMARY KEY (user_id, game_id),
    FOREIGN KEY (user_id) REFERENCES steam_accounts (user_id),
    FOREIGN KEY (game_id) REFERENCES game (game_id)
);

CREATE TABLE reviews (
    user_id INTEGER NOT NULL,
    game_id INTEGER NOT NULL,
    review TEXT,
    review_score TEXT NOT NULL,
    PRIMARY KEY (user_id, game_id),
    FOREIGN KEY (user_id) REFERENCES steam_accounts (user_id),
    FOREIGN KEY (game_id) REFERENCES game (game_id)
);
