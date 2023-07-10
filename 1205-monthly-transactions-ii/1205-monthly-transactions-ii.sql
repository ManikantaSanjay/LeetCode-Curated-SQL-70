WITH cte AS (
    SELECT 
        id,
        country,
        state,
        amount,
        DATE_FORMAT(trans_date, '%Y-%m') AS month
    FROM
        Transactions
    WHERE
        state = 'approved'

    UNION ALL

    SELECT 
        trans_id AS id,
        country,
        'chargeback' AS state,
        amount,
        DATE_FORMAT(c.trans_date, '%Y-%m') AS month
    FROM
        Chargebacks c
    JOIN
        Transactions t ON c.trans_id = t.id
)

SELECT
    month,
    country,
    SUM(IF(state = 'approved', 1, 0)) AS approved_count,
    SUM(IF(state = 'approved', amount, 0)) AS approved_amount,
    SUM(IF(state = 'chargeback', 1, 0)) AS chargeback_count,
    SUM(IF(state = 'chargeback', amount, 0)) AS chargeback_amount
FROM
    cte
GROUP BY
    month,
    country;
