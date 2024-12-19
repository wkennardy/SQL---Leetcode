-- Write your PostgreSQL query statement below
WITH first_orders AS (
    SELECT 
        customer_id,
        order_date,
        DENSE_RANK() OVER (PARTITION BY customer_id ORDER BY order_date) AS first_order
    FROM Delivery
),
delivery_type AS (
    SELECT  
        d.customer_id,
        SUM(CASE 
            WHEN d.customer_pref_delivery_date = d.order_date THEN 1
            ELSE 0
        END) AS immediate_delivery
    FROM first_orders AS fo
    INNER JOIN Delivery AS d
    ON fo.customer_id = d.customer_id AND fo.order_date = d.order_date
    WHERE fo.first_order = 1
    GROUP BY d.customer_id
)
SELECT  
    ROUND(100.0 * SUM(CASE 
    WHEN immediate_delivery = 1 THEN 1 
    ELSE 0 
    END) / COUNT(*), 2) AS immediate_percentage
FROM delivery_type;


