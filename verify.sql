create or replace function verify(userid text, pswd text)
returns integer
as
$$
	declare
	verified integer;
	begin 
		select 1 into verified from users where userID = userid and
			password = pswd;
		return coalesce(verified, 0);
	end;
$$
language plpgsql;