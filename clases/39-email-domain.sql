SELECT
	count(*),
	SUBSTRING(email, position('@' IN email) + 1) AS DOMAIN,
    'Fernando' as name,
    37 as age
FROM
	users
GROUP BY
	DOMAIN
HAVING
	count(*) > 1
ORDER BY
	DOMAIN ASC;