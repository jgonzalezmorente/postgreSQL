create or replace procedure controlled_raise (percentage NUMERIC) as
$$
declare
	real_percentage NUMERIC(8, 2);
	total_employees INT;
begin
	real_percentage = percentage / 100;
	
	-- Mantener el histórico
	insert into raise_history(date, employee_id, base_salary, amount, percentage)
	select current_date as "date",
		   employee_id,
		   salary,
		   max_raise(employee_id) * real_percentage as amount,
		   percentage
	from employees;

	-- Actualizar la tabla de empleados
	update employees set salary = salary + (max_raise(employee_id) * real_percentage);
	
	commit;
	
	select count(*) into total_employees from employees;
	raise notice 'Afectados % empleados', total_employees;
end;
$$ language plpgsql;

call controlled_raise(1);

select * from employees;
select * from raise_history;