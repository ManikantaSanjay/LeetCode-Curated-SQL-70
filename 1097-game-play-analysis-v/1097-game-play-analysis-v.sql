# Write your MySQL query statement below
WITH first_logins AS (
  SELECT
    A.player_id,
    MIN(A.event_date) AS first_login
  FROM
    Activity A
  GROUP BY
    A.player_id
),

consec_login_info AS (
  SELECT
    F.player_id,
    (CASE
      WHEN A.player_id IS NULL THEN 0
      ELSE 1
    END) AS logged_in_consecutively,
    F.first_login
  FROM
    first_logins F
    LEFT JOIN Activity A ON F.player_id = A.player_id
    AND F.first_login = DATE_SUB(A.event_date, INTERVAL 1 DAY)
)


SELECT
  C.first_login AS install_dt,
  COUNT(C.player_id) AS installs,
  ROUND(
    SUM(C.logged_in_consecutively)
    / COUNT(C.player_id)
  , 2) AS Day1_Retention
FROM
  consec_login_info C
GROUP BY
  C.first_login;