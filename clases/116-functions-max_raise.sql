SELECT
	employee_id,
	first_name,
	last_name,
	salary,
	max_salary,
	max_salary - salary AS possible_raise
FROM
	employees
	INNER JOIN jobs ON jobs.job_id = employees.job_id;


SELECT max_raise(206);


SELECT employee_id, first_name, max_raise(employee_id) from employees;


CREATE OR REPLACE FUNCTION max_raise (empl_id int) 
RETURNS NUMERIC(8, 2) as $$
DECLARE	
	possible_raise NUMERIC(8, 2);
BEGIN

	SELECT
		max_salary - salary INTO possible_raise
	FROM
		employees
		INNER JOIN jobs ON jobs.job_id = employees.job_id
		WHERE employee_id = empl_id;
	
	RETURN possible_raise;
END;
$$ LANGUAGE plpgsql;