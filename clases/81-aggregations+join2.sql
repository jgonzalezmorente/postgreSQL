SELECT
	a.name AS pais,
	count(*) AS ciudades
FROM
	country AS a
	INNER JOIN city AS b ON a.code = b.countrycode
GROUP BY
	a.name
UNION
SELECT
	a.name AS pais,
	0 AS ciudades
FROM
	country AS a
	LEFT JOIN city AS b ON a.code = b.countrycode
WHERE
	b.countrycode IS NULL
ORDER BY
	ciudades DESC
LIMIT 1;