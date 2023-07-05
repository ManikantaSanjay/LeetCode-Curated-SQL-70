# Write your MySQL query statement below
SELECT ROUND((100.0 * COUNT(CASE WHEN order_date = customer_pref_delivery_date THEN 1 END)) / COUNT(*), 2) AS immediate_percentage
FROM Delivery;