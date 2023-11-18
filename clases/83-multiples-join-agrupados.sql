-- Quiero saber los idiomas oficiales que se hablan por continente
SELECT DISTINCT
	a."language",
	c.name AS continent
FROM
	countrylanguage AS a
	INNER JOIN country AS b ON a.countrycode = b.code
	INNER JOIN continent AS c ON b.continent = c.code
WHERE
	a.isofficial = TRUE;


-- ¿Cuántos idiomas se hablan por continente?
SELECT
	count(*),
	continent
FROM ( SELECT DISTINCT
		a. "language",
		c.name AS continent
	FROM
		countrylanguage AS a
		INNER JOIN country AS b ON a.countrycode = b.code
		INNER JOIN continent AS c ON b.continent = c.code
	WHERE
		a.isofficial = TRUE) AS totales
GROUP BY
	continent;