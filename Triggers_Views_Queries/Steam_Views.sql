CREATE VIEW WishlistsView AS
SELECT w.game_id, g.title, count(w.game_id) AS Wishlists
FROM wishlist AS w, game as g
WHERE w.game_id = g.game_id
GROUP BY w.game_id;

SELECT * FROM WishlistsView;


CREATE VIEW FriendsView AS
SELECT DISTINCT t1.username AS User, t2.username AS Friend FROM 
(SELECT f.user_id1, a.username
FROM friends AS f, steam_accounts AS a
WHERE f.user_id1 = a.user_id) AS t1, 
(SELECT f.user_id2, a.username
FROM friends AS f, steam_accounts AS a
WHERE f.user_id2 = a.user_id) AS t2, 
friends
WHERE t1.user_id1 = friends.user_id1 AND t2.user_id2 = friends.user_id2
ORDER BY t1.username;

SELECT * FROM FriendsView;


CREATE VIEW AchievementCountsView AS
SELECT user_id, count(achievement_id) AS "Achievement Count"
FROM achievements
GROUP BY user_id;

SELECT * FROM AchievementCountsView;