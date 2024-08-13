select greet_employee('Fernando');
select first_name, greet_employee(first_name) from employees;

create or replace function greet_employee(employee_name VARCHAR)
returns VARCHAR
as $$
BEGIN
	RETURN 'Hola ' || employee_name;
END;
$$
LANGUAGE plpgsql;