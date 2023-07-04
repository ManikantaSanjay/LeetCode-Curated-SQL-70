SELECT seller_id
FROM Sales
GROUP BY seller_id
HAVING SUM(PRICE) >= ALL (
    SELECT SUM(PRICE)
    FROM Sales
    GROUP BY seller_id
)
