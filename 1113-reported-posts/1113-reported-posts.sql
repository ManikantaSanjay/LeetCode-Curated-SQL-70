# Write your MySQL query statement below
SELECT 
    extra AS report_reason,
    COUNT(DISTINCT post_id) AS report_count
FROM Actions
WHERE action = 'report' AND action_date = DATE('2019-07-04')
GROUP BY report_reason
HAVING report_count > 0;