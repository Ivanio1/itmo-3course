create table second(id serial primary key , first_name varchar(255), second_name varchar(255));

create table first(id serial primary key , name integer, value varchar(255));

begin;
insert into second(first_name, second_name) values ('aaa','bbb'), ('ccc','ddd');
commit;

begin;
insert into first(name, value) values (4,'test2');
commit;


select pid, usename, application_name, client_addr, backend_start,state, query FROM pg_stat_activity WHERE state = 'active';