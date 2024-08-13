CREATE OR REPLACE FUNCTION max_raise2 (empl_id int)
RETURNS NUMERIC(8, 2) as $$
DECLARE	
	employee_job_id INT;
	current_salary NUMERIC(8, 2);
	job_max_salary NUMERIC(8, 2);
	possible_raise NUMERIC(8, 2);
BEGIN
	SELECT job_id, salary INTO employee_job_id, current_salary 
	FROM employees WHERE employee_id = empl_id;

	SELECT max_salary INTO job_max_salary 
	FROM jobs WHERE job_id = employee_job_id;

	possible_raise = job_max_salary - current_salary;
	IF (possible_raise < 0) THEN
		-- possible_raise = 0;
		RAISE EXCEPTION 'Persona con salario mayor max_salary: %', empl_id;
	END IF;
	RETURN possible_raise; 
END;
$$ LANGUAGE plpgsql;


SELECT employee_id, 
	   first_name, 
	   salary,
	   max_raise2(employee_id) FROM employees;