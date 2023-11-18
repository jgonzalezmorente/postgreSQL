select code, name, '123' from continent where name like '%America%'
union
select 1, 'otra cosa', name from continent where code in (3,5)
order by name asc;