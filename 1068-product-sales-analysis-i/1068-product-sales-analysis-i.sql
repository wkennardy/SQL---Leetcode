-- Write your PostgreSQL query statement below
SELECT 
    product_name,
    year,
    price
FROM Sales AS s
INNER JOIN Product AS p
ON p.product_id = s.product_id