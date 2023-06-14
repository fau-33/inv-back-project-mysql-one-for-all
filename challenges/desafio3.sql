SELECT
    users.user_name AS pessoa_usuaria,
    COUNT(listened_history.song_id) AS musicas_ouvidas,
    ROUND(SUM(songs.song_duration / 60), 2) AS total_minutos
FROM
    users
    LEFT JOIN listened_history ON users.user_id = listened_history.user_id
    LEFT JOIN songs ON listened_history.song_id = songs.song_id
GROUP BY
    users.user_name
ORDER BY
    users.user_name;
