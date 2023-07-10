# Write your MySQL query statement below
WITH Approved AS (
    SELECT 
        DATE_FORMAT(trans_date, '%Y-%m') AS month,
        country,
        COUNT(*) AS approved_count,
        SUM(amount) AS approved_amount
    FROM 
        Transactions
    WHERE 
        state = 'approved'
    GROUP BY 
        month,
        country
),
Chargebacks AS (
    SELECT 
        DATE_FORMAT(c.trans_date, '%Y-%m') AS month,
        t.country,
        COUNT(*) AS chargeback_count,
        SUM(t.amount) AS chargeback_amount
    FROM 
        Chargebacks c
    JOIN 
        Transactions t ON c.trans_id = t.id
    GROUP BY 
        month,
        country
),
AllData AS (
    SELECT 
        month,
        country,
        approved_count,
        approved_amount,
        0 AS chargeback_count,
        0 AS chargeback_amount
    FROM 
        Approved
    UNION ALL
    SELECT 
        month,
        country,
        0 AS approved_count,
        0 AS approved_amount,
        chargeback_count,
        chargeback_amount
    FROM 
        Chargebacks
)

SELECT 
    month,
    country,
    SUM(approved_count) AS approved_count,
    SUM(approved_amount) AS approved_amount,
    SUM(chargeback_count) AS chargeback_count,
    SUM(chargeback_amount) AS chargeback_amount
FROM 
    AllData
GROUP BY 
    month,
    country
HAVING 
    approved_count > 0 
    OR approved_amount > 0 
    OR chargeback_count > 0 
    OR chargeback_amount > 0
ORDER BY 
    month;
