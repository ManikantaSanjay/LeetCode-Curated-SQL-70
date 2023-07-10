WITH recursive seq AS (
    SELECT 0 AS transactions_count
    UNION ALL
    SELECT transactions_count + 1
    FROM seq
    WHERE transactions_count < (SELECT MAX(transactions_count) FROM (
        SELECT V.user_id, V.visit_date, COUNT(T.transaction_date) AS transactions_count
        FROM Visits V
        LEFT JOIN Transactions T
        ON V.user_id = T.user_id AND V.visit_date = T.transaction_date
        GROUP BY V.user_id, V.visit_date) AS max_trans)
),
trans_count AS (
    SELECT V.user_id, V.visit_date, COUNT(T.transaction_date) AS transactions_count
    FROM Visits V
    LEFT JOIN Transactions T
    ON V.user_id = T.user_id AND V.visit_date = T.transaction_date
    GROUP BY V.user_id, V.visit_date
)

SELECT seq.transactions_count, COALESCE(COUNT(trans_count.user_id), 0) AS visits_count
FROM seq
LEFT JOIN trans_count ON seq.transactions_count = trans_count.transactions_count
GROUP BY seq.transactions_count
ORDER BY seq.transactions_count;
