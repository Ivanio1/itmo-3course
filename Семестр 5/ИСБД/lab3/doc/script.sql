--1
select Н_ЛЮДИ.ФАМИЛИЯ, Н_ВЕДОМОСТИ.ЧЛВК_ИД
from Н_ЛЮДИ
         left join Н_ВЕДОМОСТИ
                    on Н_ВЕДОМОСТИ.ЧЛВК_ИД = Н_ЛЮДИ.ИД
where Н_ЛЮДИ.ОТЧЕСТВО > 'Сергеевич' and Н_ВЕДОМОСТИ.ИД = 1250972;

--2
select Н_ЛЮДИ.ИД, Н_ОБУЧЕНИЯ.НЗК, Н_УЧЕНИКИ.ГРУППА
from Н_ЛЮДИ
         left join Н_ОБУЧЕНИЯ
                    on Н_ОБУЧЕНИЯ.ЧЛВК_ИД = Н_ЛЮДИ.ИД
         left join Н_УЧЕНИКИ
                    on Н_УЧЕНИКИ.ЧЛВК_ИД = Н_ЛЮДИ.ИД
where Н_ЛЮДИ.ИД > 163484
  and Н_ОБУЧЕНИЯ.ЧЛВК_ИД < 163484
  and Н_УЧЕНИКИ.НАЧАЛО > '2008-09-01'::timestamp;

--3
with уникальные_отчества as (
    select "ОТЧЕСТВО" as уникальное_отчество
    from "Н_ЛЮДИ"
    group by "ОТЧЕСТВО"
)
select count(*) as количество_уникальных_отчеств from уникальные_отчества;

--4
SELECT g.ГРУППА FROM Н_ГРУППЫ_ПЛАНОВ as g
                         INNER JOIN Н_УЧЕНИКИ as u ON g.ГРУППА = u.ГРУППА
                         INNER JOIN Н_ПЛАНЫ as p ON g.ПЛАН_ИД = p.ИД
                         INNER JOIN Н_ОТДЕЛЫ as o ON p.ОТД_ИД = o.ИД
WHERE u."НАЧАЛО" < '01.01.2012' AND
        u."КОНЕЦ" >= '01.01.2011'
  AND o.КОРОТКОЕ_ИМЯ = 'КТиУ'
GROUP BY g.ГРУППА
HAVING COUNT(u.ИД) = 10;


--5
select ГРУППА, avg(date_part('year', age(ДАТА_РОЖДЕНИЯ))) as СРЕДНИЙ_ВОЗРАСТ
from Н_ЛЮДИ
         inner join Н_УЧЕНИКИ on Н_УЧЕНИКИ.ЧЛВК_ИД = Н_ЛЮДИ.ИД
group by ГРУППА
having avg(date_part('year', age(ДАТА_РОЖДЕНИЯ))) <
       (
           select min(date_part('year', age(ДАТА_РОЖДЕНИЯ)))
           from Н_ЛЮДИ
                    inner join Н_УЧЕНИКИ on Н_УЧЕНИКИ.ЧЛВК_ИД = Н_ЛЮДИ.ИД
           where ГРУППА = '1100'
           group by ГРУППА
       );

--6
select "Н_УЧЕНИКИ"."ГРУППА",
       "Н_ЛЮДИ"."ИД",
       "Н_ЛЮДИ"."ФАМИЛИЯ",
       "Н_ЛЮДИ"."ИМЯ",
       "Н_ЛЮДИ"."ОТЧЕСТВО",
       "Н_УЧЕНИКИ"."П_ПРКОК_ИД"
from "Н_УЧЕНИКИ"
         join "Н_ЛЮДИ" on "Н_ЛЮДИ"."ИД" = "Н_УЧЕНИКИ"."ЧЛВК_ИД"
         join "Н_ПЛАНЫ" on "Н_УЧЕНИКИ"."ПЛАН_ИД" = "Н_ПЛАНЫ"."ИД"
         join "Н_ФОРМЫ_ОБУЧЕНИЯ" on "Н_ПЛАНЫ"."ФО_ИД" = "Н_ФОРМЫ_ОБУЧЕНИЯ"."ИД"
         join "Н_НАПРАВЛЕНИЯ_СПЕЦИАЛ" on "Н_ПЛАНЫ"."НАПС_ИД" = "Н_НАПРАВЛЕНИЯ_СПЕЦИАЛ"."ИД"
         join "Н_НАПР_СПЕЦ" on "Н_НАПРАВЛЕНИЯ_СПЕЦИАЛ"."НС_ИД" = "Н_НАПР_СПЕЦ"."ИД"
where "Н_УЧЕНИКИ"."КОНЕЦ" < '2012-09-01 00:00:00.00000'
  and "Н_ФОРМЫ_ОБУЧЕНИЯ"."НАИМЕНОВАНИЕ" = 'Заочная'
  and "Н_НАПР_СПЕЦ"."КОД_НАПРСПЕЦ" = '230101';


--7
select *
from "Н_УЧЕНИКИ"
         join "Н_ЛЮДИ" on "Н_ЛЮДИ"."ИД" = "Н_УЧЕНИКИ"."ЧЛВК_ИД"
where "ЧЛВК_ИД" in (select "ИД"
                    from "Н_ЛЮДИ"
                    where "ОТЧЕСТВО" in (select "ОТЧЕСТВО" from "Н_ЛЮДИ" group by "ОТЧЕСТВО" having count("ОТЧЕСТВО") > 1)
                      and "ИД" in (select "ИД" from "Н_ЛЮДИ" group by "ИД" having count("ИД") = 1));