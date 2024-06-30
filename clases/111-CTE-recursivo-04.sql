WITH RECURSIVE bosses as (
	
	select id, name, report_to from employees where id = 1
	
	union
	
	select employees.id, employees.name, employees.report_to from employees
		inner join bosses on bosses.id = employees.report_to
	
)
select * from bosses;