ALTER TABLE city
	ADD CONSTRAINT fk_country_code FOREIGN KEY (countrycode) REFERENCES country (code); -- ON DELETE CASCADE

SELECT
	*
FROM
	country
WHERE
	code = 'AFG';

INSERT INTO country
		values('AFG', 'Afghanistan', 'Asia', 'Southern Asia', 652860, 1919, 40000000, 62, 69000000, NULL, 'Afghanistan', 'Totalitarian', NULL, NULL, 'AF');

SELECT
	*
FROM
	city
WHERE
	countrycode = 'AFG';