SELECT 
	u.name AS usuario,
    COUNT(r.user_id) AS qt_de_musicas_ouvidas,
    (ROUND(SUM(s.duration_seconds) / 60, 2)) AS total_minutos
FROM 
	SpotifyClone.users AS u
		INNER JOIN
	SpotifyClone.reproduction_history AS r ON r.user_id = u.user_id
		INNER JOIN
	SpotifyClone.songs AS s ON r.song_id = s.song_id
GROUP BY u.name
ORDER BY u.name;