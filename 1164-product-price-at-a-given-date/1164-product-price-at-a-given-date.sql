-- Write your PostgreSQL query statement below
WITH price_before_date AS (
    SELECT 
        product_id,
        new_price,
        change_date
    FROM Products
    WHERE change_date <= '2019-08-16'
),
ranked_prices AS (
    SELECT 
        product_id,
        new_price,
        ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY change_date DESC) AS rank
    FROM price_before_Date
)
SELECT 
    p.product_id,
    COALESCE(r.new_price, 10) AS price
FROM (SELECT DISTINCT product_id FROM Products) p
LEFT JOIN ranked_prices r
ON p.product_id = r.product_id AND r.rank = 1;


