create or replace function country_region()
returns table (id CHARACTER(2), name VARCHAR(40), region VARCHAR(25))
as $$
begin
	return query
	select country_id, country_name, region_name from countries
		inner join regions on countries.region_id = regions.region_id;
end;
$$ LANGUAGE plpgsql;
	
select * from country_region();