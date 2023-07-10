-- This query calculates the distinct visited dates, total amount for a 7-day rolling window, and average amount per day for each date.

WITH cte AS (
    SELECT visited_on,
           SUM(amount) OVER (ORDER BY visited_on RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW) AS amount,
           DENSE_RANK() OVER (ORDER BY visited_on) AS rn
    FROM Customer
)

SELECT DISTINCT visited_on,
       amount,
       ROUND(amount/7, 2) AS average_amount
FROM cte
WHERE rn >= 7;
