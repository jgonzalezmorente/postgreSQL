SELECT
	hire_date,
	MAKE_INTERVAL (YEARS := 2023 - EXTRACT(YEARS FROM hire_date)::integer) AS manual,
	MAKE_INTERVAL (YEARS := date_part('years', CURRENT_DATE)::integer - EXTRACT(YEARS FROM hire_date)::integer) AS computed
FROM
	employees
ORDER BY
	hire_date DESC;


SELECT
	hire_date,
	hire_date + INTERVAL '23 years'
FROM
	employees;


UPDATE
	employees
SET
	hire_date = (hire_date + INTERVAL '23 year')::date;
