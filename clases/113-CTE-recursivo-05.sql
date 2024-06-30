WITH RECURSIVE bosses as (
	
	select id, name, report_to, 1 as depth from employees where id = 1
	
	union
	
	select employees.id, employees.name, employees.report_to, depth + 1 from employees
		inner join bosses on bosses.id = employees.report_to
	where depth < 10
	
)
select bosses.*, employees.name as report_to_name from bosses 
	left join employees on employees.id = bosses.report_to
	order by depth;