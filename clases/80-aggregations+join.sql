SELECT
	count(*) AS count,
	b.name AS continent
FROM
	country AS a
	INNER JOIN continent AS b ON a.continent = b.code
GROUP BY
	b.name
UNION
SELECT
	0 AS count,
	b.name AS continent
FROM
	country AS a
	RIGHT JOIN continent AS b ON a.continent = b.code
WHERE
	a.continent IS NULL
GROUP BY
	b.name
ORDER BY
	count;