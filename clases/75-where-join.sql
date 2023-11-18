SELECT
	a.name AS country,
	b.name AS continent
FROM
	country AS a,
	continent b
WHERE
	a.continent = b.code
ORDER BY
	b.name ASC;