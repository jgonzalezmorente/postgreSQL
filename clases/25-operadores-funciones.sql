SELECT
	id,
	upper(name) AS upper_name,
	lower(name) AS lower_name,
	length(name) AS length,
	(20 * 2) AS consante,
	'*' || id || '-' || name || '*' as barcode,
	concat( id, '-' , name, '*' ),
	name
FROM
	users;