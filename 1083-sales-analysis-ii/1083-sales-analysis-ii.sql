SELECT DISTINCT s1.buyer_id
FROM Sales s1
JOIN Product p1 ON s1.product_id = p1.product_id
WHERE p1.product_name = 'S8'
AND s1.buyer_id NOT IN (
    SELECT DISTINCT s2.buyer_id
    FROM Sales s2
    JOIN Product p2 ON s2.product_id = p2.product_id
    WHERE p2.product_name = 'iPhone'
);
