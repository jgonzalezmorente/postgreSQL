select 5;
-- Nombre de la tabla en memoria
-- Campos que vamos a tener
WITH RECURSIVE countdown(val) as (
	-- Inicialización => el primer nivel, o valores iniciales
	--- values(5)
	select 5 as val
	UNION
	-- Query recursivo
	select val - 1 from countdown where val > 1
)
-- Select de los campos
select * from countdown;