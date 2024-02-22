\echo 'Введите текущего пользователя: '
\prompt '' current_user_name

select set_config('s336760.current_user',  :'current_user_name', false);

\echo 'Введите имя пользователя, кому нужно выдать права доступа: '
\prompt 'Введите имя пользователя, кому нужно выдать права доступа: ' target_user_name

select set_config('s336760.target_user',  :'target_user_name', false);


DO $$
DECLARE
    row     record;
    from_user text = current_setting('s336760.current_user');
    to_user text = current_setting('s336760.target_user');
    table_num int := 1;
    name_of_table text;
    from_user_exists int;
    to_user_exists int;
BEGIN
     SELECT COUNT(usename)
     FROM pg_user 
     WHERE usename = from_user INTO from_user_exists;
     
     SELECT COUNT(usename)
     FROM pg_user 
     WHERE usename = to_user INTO to_user_exists;
    
    IF from_user_exists < 1  THEN
        RAISE INFO 'Пользователь % на выдачу прав не найден', from_user;
    END IF;
    
    IF to_user_exists < 1 THEN
        RAISE INFO 'Пользователь % на получение прав не найден', to_user;
	RETURN;
    END IF;

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
END $$;
