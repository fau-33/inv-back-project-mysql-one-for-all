SELECT
    COUNT(DISTINCT songs.song_id) AS cancoes,
    COUNT(DISTINCT artists.artist_id) AS artistas,
    COUNT(DISTINCT albums.album_id) AS albuns
FROM
    songs
    INNER JOIN albums ON songs.album_id = albums.album_id
    INNER JOIN artists ON albums.artist_id = artists.artist_id;
