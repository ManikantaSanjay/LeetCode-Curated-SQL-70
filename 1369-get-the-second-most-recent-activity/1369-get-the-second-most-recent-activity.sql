SELECT username, activity, startDate, endDate
FROM (
  SELECT username, activity, startDate, endDate,
    RANK() OVER (PARTITION BY username ORDER BY endDate DESC) AS rn
  FROM UserActivity
) tmp
WHERE rn = 2 OR (rn = 1 AND NOT EXISTS (
    SELECT 1 FROM UserActivity
    WHERE username = tmp.username AND endDate < tmp.endDate))
;
