SELECT
    songs.song_name AS cancao,
    COUNT(listened_history.user_id) AS reproducoes
FROM
    songs
    INNER JOIN listened_history ON songs.song_id = listened_history.song_id
GROUP BY
    songs.song_id
ORDER BY
    reproducoes DESC,
    cancao ASC
LIMIT 2;
