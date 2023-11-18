SELECT
	*
FROM
	continent;

INSERT INTO continent (name)
		values('North Asia');

ALTER SEQUENCE continent_code_seq
	RESTART WITH 9;