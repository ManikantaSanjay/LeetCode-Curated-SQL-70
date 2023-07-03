# Write your MySQL query statement below
SELECT name
FROM salesperson
WHERE sales_id NOT IN (
    SELECT sales_id
    FROM orders
    WHERE com_id IN (
        SELECT com_id
        FROM company
        WHERE name = 'RED'
    )
)
