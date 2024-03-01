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

    dynsql2 = 'select * from crosstab (
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


SELECT pivotcode();







DO
$$
    DECLARE
        row        record;
        query_text TEXT;
        dynsql1    varchar;
        columnlist varchar;
    BEGIN
        dynsql1 = 'select string_agg(distinct grantee||'' '',''	|  '' order by grantee ||'' '') from information_schema.role_table_grants rg
         JOIN pg_tables pt ON rg.table_schema = pt.schemaname AND rg.table_name = pt.tablename;';
        execute dynsql1 into columnlist;

        SELECT pivotcode() INTO query_text;
        RAISE INFO 'grantor	| %' , columnlist;
        FOR row IN
            EXECUTE query_text
            LOOP
                DECLARE
                    result text;
                BEGIN
                    result = row::text;
                    result = REPLACE(result, ',', '	|	');
                    result = REPLACE(result, '(' , '');
                    result = REPLACE(result, ')' , '');
                    RAISE INFO '%',result ;
                END;
            END LOOP;
    END
$$;


