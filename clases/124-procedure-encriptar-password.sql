select count(*) from "user" 
	where username='fernando' 
   	  and password=crypt('123456', password);

create or replace procedure user_login(user_name VARCHAR, user_password VARCHAR)
as $$
declare
	was_found BOOLEAN;
begin
	select count(*) into was_found from "user" 
		where username=user_name
	   	  and password=crypt(user_password, password);

	if (was_found = false) then
		insert into session_failed (username, "when") values(user_name, now());
		commit;
		raise exception 'Usuario o contraseña no son correctos';
	end if;

	update "user" set last_login = now() where username = user_name;
	commit;

	raise notice 'Usuario encontrado %', was_found;
	
end;
$$ language plpgsql;

call user_login('fernando', '123456 ');

select * from session_failed;