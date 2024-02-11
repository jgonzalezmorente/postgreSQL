CREATE SEQUENCE user_sequence;
DROP SEQUENCE user_sequence;

SELECT
	currval('user_sequence'), nextval('user_sequence'), currval('user_sequence');


CREATE TABLE users6 (
	"user_id" integer PRIMARY KEY DEFAULT nextval('user_sequence'),
	"username" VARCHAR
);
