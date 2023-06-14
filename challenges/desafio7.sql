SELECT
    a.artist_name AS artista,
    al.album_name AS album,
    COUNT(fa.user_id) AS pessoas_seguidoras
FROM artists AS a
JOIN albums AS al ON a.artist_id = al.artist_id
LEFT JOIN following_artists AS fa ON a.artist_id = fa.artist_id
GROUP BY a.artist_id, al.album_id
ORDER BY pessoas_seguidoras DESC, artista, album;
