SELECT
	a.name AS country,
	a.continent AS continentCode,
	b.name AS continentName
FROM
	country a
	RIGHT JOIN continent b ON a.continent = b.code
WHERE
	a.name IS NULL;