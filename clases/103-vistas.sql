CREATE OR REPLACE VIEW comments_per_week AS
SELECT
	sum(
		claps.counter) AS total_claps,
	count(*) as number_of_claps,
	date_trunc(
		'week', posts.created_at) AS weeks,
	count(
		DISTINCT posts.post_id) AS number_of_posts
FROM
	posts
	INNER JOIN claps ON claps.post_id = posts.post_id
GROUP BY
	weeks
ORDER BY
	weeks DESC;

select * from claps where post_id = 1;

DROP VIEW comments_per_week;
select * from comments_per_week;