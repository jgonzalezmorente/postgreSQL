-- Count Union - Tarea
-- Total |  Continent
-- 5	  | Antarctica
-- 28	  | Oceania
-- 46	  | Europe
-- 51	  | America
-- 51	  | Asia
-- 58	  | Africa

SELECT
	COUNT(*) AS total,
	a.name AS continent
FROM
	continent AS a
	INNER JOIN country AS b ON a.code = b.continent
WHERE
	a.name NOT LIKE '%America%'
GROUP BY
	a.name
UNION
SELECT
	COUNT(*) AS total,
	'America' AS continent
FROM
	continent AS a
	INNER JOIN country AS b ON a.code = b.continent
WHERE
	a.name LIKE '%America%'
ORDER BY
	total ASC;