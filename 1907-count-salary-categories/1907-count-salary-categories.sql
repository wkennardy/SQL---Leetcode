# Write your MySQL query statement below
WITH low_salary AS(
SELECT 
    account_id
FROM Accounts 
WHERE income < 20000
),
med_salary AS(
    SELECT 
        account_id
    FROM Accounts 
    WHERE income BETWEEN 20000 AND 50000
),
high_salary AS(
    SELECT 
        account_id
        FROM Accounts
        WHERE income > 50000
)
SELECT 
    'Low Salary' AS category,
    COUNT(account_id) AS accounts_count
FROM low_salary 
UNION 
SELECT 
    'Average Salary' AS category,
    COUNT(account_id) AS accounts_count
FROM med_salary
UNION 
SELECT  
    'High Salary' AS category,
    COUNT(account_id) AS accounts_count
FROM high_salary
