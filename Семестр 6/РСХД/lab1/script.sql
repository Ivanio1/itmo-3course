DO $$
DECLARE
    row         record;
    from_user   text := current_setting('myvars.from_user', true);
    to_user     text := current_setting('myvars.to_user', true);
    table_num   int := 1;
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
        WHERE grantee = from_user
        LOOP
            RAISE INFO '% %', table_num, row.name_of_table;
            table_num := table_num + 1;
        END LOOP;
END $$
