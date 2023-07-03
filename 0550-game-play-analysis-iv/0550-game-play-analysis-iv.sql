WITH tomorrow_cte AS (
    SELECT player_id, DATE_ADD(MIN(event_date), INTERVAL 1 DAY) AS tomorrow_date
    FROM Activity
    GROUP BY player_id
)

SELECT ROUND(COUNT(DISTINCT a.player_id) / (SELECT COUNT(DISTINCT player_id) 
                                             FROM Activity), 2) AS fraction
FROM Activity a
JOIN tomorrow_cte t ON t.player_id = a.player_id AND t.tomorrow_date = a.event_date

