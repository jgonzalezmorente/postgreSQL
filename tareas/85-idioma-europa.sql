-- ¿Cuál es el idioma (y código del idioma) oficial más hablado por diferentes países en Europa?

SELECT
	a.language,
	a.languagecode,
	count(*)
FROM
	countrylanguage AS a
	INNER JOIN country AS b ON a.countrycode = b.code
WHERE
	a.isofficial = TRUE
	AND b.continent = 5
GROUP BY
	a.language,
	a.languagecode
ORDER BY
	count(*)
	DESC
LIMIT 1;

-- Listado de todos los países cuyo idioma oficial es el más hablado de Europa
-- (no hacer subquery, tomar el código anterior)

SELECT
	*
FROM
	country AS a
	INNER JOIN countrylanguage AS b ON a.code = b.countrycode
WHERE
	a.continent = 5
	AND b.isofficial = TRUE
	AND b.languagecode = 135;


SELECT
	languagecode
FROM (
	SELECT
		a.language,
		a.languagecode,
		count(*)
	FROM
		countrylanguage AS a
		INNER JOIN country AS b ON a.countrycode = b.code
	WHERE
		a.isofficial = TRUE
		AND b.continent = 5
	GROUP BY
		a.language,
		a.languagecode
	ORDER BY
		count(*)
		DESC
	LIMIT 1) AS subquery;