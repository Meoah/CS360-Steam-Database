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
    ('NovaVoid28', FALSE),
    ('1epicboi', FALSE),
    ('LegendaryDemon41', FALSE),
    ('RogueHawk0', FALSE),
    ('maplesea8907', FALSE),
    ('FrostViper48', FALSE),
    ('dachemmy47', FALSE),
    ('oceanstar94', FALSE),
    ('iliketurtles777', FALSE),
    ('FuzzyPlatypus57', FALSE),
    ('Activision', TRUE),
    ('PlayStation Publishing LLCs', TRUE),
    ('Square Enix', TRUE),
    ('Electronic Arts', TRUE),
    ('Valve', TRUE),
    ('Toby Fox', TRUE),
    ('Bethesda Softworks', TRUE),
    ('Bungie', TRUE),
    ('ATLUS', TRUE),
    ('Studio MDHR', TRUE);

-- Inserting the Collectible Items
INSERT INTO items (collectible_name, collectible_type)
VALUES
    -- Items for Cuphead
    ('Devil’s Inferno Shard', 'Boss Trophy'),
    ('Ms. Chalice’s Tea Set', 'Emote'),
    ('Porkrind’s Pin', 'Badge'),
    ('The Root Pack’s Seed', 'Sticker'),
    ('Hilda’s Lullaby Record', 'Background Music'),

    -- Items for Persona 5 Royal
    ('Joker’s Joker Card', 'Key Item'),
    ('Morgana’s Treasure Box', 'Chest'),
    ('Maruki’s Reality Shard', 'Arcana'),
    ('Caroline’s Black Box', 'Key Item'),
    ('Yusuke’s Artistic Brush', 'Tool'),

    -- Items for Destiny 2
    ('Gjallarhorn Shell', 'Exotic Weapon'),
    ('Traveler’s Fragment', 'Ornament'),
    ('Sparrow: Midnight Runner', 'Vehicle'),
    ('Ghost: Dinklebot Edition', 'Companion'),
    ('Shader: Classic Green', 'Customization'),

    -- Items for DOOM: The Dark Ages
    ('Hellforged Axe', 'Weapon Skin'),
    ('Unholy Amulet', 'Trinket'),
    ('Dark Crucible Shield', 'Armor Skin'),
    ('Demon Bone Charm', 'Accessory'),
    ('Bloodstone Core', 'Power-Up'),

    -- Items for DELTARUNE
    ('Susie’s Toy Hammer', 'Weapon Skin'),
    ('Ralsei’s Cog', 'Key Item'),
    ('Noelle’s Ribbon', 'Accessory'),
    ('Berdly’s Feather', 'Collectible'),
    ('Jukebox: Snowdin Theme', 'Music'),

    -- Items for Team Fortress 2
    ('Scout’s Baseball', 'Taunt'),
    ('Heavy’s Sandvich', 'Consumable'),
    ('Medic’s Kritzkrieg', 'Weapon Skin'),
    ('Sniper’s Banana', 'Consumable'),
    ('Spy’s Revolver', 'Weapon Skin'),

    -- Items for STAR WARS Squadrons
    ('X-Wing: Red Squadron', 'Ship Skin'),
    ('TIE Fighter: Imperial Mark', 'Ship Skin'),
    ('Hyperdrive Core', 'Key Item'),
    ('Astromech Droid: R5 Unit', 'Companion'),
    ('Blaster Pistol: DL-44', 'Weapon Skin'),

    -- Items for FINAL FANTASY XVI
    ('Eikon: Phoenix Down', 'Summon'),
    ('Clive’s Sword', 'Weapon Skin'),
    ('Magicite Shard', 'Key Item'),
    ('Accessory: Beatrix’s Gloves', 'Armor'),
    ('Potion: Phoenix Elixir', 'Consumable'),

    -- Items for HELLDIVERS 2
    ('Stratagem: Eagle 500kg', 'Deployable'),
    ('Hellpod: Reinforced', 'Vehicle Skin'),
    ('Armor: Juggernaut', 'Armor Skin'),
    ('Weapon: AR-23 Liberator', 'Weapon Skin'),
    ('Medal: Bronze Star', 'Collectible'),

    -- Items for Call of Duty: Modern Warfare
    ('Weapon: M4 Assault Rifle', 'Weapon Skin'),
    ('Perk: Double Time', 'Gameplay Perk'),
    ('Killstreak: UAV', 'Special Ability'),
    ('Weapon Camo: Arctic', 'Weapon Camo'),
    ('Dog Tag: Custom Engraving', 'Collectible');


-- Inserting Games
INSERT INTO game
    (game_id, title, price, genre, description, bytes, player_count, publisher_id)
VALUES
    (1, 'Cuphead', 19.99, 'Action, Indie', 'Cuphead is a classic run and gun action game heavily focused on boss battles. Inspired by cartoons of the 1930s, the visuals and audio are painstakingly created with the same techniques of the era, i.e. traditional hand drawn cel animation, watercolor backgrounds, and original jazz recordings.', '4GB', 19026, 20),
    (2, 'Persona 5 Royal', 59.99, 'RPG', 'Lead the Phantom Thieves of Hearts in this award winning, stylish turn-based RPG filled with dungeon crawling, party customization, strategic combat, and Persona fusion. Explore Tokyo, build relationships, battle Shadows, and infiltrate the minds of the corrupt to make them change their ways!', '41 GB', 35474, 19),
    (3, 'Destiny 2', 0.00, 'Action, Adventure, Free To Play', 'Explore the mysteries of Sol and experience exhilirating first-person shooter combat in Destiny 2. Unlock powerful abilities and collect unique gear across story missions, co-op, and PvP modes.', '105 GB', 316750, 18),
    (4, 'DOOM: The Dark Ages', 69.99, 'Action', 'DOOM: The Dark Ages is the prequel to the critically acclaimed DOOM (2016) and DOOM Eternal that tells an epic cinematic story worthy of the DOOM Slayer’s legend. Players will step into the blood-stained boots of the DOOM Slayer, in this never-before-seen dark and sinister medieval war against Hell.', '100 GB', 31470, 17),
    (5, 'DELTARUNE', 24.99, 'Indie, RPG', 'Dive into the parallel story to UNDERTALE! Fight or spare your way through action-packed battles as you explore a mysterious world alongside an endearing cast of new and familiar characters. Chapters 1-5 are available now, with more planned as free updates!', '1 GB', 291816, 16),
    (6, 'Team Fortress 2', 0.00, 'Action, Free To Play', 'Nine distinct classes provide a broad range of tactical abilities and personalities. Constantly updated with new game modes, maps, equipment and, most importantly, hats!', '15 GB', 253997, 15),
    (7, 'STAR WARS Squadrons', 39.99, 'Action, Simulation', 'Master the art of starfighter combat in the authentic piloting experience STAR WARS™: Squadrons. Feel the adrenaline of first-person multiplayer space dogfights alongside your squadron, and buckle up in a thrilling STAR WARS™ story.', '40 GB', 36492, 14),
    (8, 'FINAL FANTASY XVI', 49.99, 'Action, RPG', 'An epic dark fantasy where fates are decided by mighty Eikons and the Dominants who wield them. This is the tale of Clive Rosfield, a tragic warrior who swears revenge on the Dark Eikon Ifrit, a mysterious entity that leaves naught but calamity in its wake.', '170 GB', 27508, 13),
    (9, 'HELLDIVERS 2', 39.99, 'Action', 'The Galaxy’s Last Line of Offence. Enlist in the Helldivers and join the fight for freedom across a hostile galaxy in a fast, frantic, and ferocious third-person shooter.', '135 GB', 458709, 12),
    (10, 'Call of Duty: Modern Warfare', 59.99, 'Action', 'Experience a visceral Campaign or assemble your team in the ultimate online playground with multiple Special Ops challenges and a mix of Multiplayer maps and modes.', '175 GB', 61667, 11);

-- Inserting Transactions
INSERT INTO transactions (transaction_id, game_id, price)
VALUES
    (1, 10, 59.99),
    (2, 9, 39.99),
    (3, 5, 24.99),
    (4, 2, 59.99),
    (5, 1, 19.99),
    (6, 4, 69.99),
    (7, 3, 0.00),
    (8, 7, 39.99),
    (9, 8, 49.99),
    (10, 6, 0.00),
    (11, 4, 69.99),
    (12, 4, 69.99),
    (13, 5, 24.99),
    (14, 3, 0.00),
    (15, 3, 0.00),
    (16, 7, 39.99),
    (17, 4, 69.99),
    (18, 6, 0.00),
    (19, 7, 39.99),
    (20, 7, 39.99);

-- Inserting Published Games by Publisher Accounts
INSERT INTO published_games (user_id, game_id, publisher_username)
VALUES
    (11, 10, 'Activision'),
    (12, 9, 'PlayStation Publishing LLCs'),
    (13, 8, 'Square Enix'),
    (14, 7, 'Electronic Arts'),
    (15, 6, 'Valve'),
    (16, 5, 'Toby Fox'),
    (17, 4, 'Bethesda Softworks'),
    (18, 3, 'Bungie'),
    (19, 2, 'ATLUS'),
    (20, 1, 'Studio MDHR');

-- Inserting Purchased Games by Regular Accounts
INSERT INTO purchased_games (user_id, game_id, transaction_id)
VALUES
    (1, 10, 1),
    (2, 9, 2),
    (3, 5, 3),
    (4, 2, 4),
    (5, 1, 5),
    (6, 4, 6),
    (7, 3, 7),
    (8, 7, 8),
    (9, 8, 9),
    (10, 6, 10),
    (1, 4, 11),
    (2, 4, 12),
    (10, 5, 13),
    (4, 3, 14),
    (5, 3, 15),
    (2, 7, 16),
    (7, 4, 17),
    (8, 6, 18),
    (9, 7, 19),
    (5, 7, 20);

 -- Inserting Wishlist
INSERT INTO wishlist (user_id, game_id)
VALUES
    (7, 9),
    (2, 3),
    (5, 4),
    (10, 1),
    (1, 6),
    (8, 8),
    (3, 2),
    (6, 7),
    (9, 5),
    (4, 10),
    (2, 2),
    (10, 8),
    (5, 5),
    (3, 8),
    (7, 7);

-- Inserting who has what item
INSERT INTO inventory (user_id, item_id)
VALUES
    -- User 1 (Cuphead) - Additional items
    (1, 2), (1, 3), (1, 4), (1, 5),
    (1, 6), (1, 7), (1, 8), (1, 9),
    (1, 10),

    -- User 2 (Persona 5 Royal) - Additional items
    (2, 7), (2, 8), (2, 9), (2, 10),
    (2, 11), (2, 12), (2, 13), (2, 14),
    (2, 15),

    -- User 3 (Destiny 2) - Additional items
    (3, 11), (3, 12), (3, 13), (3, 14),
    (3, 15), (3, 16), (3, 17), (3, 18),
    (3, 19),

    -- User 4 (DOOM: The Dark Ages) - Additional items
    (4, 16), (4, 17), (4, 18), (4, 19),
    (4, 20), (4, 21), (4, 22), (4, 23),
    (4, 24),

    -- User 5 (DELTARUNE) - Additional items
    (5, 21), (5, 22), (5, 23), (5, 24),
    (5, 25), (5, 26), (5, 27), (5, 28),
    (5, 29),

    -- User 6 (Team Fortress 2) - Additional items
    (6, 26), (6, 27), (6, 28), (6, 29),
    (6, 30), (6, 31), (6, 32), (6, 33),
    (6, 34),

    -- User 7 (STAR WARS Squadrons) - Additional items
    (7, 31), (7, 32), (7, 33), (7, 34),
    (7, 35), (7, 36), (7, 37), (7, 38),
    (7, 39),

    -- User 8 (FINAL FANTASY XVI) - Additional items
    (8, 36), (8, 37), (8, 38), (8, 39),
    (8, 40), (8, 41), (8, 42), (8, 43),
    (8, 44),

    -- User 9 (HELLDIVERS 2) - Additional items
    (9, 41), (9, 42), (9, 43), (9, 44),
    (9, 45), (9, 46), (9, 47), (9, 48),
    (9, 49),

    -- User 10 (Call of Duty: Modern Warfare) - Additional items
    (10, 46), (10, 47), (10, 48), (10, 49),
    (10, 50);


-- Inserting friends data
INSERT INTO friends (user_id1, user_id2)
VALUES
    (1, 4),
    (2, 7),
    (3, 9),
    (4, 2),
    (5, 10),
    (6, 3),
    (7, 5),
    (8, 1),
    (9, 6),
    (10, 8),
    (1, 3),
    (2, 9),
    (4, 7),
    (5, 2),
    (6, 10);

-- Inserting who achieved what achievements
INSERT INTO achievements
    (user_id, game_id, achievement_name, achievement_obtained)
VALUES
    -- Achievements for Cuphead (game_id = 1)
    (5, 1, 'First Kill', 1),
    (5, 1, 'Boss Rush', 1),
    (5, 1, 'Perfect Parry', 1),
    (5, 1, 'No Damage Run', 1),
    (5, 1, 'All Bosses Defeated', 1),
    (5, 1, 'Speedrunner', 1),
    (5, 1, 'No Hit Wonder', 1),
    (5, 1, 'Expert Mode Unlocked', 1),
    (5, 1, 'All Weapons Mastered', 1),
    (5, 1, 'Legacy of the Devil', 1),

    -- Achievements for Persona 5 Royal (game_id = 2)
    (4, 2, 'Phantom Thief', 1),
    (4, 2, 'Social Butterfly', 1),
    (4, 2, 'Dungeon Crawler', 1),
    (4, 2, 'Persona Fusion Master', 1),
    (4, 2, 'All Confidants Maxed', 1),
    (4, 2, 'True Ending Unlocked', 1),
    (4, 2, 'Victory Lap', 1),
    (4, 2, 'Shadow Collector', 1),
    (4, 2, 'Joker Stands Tall', 1),
    (4, 2, 'Royalty Achieved', 1),

    -- Achievements for Destiny 2 (game_id = 3)
    (7, 3, 'First Light', 1),
    (5, 3, 'Raids Completed', 1),
    (5, 3, 'PvP Victor', 1),
    (4, 3, 'Gear Master', 1),
    (7, 3, 'Exotic Collector', 1),
    (5, 3, 'Strike Team', 1),
    (7, 3, 'Patrol Veteran', 1),
    (4, 3, 'Gambit Champion', 1),
    (4, 3, 'Powerful Friends', 1),
    (4, 3, 'Destiny 2 Completionist', 1),

    -- Achievements for DOOM: The Dark Ages (game_id = 4)
    (2, 4, 'First Blood', 1),
    (6, 4, 'Hellslayer', 1),
    (6, 4, 'Dark Age Warrior', 1),
    (2, 4, 'No Mercy', 1),
    (7, 4, 'Boss Hunter', 1),
    (1, 4, 'Speed Demon', 1),
    (7, 4, 'All Weapons Unlocked', 1),
    (6, 4, 'Secret Keeper', 1),
    (2, 4, 'Doom Slayer Legend', 1),
    (1, 4, 'Dark Ages Master', 1),

    -- Achievements for DELTARUNE (game_id = 5)
    (10, 5, 'First Battle', 1),
    (3, 5, 'Spare Master', 1),
    (10, 5, 'No Damage Run', 1),
    (3, 5, 'All Friends Saved', 1),
    (3, 5, 'Chapter 1 Complete', 1),
    (3, 5, 'Chapter 2 Complete', 1),
    (10, 5, 'Chapter 3 Complete', 1),
    (10, 5, 'Chapter 4 Complete', 1),
    (10, 5, 'Chapter 5 Complete', 1),
    (3, 5, 'True Pacifist', 1),

    -- Achievements for Team Fortress 2 (game_id = 6)
    (10, 6, 'First Blood', 1),
    (8, 6, 'Hat Trick', 1),
    (10, 6, 'Medic Master', 1),
    (8, 6, 'Sniper Victory', 1),
    (8, 6, 'Demoman Expert', 1),
    (10, 6, 'Engineer Pro', 1),
    (8, 6, 'Spy Uncloaked', 1),
    (8, 6, 'All Classes Played', 1),
    (8, 6, 'Payload Pusher', 1),
    (10, 6, 'Team Fortress Champion', 1),

    -- Achievements for STAR WARS Squadrons (game_id = 7)
    (5, 7, 'First Dogfight', 1),
    (9, 7, 'Ace Pilot', 1),
    (5, 7, 'Fighter Ace', 1),
    (8, 7, 'Bomber Hunter', 1),
    (5, 7, 'Story Complete', 1),
    (9, 7, 'Multiplayer Victor', 1),
    (9, 7, 'All Ships Unlocked', 1),
    (8, 7, 'No Damage Run', 1),
    (8, 7, 'Squadron Leader', 1),
    (9, 7, 'Galactic Hero', 1),

    -- Achievements for FINAL FANTASY XVI (game_id = 8)
    (9, 8, 'First Eikon', 1),
    (9, 8, 'Boss Hunter', 1),
    (9, 8, 'Story Complete', 1),
    (9, 8, 'All Eikons Unlocked', 1),
    (9, 8, 'Side Quests Complete', 1),
    (9, 8, 'No Damage Run', 1),
    (9, 8, 'Clive Stands Tall', 1),
    (9, 8, 'Magic Master', 1),
    (9, 8, 'Weapon Collection', 1),
    (9, 8, 'Final Fantasy Champion', 1),

    -- Achievements for HELLDIVERS 2 (game_id = 9)
    (2, 9, 'First Mission', 1),
    (2, 9, 'Veteran Helldiver', 1),
    (2, 9, 'No Death Run', 1),
    (2, 9, 'All Missions Complete', 1),
    (2, 9, 'Gear Master', 1),
    (2, 9, 'Friendly Fire Avoided', 1),
    (2, 9, 'Stratagem Expert', 1),
    (2, 9, 'Helldiver Leader', 1),
    (2, 9, 'No Surrender', 1),
    (2, 9, 'Galaxy Saved', 1),

    -- Achievements for Call of Duty: Modern Warfare (game_id = 10)
    (1, 10, 'First Blood', 1),
    (1, 10, 'Headshot King', 1),
    (1, 10, 'Mission Complete', 1),
    (1, 10, 'Multiplayer Victor', 1),
    (1, 10, 'All Weapons Unlocked', 1),
    (1, 10, 'No Damage Run', 1),
    (1, 10, 'Sniper Expert', 1),
    (1, 10, 'Team Player', 1),
    (1, 10, 'Warzone Champion', 1),
    (1, 10, 'Modern Warfare Master', 1);

-- Inserting reviews
INSERT INTO reviews (user_id, game_id, review, review_score)
VALUES
    (5, 1, 'Amazing game!', 5),
    (4, 2, 'My favorite RPG!', 5),
    (7, 3, 'Great free-to-play game.', 4),
    (1, 4, 'DOOM never disappoints.', 5),
    (10, 5, 'Charming and unique.', 4),
    (8, 6, 'Endless fun with friends.', 5),
    (5, 7, 'Star Wars fans must play!', 5),
    (9, 8, 'Epic story and gameplay.', 5),
    (2, 9, 'Chaotic and fun.', 4),
    (1, 10, 'Classic CoD experience.', 4);
