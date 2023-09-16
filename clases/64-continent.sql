CREATE TABLE continent (
	"code" serial NOT NULL PRIMARY KEY,
	"name" text NOT NULL
);

SELECT DISTINCT
	continent
FROM
	country
ORDER BY
	continent ASC;

INSERT INTO continent (name)
SELECT DISTINCT
	continent
FROM
	country
ORDER BY
	continent ASC;

SELECT * from continent;