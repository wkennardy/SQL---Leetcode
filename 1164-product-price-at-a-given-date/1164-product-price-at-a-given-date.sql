-- Write your PostgreSQL query statement below
WITH price_before AS(
SELECT 
    product_id,
    new_price,
    change_date
FROM Products
WHERE change_date <= '2019-08-16'
),
closest_price AS(
SELECT 
    product_id,
    new_price,
    ROW_NUMBER() OVER(PARTITION BY product_id ORDER BY change_date DESC) AS rank 
FROM price_before
)
SELECT 
    p.product_id,
    COALESCE(c.new_price, 10) AS price 
FROM (SELECT DISTINCT product_id FROM Products) AS p
LEFT JOIN closest_price AS c
ON c.product_id = p.product_id AND c.rank = 1 

    