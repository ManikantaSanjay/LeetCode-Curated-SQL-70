# Write your MySQL query statement below
WITH customer_spending AS (
    SELECT 
        o.customer_id, 
        c.name,
        SUM(p.price * o.quantity) AS total_spent,
        MONTH(o.order_date) AS month,
        YEAR(o.order_date) AS year
    FROM 
        Orders o
    JOIN 
        Product p ON o.product_id = p.product_id
    JOIN 
        Customers c ON c.customer_id = o.customer_id
    WHERE 
        YEAR(o.order_date) = 2020 AND MONTH(o.order_date) IN (6,7)
    GROUP BY 
        o.customer_id, MONTH(o.order_date)
    HAVING 
        total_spent >= 100
)

SELECT 
    customer_id, 
    name
FROM 
    customer_spending
GROUP BY 
    customer_id
HAVING 
    COUNT(DISTINCT month) = 2

