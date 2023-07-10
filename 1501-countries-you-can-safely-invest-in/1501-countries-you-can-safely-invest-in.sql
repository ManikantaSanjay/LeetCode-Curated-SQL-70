-- Subquery to calculate average call durations for each country and overall
WITH country_duration AS (
    SELECT 
        c.name AS country, 
        ca.duration,
        AVG(ca.duration) OVER (PARTITION BY c.name) AS avg_duration,  -- Calculate average call duration per country
        AVG(ca.duration) OVER () AS avg_total  -- Calculate overall average call duration
    FROM 
        calls ca 
    JOIN 
        person p ON (ca.caller_id = p.id) OR (ca.callee_id = p.id)  -- Join on caller and callee
    JOIN 
        country c ON SUBSTRING(p.phone_number, 1, 3) = c.country_code  -- Extract country code from phone number and join
)

-- Main query to get countries with higher than average call duration
SELECT DISTINCT 
    country
FROM 
    country_duration
WHERE 
    avg_duration > avg_total;  -- Select only countries where average duration is higher than overall average
