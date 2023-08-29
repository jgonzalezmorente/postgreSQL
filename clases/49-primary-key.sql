SELECT
	*
FROM
	country;

ALTER TABLE country
	ADD PRIMARY KEY (code);

SELECT
	count(*) AS total,
	code
FROM
	country
GROUP BY
	code
HAVING
	count(*) > 1;

SELECT
	*
FROM
	country
WHERE
	code = 'NLD';

DELETE FROM country
WHERE code = 'NLD'
	AND code2 = 'NA';