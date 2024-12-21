-- Write your PostgreSQL query statement below
WITH id_involvement AS(
    SELECT
        accepter_id AS id,
        COUNT(*) AS request_accepted
    FROM RequestAccepted
    GROUP BY accepter_id
UNION ALL
    SELECT 
        requester_id AS id,
        COUNT(*) AS request_accepted
    FROM RequestAccepted
    GROUP BY requester_id
)
SELECT 
    id,
    SUM(request_accepted) AS num
FROM id_involvement
GROUP BY 1 
ORDER BY num DESC
LIMIT 1
    