WITH RECURSIVE counter (val) AS (
	VALUES(1)
	UNION
	SELECT val + 1 FROM counter WHERE val < 10
)
SELECT * FROM counter;