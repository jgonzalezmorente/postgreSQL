-- 1. ¿Cuántos Post hay?
SELECT
	count(post_id)
FROM
	posts;

-- 2. ¿Cuántos Post publicados hay?
SELECT
	count(post_id)
FROM
	posts
WHERE
	published = TRUE;

-- 3. ¿Cuál es el Post más reciente?
SELECT
	*
FROM
	posts
ORDER BY
	created_at DESC
LIMIT 1;

-- 4. Obtener los 10 usuarios con más post, cantidad de posts, id y nombre
SELECT
	count(a.post_id) AS post,
	a.created_by AS user_id,
	b.name AS name
FROM
	posts AS a
	INNER JOIN users AS b ON a.created_by = b.user_id
GROUP BY
	a.created_by,
	b.name
ORDER BY
	post DESC
LIMIT 10;

-- 5. Obtener los 5 post con más "Claps" sumando la columna "counter"
SELECT
	sum(a.counter) AS claps,
	b.title AS post
FROM
	claps AS a
	INNER JOIN posts AS b ON a.post_id = b.post_id
GROUP BY
	b.title
ORDER BY
	claps DESC
LIMIT 5;

-- 6. Obtener el top 5 de personas que han dado más claps (voto único no acumulado)
SELECT
	count(a.clap_id) AS claps,
	b.name
FROM
	claps AS a
	INNER JOIN users AS b ON a.user_id = b.user_id
GROUP BY
	b.name
ORDER BY
	claps DESC
LIMIT 5;

-- 7. Obtener el top 5 de personas con votos acumulados
SELECT
	sum(a.counter) AS claps,
	b.name
FROM
	claps AS a
	INNER JOIN users AS b ON a.user_id = b.user_id
GROUP BY
	b.name
ORDER BY
	claps DESC
LIMIT 5;

-- 8. Obtener cuantos usuarios NO tienen listas de favoritos creada
SELECT
	count(a.user_id)
FROM
	users AS a
	LEFT JOIN user_lists AS b ON a.user_id = b.user_id
WHERE
	b.user_list_id IS NULL;

-- 9. Obtener el comentario con id #1, y en el mismo resultado, las respuestas (visibles e invisibles)
SELECT
	*
FROM
	comments
WHERE
	comment_id = 1
	OR comment_parent_id = 1;

SELECT
	*
FROM
	comments
WHERE
	comment_id = 1
UNION
SELECT
	*
FROM
	comments
WHERE
	comment_parent_id = 1;

-- 10. Crear una única linea de respuesta, con las respuestas del comentario con id 1 (comment_parent_id = 1). Mostrar el user_id y el contenido del comentario
SELECT
	json_agg(t)
FROM (
	SELECT
		user_id,
		content
	FROM
		comments
	WHERE
		comment_parent_id = 1) AS t;

SELECT
	json_agg(json_build_object('user', user_id, 'content', content))
FROM
	comments
WHERE
	comment_parent_id = 1;

-- 11. Listar todos los comentarios principales y crear una columna adicional "replies" con las respuestas en formato JSON
SELECT
	a.user_id,
	a.comment_id,
	a.content,
	json_agg(json_build_object('user', b.user_id, 'content', b.content)) AS replies
FROM
	comments AS a
	LEFT JOIN comments AS b ON b.comment_parent_id = a.comment_id
WHERE
	a.comment_parent_id IS NULL
GROUP BY
	a.user_id,
	a.comment_id,
	a.content;


SELECT
	a.*,
	(
		SELECT
			json_agg(json_build_object('user', b.user_id, 'content', b.content))
		FROM
			comments AS b
		WHERE
			b.comment_parent_id = a.comment_id) as replies
	FROM
		comments AS a
	WHERE
		comment_parent_id IS NULL;


CREATE OR REPLACE FUNCTION comment_replace( id integer )
RETURNS json
AS 
$$
DECLARE result json;
BEGIN
	SELECT
		json_agg(json_build_object(
			'user', user_id, 
			'comment', content
		)) INTO result
	FROM
		comments
	WHERE
		comment_parent_id = id;
	
	RETURN result;
END;
$$
LANGUAGE plpgsql;

select comment_replace(4);

SELECT
	a.*,
	comment_replace(a.comment_id)
	FROM
		comments AS a
	WHERE
		comment_parent_id IS NULL;



