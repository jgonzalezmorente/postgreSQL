SELECT
	count(*) AS total,
	country
FROM
	users
GROUP BY
	country
HAVING
	count(*) BETWEEN 1 AND 5
ORDER BY
	count(*)
	DESC;