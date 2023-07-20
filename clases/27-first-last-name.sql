SELECT
	*
FROM
	users;

SELECT
	name,
--	SUBSTRING(name, 0, 5),
--	POSITION(' ' IN name),
	SUBSTRING(name, 0, position(' ' IN name)) AS first_name,
	SUBSTRING(name, position(' ' IN name) + 1) AS last_name
--	TRIM(SUBSTRING(name, position(' ' IN name))) AS trimmed_last_name
FROM
	users;


UPDATE
	users
SET
	first_name = SUBSTRING(name, 0, position(' ' IN name)),
	last_name = SUBSTRING(name, position(' ' IN name) + 1);		


SELECT
	*
FROM
	users;