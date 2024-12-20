-- Write your PostgreSQL query statement below
DELETE 
FROM Person 
WHERE id NOT IN
    (SELECT min(id) 
    FROM person
    GROUP BY email)