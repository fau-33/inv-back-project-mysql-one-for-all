SELECT
    (SELECT COUNT(*) FROM cancoes) AS cancoes,
    (SELECT COUNT(DISTINCT artista_id) FROM cancoes) AS artistas,
    (SELECT COUNT(DISTINCT album_id) FROM cancoes) AS albuns;
FROM
    cancoes;
