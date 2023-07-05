SELECT group_id, player_id
FROM (
    SELECT p.group_id, ps.player_id, SUM(ps.score) AS score
    FROM Players p,
    (
        SELECT first_player AS player_id, first_score AS score
        FROM Matches
        UNION ALL
        SELECT second_player, second_score
        FROM Matches
    ) ps
    WHERE p.player_id = ps.player_id
    GROUP BY ps.player_id
    ORDER BY group_id, score DESC, player_id
) top_scores
GROUP BY group_id;
