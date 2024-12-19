SELECT
    p.product_id,
    COALESCE(ROUND(SUM(us.units * p.price * 1.0) / NULLIF(SUM(us.units), 0), 2), 0) AS average_price
FROM Prices AS p
LEFT JOIN UnitsSold AS us
    ON us.product_id = p.product_id 
    AND us.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY p.product_id;
