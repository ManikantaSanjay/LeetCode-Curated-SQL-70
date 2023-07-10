# Write your MySQL query statement below
WITH RECURSIVE date_range AS (
  SELECT product_id, period_start AS sales_date, period_end, average_daily_sales
  FROM Sales
  UNION ALL
  SELECT product_id, sales_date + INTERVAL 1 DAY, period_end, average_daily_sales
  FROM date_range
  WHERE sales_date < period_end
)

SELECT
  p.product_id,
  p.product_name,
  CAST(YEAR(d.sales_date) AS CHAR) AS report_year,
  SUM(d.average_daily_sales) AS total_amount
FROM date_range AS d
JOIN Product AS p ON p.product_id = d.product_id
GROUP BY p.product_id, p.product_name, report_year
ORDER BY p.product_id, report_year;

