SELECT
	count(*) AS total_users,
	MIN(followers) AS min_followers,
	MAX(followers) AS max_followers,
	ROUND(AVG(followers)) AS avg_followers,
	SUM(followers) / count(*) AS avg_manual
FROM
	users;

SELECT
	first_name,
	last_name,
	followers
FROM
	users
WHERE
	followers = 4
	OR followers = 4999;

SELECT
	count(*),
	followers
FROM
	users
WHERE
	followers = 4
	OR followers = 4999
GROUP BY
	followers;

SELECT
	count(*),
	followers
FROM
	users
WHERE
	followers BETWEEN 4500 AND 4999
GROUP BY
	followers
ORDER BY
	followers DESC;