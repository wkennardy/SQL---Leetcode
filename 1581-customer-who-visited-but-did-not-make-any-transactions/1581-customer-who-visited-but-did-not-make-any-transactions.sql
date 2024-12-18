-- Write your PostgreSQL query statement below
SELECT
    v.customer_id,
    COUNT(*) AS count_no_trans
FROM Visits AS v 
WHERE v.visit_id NOT IN(SELECT visit_id FROM Transactions)
GROUP BY 1
