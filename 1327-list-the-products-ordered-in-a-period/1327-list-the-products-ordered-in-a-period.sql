-- Write your PostgreSQL query statement below
SELECT 
    product_name,
    SUM(Unit) AS unit
FROM Products AS p
INNER JOIN Orders AS o
ON p.product_id = o.product_id 
WHERE TO_CHAR(order_date, 'YYYY-MM') = '2020-02' 
GROUP BY 1
HAVING SUM(unit) >= '100'
