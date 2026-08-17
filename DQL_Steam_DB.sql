--1. Select games and sort them by order of price (ascending)
SELECT game_id, title, price
FROM game
ORDER BY price ASC;

--2. Select the count of how many publisher users there are and how many games they published
SELECT
	sa.username AS publisher_name,
	COUNT(pg.game_id) AS games_published
FROM steam_accounts AS sa
LEFT JOIN published_games AS pg
	ON sa.user_id = pg.user_id
WHERE sa.is_publisher = 1
GROUP BY sa.user_id, sa.username;


--3. Select achievements in ascending order by achievemeny obtained
SELECT
	achievement_id,
	user_id,
	game_id,
	achievement_name,
	achievement_obtained
FROM achievements
ORDER BY achievement_obtained ASC;


--4. Select and display game name and byte size and sort by descending order
SELECT
	title AS game_name,
	bytes
FROM game
ORDER BY CAST(replace(upper(bytes), 'GB', '') AS REAL) DESC; 


--5. Join query - Select game by transaction and display username, game name, transction id, and price
SELECT
	sa.username,
	g.title AS game_name,
	t.transaction_id,
	g.price
FROM purchased_games AS pg
JOIN steam_accounts AS sa
	ON pg.user_id = sa.user_id
JOIN game AS g
	ON pg.game_id = g.game_id
JOIN transactions AS t
	ON pg.transaction_id = t.transaction_id
	AND pg.game_id = t.game_id
ORDER BY t.transaction_id;



--6. Join query - Select username with game on their wishlist
SELECT
	sa.username,
	g.title AS game_name
FROM wishlist AS w
JOIN steam_accounts AS sa
	ON w.user_id = sa.user_id
JOIN game AS g
	ON w.game_id = g.game_id
ORDER BY sa.username;



--7. Join query - Select purchased games with associated users
SELECT
	sa.username,
	g.title AS game_name
FROM purchased_games AS pg
JOIN steam_accounts AS sa
	ON pg.user_id = sa.user_id
JOIN game AS g
	ON pg.game_id = g.game_id
ORDER BY sa.username;



--8. Join query - Select users and how many friends they have
SELECT
	sa.username,
	COUNT(f.friend_id) AS friend_count
FROM steam_accounts AS sa
LEFT JOIN
(
	SELECT user_id1 AS user_id, user_id2 AS friend_id
	FROM friends
	
	UNION ALL
	
	SELECT user_id2 AS user_id, user_id1 AS friend_id
	FROM friends
) AS f
	ON sa.user_id = f.user_id
GROUP BY sa.user_id, sa.username
ORDER BY friend_count DESC, sa.username;



--9. Join query- select user review score by game Id and include game name
SELECT
	sa.username,
	r.game_id,
	g.title AS game_name,
	r.review_score
FROM reviews AS r
JOIN steam_accounts AS sa
	ON r.user_id = sa.user_id
JOIN game AS g
	ON r.game_id = g.game_id
ORDER BY r.game_id;



--10. Join query - Select item from inventory and display it
SELECT
	sa.username,
	i.item_id,
	it.collectible_name,
	it.collectible_type
FROM inventory AS i
JOIN steam_accounts AS sa
	ON i.user_id = sa.user_id
JOIN items AS it
ON i.item_id = it.item_id
ORDER BY sa.username, it.collectible_name