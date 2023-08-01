SELECT
	sum(total)
FROM (
	SELECT
		count(*) AS total,
		SUBSTRING(email, position('@' IN email) + 1) AS DOMAIN,
		'Fernando' AS name,
		37 AS age
	FROM
		users
	GROUP BY
		DOMAIN
	HAVING
		count(*) > 1
	ORDER BY
		DOMAIN ASC) AS email_domains;
