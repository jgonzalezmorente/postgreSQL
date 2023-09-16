SELECT
	*
FROM
	country;

SELECT
	a.name,
	a.continent,
	(
		SELECT
			"code"
		FROM
			continent b
		WHERE
			b.name = a.continent)
	FROM
		country a;


UPDATE
	country a
SET
	continent = (
		SELECT
			"code"
		FROM
			continent b
		WHERE
			b.name = a.continent);