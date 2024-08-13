create or replace procedure insert_region_proc(int, varchar)
as $$
BEGIN
	insert into regions(region_id, region_name)
	values($1, $2);
	raise notice 'Variable 1: %, %', $1, $2;
--	rollback;
	commit;
END;
$$ LANGUAGE plpgsql;

call insert_region_proc(5, 'Central America');

select * from regions;
