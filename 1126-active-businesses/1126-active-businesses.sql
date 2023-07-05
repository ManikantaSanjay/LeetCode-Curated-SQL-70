# Write your MySQL query statement below
SELECT business_id
FROM events AS a
JOIN (
    SELECT event_type, AVG(occurences) AS av
    FROM events
    GROUP BY event_type
) AS b
ON a.event_type = b.event_type
WHERE a.occurences > b.av
GROUP BY business_id
HAVING COUNT(*) > 1;
