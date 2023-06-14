SELECT
    users.user_name AS pessoa_usuaria,
    CASE
        WHEN MAX(listened_history.listened_history_date) >= '2021-01-01' THEN 'Ativa'
        ELSE 'Inativa'
    END AS status_pessoa_usuaria
FROM
    users
    LEFT JOIN listened_history ON users.user_id = listened_history.user_id
GROUP BY
    users.user_name
ORDER BY
    users.user_name;
