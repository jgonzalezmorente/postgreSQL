SELECT
	a.name AS country,
	count(*) AS total
FROM
	country AS a
	INNER JOIN city AS b ON a.code = b.countrycode
GROUP BY
	a.name
ORDER BY
	total DESC
LIMIT 1;