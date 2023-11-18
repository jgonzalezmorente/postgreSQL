SELECT
	a.name AS country,
	a.continent AS continentCode,
	b.name AS continentName
FROM
	country a
	FULL OUTER JOIN continent b ON a.continent = b.code
ORDER BY
	country DESC;
