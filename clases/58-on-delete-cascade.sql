DELETE FROM country
WHERE CODE = 'AFG';

SELECT
	*
FROM
	country
WHERE
	code = 'AFG';

SELECT
	*
FROM
	city
WHERE
	countrycode = 'AFG';

SELECT
	*
FROM
	countrylanguage
WHERE
	countrycode = 'AFG';