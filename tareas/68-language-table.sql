-- Tarea con countryLanguage

-- Crear secuencia
CREATE SEQUENCE IF NOT EXISTS language_code_seq;

-- Crear la tabla de language
CREATE TABLE "public"."language" (
	"code" int4 NOT NULL DEFAULT nextval('language_code_seq'::regclass),
	"name" text NOT NULL,
	PRIMARY KEY ("code")
);

-- Crear una columna en countrylanguage
ALTER TABLE countrylanguage
ADD COLUMN languagecode varchar(3);


-- Empezar con el select para confirmar lo que vamos a actualizar
SELECT DISTINCT
	"language"
FROM
	countrylanguage
ORDER BY
	"language" ASC;

-- Actualizar todos los registros
ALTER TABLE countrylanguage DROP CONSTRAINT "fk_languagecode";

TRUNCATE TABLE "language";

INSERT INTO "language" (name)
SELECT DISTINCT
	"language"
FROM
	countrylanguage
ORDER BY
	"language" ASC;


SELECT
	a.language,
	(
		SELECT
			b.code
		FROM
			LANGUAGE b
		WHERE
			b.name = a.language)
	FROM
		countrylanguage a;


UPDATE
	countrylanguage a
SET
	languagecode = (
		SELECT
			b.code
		FROM
			"language" b
		WHERE
			b.name = a.language);


-- Cambiar tipo de dato en countrylanguage - languagecode por int4
ALTER TABLE countrylanguage ALTER COLUMN languagecode TYPE int4
USING languagecode::integer;

-- Crear el forening key y constraints de no nulo el language_code
ALTER TABLE countrylanguage
	ADD CONSTRAINT fk_languagecode FOREIGN KEY (languagecode) REFERENCES LANGUAGE (code);

ALTER TABLE countrylanguage
	ADD CHECK (languagecode IS NOT NULL);

-- Revisar lo creado
SELECT
	*
FROM
	countrylanguage;