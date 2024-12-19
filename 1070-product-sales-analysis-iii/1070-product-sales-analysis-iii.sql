-- Write your PostgreSQL query statement below
WITH product_sold AS(
SELECT 
    product_id,
    year,
    price,
    quantity,
    DENSE_RANK() OVER(PARTITION BY product_id ORDER BY year) AS first_product
FROM Sales
GROUP BY 1,2,3,4
)
SELECT 
    product_id,
    year AS first_year,
    quantity,
    price
FROM product_sold
WHERE first_product = 1