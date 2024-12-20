-- Write your PostgreSQL query statement below
(SELECT 
    u.name AS results
FROM Users AS u
INNER JOIN MovieRating AS m
ON m.user_id = u.user_id
GROUP BY u.name
ORDER BY  COUNT(rating) DESC, u.name ASC
LIMIT 1)

UNION ALL 

(SELECT 
    mo.title AS results
FROM Movies AS mo
INNER JOIN MovieRating AS m
ON m.movie_id = mo.movie_id
WHERE TO_CHAR(created_at, 'YYYY-MM') = '2020-02'
GROUP BY 1
ORDER BY AVG(rating) DESC, mo.title ASC
LIMIT 1)

