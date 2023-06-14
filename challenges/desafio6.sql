SELECT
    ROUND(MIN(pt.plans_value), 2) AS faturamento_minimo,
    ROUND(MAX(pt.plans_value), 2) AS faturamento_maximo,
    ROUND(AVG(pt.plans_value), 2) AS faturamento_medio,
    ROUND(SUM(pt.plans_value), 2) AS faturamento_total
FROM users AS u
JOIN plans_types AS pt ON u.plans_id = pt.plans_id;
