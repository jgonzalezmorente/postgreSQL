WITH RECURSIVE multiplication_table(base, val, result) as (
	-- init
		-- select 5 as base, 1 as val, 5 * 1 as result
		values(5, 1, 5)
		
	UNION
	-- paso recursivo
		select 5 as base, val + 1, (val + 1) * base from multiplication_table
		 where val < 10
)
select * from multiplication_table;

WITH RECURSIVE multiplication_table(base, val, result) as (
	-- init
		-- select 5 as base, 1 as val, 5 * 1 as result
		values(5, 1, 5)
		
	UNION
	-- paso recursivo
		select 5 as base, val + 1, (val + 1) * base from multiplication_table
		 where val < 10
)
select * from multiplication_table;