SELECT
    artists.artist_name AS artista,
    albums.album_name AS album
FROM artists
JOIN albums ON artists.artist_id = albums.artist_id
WHERE artists.artist_name = 'Elis Regina'
ORDER BY albums.album_name;
