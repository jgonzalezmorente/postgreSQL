SELECT
	a.name AS country,
	b.name AS continent
FROM
	country AS a,
	continent b
WHERE
	a.continent = b.code
ORDER BY
	b.name ASC;


SELECT
	a.name AS country,
	b.name AS continent
FROM
	country a
	INNER JOIN continent b ON a.continent = b.code
ORDER BY
	b.name ASC;



select followers.id, 
	   followers.leader_id, 
	   user_lead.name as leader_name, 
	   followers.follower_id,  
	   user_follow.name as follower_name 
from followers inner join user user_lead on followers.leader_id = user_lead.id
               inner join user user_follow on followers.follower_id = user_follow.id;	