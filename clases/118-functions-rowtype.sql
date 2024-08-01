CREATE OR REPLACE FUNCTION max_raise2 (empl_id int) 
RETURNS NUMERIC(8, 2) as $$
DECLARE
	selected_employee employees%rowtype;
	selected_job jobs%rowtype;	
	possible_raise NUMERIC(8, 2);
BEGIN
	SELECT * FROM employees INTO selected_employee 
	WHERE employee_id = empl_id;

	SELECT * FROM jobs INTO selected_job 
	WHERE job_id = selected_employee.job_id;

	possible_raise = selected_job.max_salary - selected_employee.salary;
	IF (possible_raise < 0) THEN
		-- possible_raise = 0;
		RAISE EXCEPTION 'Persona con salario mayor max_salary (id: %, first_name: %)', selected_employee.employee_id, selected_employee.first_name;
	END IF;
	RETURN possible_raise; 
END;
$$ LANGUAGE plpgsql;


SELECT employee_id, 
	   first_name, 
	   salary,
	   max_raise2(employee_id) FROM employees;