select current_date as "date",
	   salary,
	   max_raise(employee_id),
	   max_raise(employee_id) * 0.05 as amount,
	   5 as percentage
from employees;	 	
