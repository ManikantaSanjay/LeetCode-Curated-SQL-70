# Write your MySQL query statement below
WITH Order_Ranks AS (
    SELECT 
        C.name AS customer_name, 
        O.customer_id, 
        O.order_id, 
        O.order_date,
        RANK() OVER(PARTITION BY O.customer_id ORDER BY O.order_date DESC) AS order_rank
    FROM 
        Customers C
    JOIN 
        Orders O ON C.customer_id = O.customer_id
)

SELECT 
    customer_name, 
    customer_id, 
    order_id, 
    order_date
FROM 
    Order_Ranks
WHERE 
    order_rank <= 3
ORDER BY 
    customer_name ASC, 
    customer_id ASC, 
    order_date DESC;
