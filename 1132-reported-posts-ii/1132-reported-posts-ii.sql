# Write your MySQL query statement below
SELECT ROUND(SUM(percent) / COUNT(DISTINCT action_date), 2) AS average_daily_percent
FROM (
    SELECT a.action_date,
        COUNT(DISTINCT r.post_id) / COUNT(DISTINCT a.post_id) * 100 AS percent
    FROM actions a
    LEFT JOIN removals r 
    ON a.post_id = r.post_id
    WHERE a.extra = 'spam'
    GROUP BY a.action_date
) temp;
