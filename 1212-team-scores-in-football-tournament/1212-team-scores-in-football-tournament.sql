SELECT team_id, team_name, COALESCE(SUM(num_points), 0) as num_points
FROM (
  SELECT t.team_id, t.team_name,
  CASE
    WHEN host_goals > guest_goals THEN 3
    WHEN host_goals = guest_goals THEN 1
    ELSE 0
  END AS num_points
  FROM Teams t LEFT JOIN Matches m ON t.team_id = m.host_team
    
  UNION ALL
    
  SELECT t.team_id, t.team_name,
  CASE
    WHEN guest_goals > host_goals THEN 3
    WHEN guest_goals = host_goals THEN 1
    ELSE 0
  END AS num_points
  FROM Teams t LEFT JOIN Matches m ON t.team_id = m.guest_team
) as all_matches
GROUP BY team_id, team_name
ORDER BY num_points DESC, team_id ASC;
