CREATE TABLE "users" (
	"user_id" serial PRIMARY KEY,
	"username" varchar
);

CREATE TABLE "users2" (
	"user_id" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
	"username" varchar
);
	
CREATE TABLE "users3" (
	"user_id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	"username" varchar
);	

CREATE TABLE "users4" (
	"user_id" INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 100 INCREMENT BY 2
) PRIMARY KEY,
	"username" varchar
);
