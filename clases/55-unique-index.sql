SELECT
	*
FROM
	city
WHERE
	name = 'Jinzhou'
	AND countrycode = 'CHN';

UPDATE
	city
SET
	name = 'Jinzhou 2'
WHERE
	id = 2238;

CREATE UNIQUE INDEX "unique_name_countrycode_district" ON city (name, countrycode, district);


CREATE INDEX "index_district" ON city (district);