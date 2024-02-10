create or replace procedure get_tables(from_user text, to_user text)
as $$
DECLARE
    row     record;
    table_num int := 1;
    name_of_table text;
BEGIN
    RAISE INFO 'Текущий пользователь: %', from_user;
    RAISE INFO 'Кому выдаём права доступа: %', to_user;
    RAISE INFO 'No.  Имя таблицы';
    RAISE INFO '---  -------------------------------';

    FOR row IN 
        SELECT DISTINCT table_name as name_of_table
        FROM information_schema.role_table_grants rg
        JOIN pg_tables pt ON rg.table_schema = pt.schemaname AND rg.table_name = pt.tablename
        WHERE grantor = from_user and is_grantable = 'YES'
        LOOP
        	RAISE INFO '% %', table_num, row.name_of_table;
        	table_num := table_num + 1;
    	END LOOP;
END; $$
LANGUAGE 'plpgsql';