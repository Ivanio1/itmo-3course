-- ¬ывести сводную таблицу пользователей. Ќа пересечении должно быть количество таблиц, на которые выданы права

create or replace function pivotcode() returns varchar
    language plpgsql as
$$
declare
    dynsql1    varchar;
    dynsql2    varchar;
    columnlist varchar;
begin
    dynsql1 = 'select string_agg(distinct ''''||grantee||'' integer '','','' order by ''''|| grantee ||'' integer '') from information_schema.role_table_grants rg
         JOIN pg_tables pt ON rg.table_schema = pt.schemaname AND rg.table_name = pt.tablename;';
    execute dynsql1 into columnlist;

    dynsql2 = 'CREATE TEMPORARY TABLE temp_pivot AS select * from crosstab (
 ''select DISTINCT grantor,grantee,count(DISTINCT table_name) as num_of_tables from information_schema.role_table_grants rg
         JOIN pg_tables pt ON rg.table_schema = pt.schemaname AND rg.table_name = pt.tablename group by 1,2 order by 1,2'',
 ''select distinct grantee from information_schema.role_table_grants rg
         JOIN pg_tables pt ON rg.table_schema = pt.schemaname AND rg.table_name = pt.tablename order by 1''
 )
 as newtable (
 grantor name,' || columnlist || '
 );';
    return dynsql2;
end
$$;


DO
$$
    DECLARE
        query_text TEXT;
    BEGIN
        DROP TABLE IF EXISTS temp_pivot;
        SELECT pivotcode() INTO query_text;
        EXECUTE query_text;
    END
$$;

SELECT * FROM temp_pivot;