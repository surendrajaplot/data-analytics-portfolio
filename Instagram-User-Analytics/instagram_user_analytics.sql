-- Instagram User Analytics Project

SELECT *
FROM users
ORDER BY created_at ASC
LIMIT 5;

SELECT u.id, u.username
FROM users u
LEFT JOIN photos p
ON u.id = p.user_id
WHERE p.id IS NULL;

SELECT p.id AS photo_id,
       p.user_id,
       COUNT(l.id) AS total_likes
FROM photos p
JOIN likes l
ON p.id = l.photo_id
GROUP BY p.id
ORDER BY total_likes DESC
LIMIT 1;
