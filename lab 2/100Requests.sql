-- Лабораторна робота № 2
-- Студентки групи МІТ-31 Кульчицького Дмитра Олександровича

-- 1 вибрати з таблиці, де колонка notNull
SELECT * from participant
where not some_column ISnull;

-- 2 виставити в колонку значення 1,, де айді більше 105
update participant set some_column=1
where id>'105'

-- 3 вибрати всі колонки з таблиці
SELECT * FROM competition

-- 4 підрахувати кількість записів в колонці з таблиці
select count(name) from participant;

-- 5 вибрати з таблиці де айді 1
SELECT * FROM place
WHERE id=1;

-- 6 вибрати колонки з таблиці
SELECT day, name ,id
FROM competition;

-- 7 вивести айді в колонці з назвою Учасник та вивести фулл нейм  де конкатинацією  виведеться ім"я
SELECT id as "Учасник", concat(name, ' ',surname) as "Full name"
from participant;

-- 8 вибрати найбільний день з таблиці
select max(day) from competition;

-- 9 підрахувати кількість записів в колонці
select count(name) from participant;

-- 10 вибрати унікальні значення з стовпця таблиці
select distinct country_id from place;

-- 11 вивести кількість унікальних значень в таблиці під імям з таблиці
SELECT COUNT(DISTINCT country_id)
AS CountOfCountry_id
FROM place

-- 12 вивести кількість унікальних значень в таблиці з умовами
select distinct * from competition
where place_id='191' and day='2021-04-10';

-- 13 вивести всі колонки де прізвище Critzen і з імям з умови
select * from participant
where surname='Critzen' and (name='Bianca' or name='Eimile');

-- 14 записати нове значення
insert into country (id)
values('101');

-- 15 заповнити колонку значенням 3
select *, COALESCE(some_column, '3') from participant;

-- 16  вибрати з таблиці де прізвище починаеться на g
select * from participant
where surname ILike  'g%';

-- 17 вибрати з таблиці де значення між 1 і 3
select * from country
where id BETWEEN '1' and '3';

-- 18 додати стовпець типу инт
alter table participant add some_column integer;
select * from participant;

-- 19 вибрати з таблиці з умовою
select * from country
where id in (1, 10, 30);

-- 20 вибрати з таблиці з умовою де імя починається на С
select * from country
where name::varchar like 'C_____';

-- 21 вибрати з таблиці з умовою
select * from country
where name::varchar like '%C%';

-- 22 вибрати з таблиці з умовою
select * from country
where name::varchar Ilike '%c%';

-- 23 вибрати з таблиці з умовою
select * from country
where cast(name as Text) Ilike '%c%';

-- 24 вибрати з таблиці з умовою
SELECT * FRom country
where name :: text like 'C%'

-- 25 вибрати з таблиці з умовою і відсортувати
select name, surname from participant
Where name like 'A%'
Order by name asc, surname DESC;

-- 26 вибрати з таблиць
select name, result
FROM participant, result;

-- 27 вибрати з таблиць дані
select c.name, p.name
from competition as c, place as p
where c.place_id=p.id and c.day='2021-11-09';

--  28 вибрати з таблиць з умовами
select competition_id, result, participant_id from result
where result In (select result from result
where result < (select avg(result) from result))

-- 29 вибрати декілька колонок з однієї таблиці та декілька з іншої таблиці з умовою
select c.name, p.name
from competition as c
Join place as p
on c.place_id=p.id
where c.day='2021-04-24';

-- 30 зробити таблицю з інших стовпців і таблиць з умовою
create view participant1 as
select prt.id, prt.name, prt.surname, cmp.day
from competition as cmp
Join place as p
on cmp.place_id=p.id
where cmp.day BETWEEN '2021-05-25' and '2021-11-09'

-- 31 зробити таблицю з інших стовпців і таблиць з умовою
 create view best_result as
   select r.competition_id, r.participant_id
   from result r
   where r.result = '5'

-- 32 вибрати з таблиці з умовою
SELECT * FROM participant
WHERE name != 'Alysia';

-- 33 вибрати з таблиці з умовою
 select * from result
 where result < (select avg(result) from result)
SELECT TOP(3) id, name, surname
 FROM participant;

-- 34 вибрати та відсортувати
 SELECT id, name, surname
 FROM participant
 WHERE surname = 'Critzen'
 ORDER BY id;

-- 35 вибрати все, що менше 23
 SELECT * FROM participant
 LIMIT 23;

-- 36 вибрати перші 10 ROWS
SELECT * FROM participant
FETCH FIRST 10 ROWS ONLY;

-- 37 вибрати 50 відсотків від записів
SELECT TOP(50) PERCENT * FROM participant;

-- 38 вибрати перші 50 відсотків від записів
 SELECT * FROM participant
 FETCH FIRST 50 PERCENT ROWS ONLY;

-- 39  вибрати з таблиці де імя
 SELECT TOP 3 * FROM place
 WHERE name='Bellgrove';

-- 40 вибрати з таблиці не більше 3 записів
SELECT * FROM place
WhERE name='Bellgrove'
LIMIT 3;

-- 41 вибрати перші 3 записи з умовою
SELECT * FROM place
WHERE name='Bellgrove'
FETCH FIRST 3 ROWS ONLY;

-- 42 вибрати мінімальне значення
SELECT MIN(id) AS Smallest
FROM place;

-- 43 вибрати максимальне значення
SELECT MAX(id) AS Smallest
FROM place;

-- 44 вибрати середнє значення
SELECT AVG(id)
FROM place;

-- 45 сумма
SELECT SUM(id)
FROM place;

-- 46 вибрати з таблиці якщо існує
 SELECT *
 FROM competition
 WHERE EXISTS (SELECT 1 FROM place WHERE competition.place_id = place.id);

-- 47 вибрати з таблиці з умовою та обеднати
 SELECT id, name
 FROM competition
 WHERE EXISTS (SELECT 1 FROM place WHERE competition.place_id = place.id)
 UNION
 SELECT id, name
 FROM place
 WHERE name='Bellgrove';

-- 48 вибрати з таблиці з умовою та обеднати все
 SELECT id, name
 FROM competition
 WHERE EXISTS (SELECT 1 FROM place WHERE competition.place_id = place.id)
 UNION All
 SELECT id, name
 FROM place
 WHERE name='Bellgrove';

-- 49 вибрати з таблиці з умовою
SELECT id, name
FROM competition
WHERE EXISTS (SELECT 1 FROM place WHERE competition.place_id = place.id)
INTERSECT
SELECT id, name
FROM place
WHERE name='%С%';

-- 50 виведе дані які ми зєднали
select id, name || surname from participant;

-- 51 виведе дані які ми зєднали
select id, concat(name, surname) from participant;

-- 52 виведе все, що менше за 15 айді
Select * from place where id < 15

-- 53 виведе все, що більше за 15 айді
 Select * from place where id > 15

-- 54 виведе все, що менше за 15 айді та більше 5
 select id from place
 where id<15 and id>5;

-- 55 виведе щось, що відповідає умові
 select id from place
 where id<10 or id>101

-- 56 виведе все, що не дорівнює 1
 select * from place
 where NOT id = '1';

-- 57 вибере те, що підійде умові
select * from competition
where day between '1930-01-01' and '1971-01-01'

-- 58 виведе мысяць з дати
select extract (month from day) from competition;

-- 59 виведе мысяць з дати
 select extract (month from day) as "month" from competition
 where extract (month from day) in (1,2,3);

-- 60 виведе дані з умової другої букви а
 select * from competition
 where name Like '_a%';

-- 61 відсортує
 select * from place
 Order by id;

-- 62 відсортує
select * from place
Order by name desc;

-- 63 відсортує
 select * from place
 Order by name, id desc;

-- 64 вибрати з таблиць
 select name, result
 FROM participant, result;

-- 65 вибрати з таблиць дані
 select c.name, p.name
 from competition as c, place as p
 where c.place_id=p.id and c.day='2021-11-09';

--  66 вибрати з таблиць з умовами
  select competition_id, result, participant_id from result
  where result In (select result from result
  where result < (select avg(result) from result))

-- 67 вибрати декілька колонок з однієї таблиці та декілька з іншої таблиці з умовою
 select c.name, p.name
 from competition as c
 Join place as p
 on c.place_id=p.id
 where c.day='2021-04-24';

-- 68 зробити таблицю з інших стовпців і таблиць з умовою
create view participant1 as
select prt.id, prt.name, prt.surname, cmp.day
from competition as cmp
Join place as p
on cmp.place_id=p.id
where cmp.day BETWEEN '2021-05-25' and '2021-11-09'

-- 69 зробити таблицю з інших стовпців і таблиць з умовою
create view best_result as
select r.competition_id, r.participant_id
 from result r
 where r.result = '5'

-- 70 вибрати з таблиці з умовою
SELECT * FROM participant
 WHERE name != 'Alysia';

-- 71 вибрати з таблиці, де колонка Null
 SELECT * from participant
 where not some_column ISnull;

-- 72 виставити в колонку значення 1,, де айді більше 105
 update participant set some_column=1
 where id>'105'

-- 73 вибрати всі колонки з таблиці
 SELECT * FROM competition

-- 74 підрахувати кількість записів в колонці з таблиці
 select count(name) from participant;

-- 75 вибрати з таблиці де айді 1
 SELECT * FROM place
 WHERE id=1;

-- 76 вибрати колонки з таблиці
SELECT day, name ,id
FROM competition;

-- 77 вивести айді в колонці з назвою Учасник та вивести фулл нейм  де конкатинацією  виведеться ім"я
  SELECT id as "Учасник", concat(name, ' ',surname) as "Full name"
 from participant;

-- 78 вибрати найбільний день з таблиці
 select max(day) from competition;

-- 79 підрахувати кількість записів в колонці
 select count(name) from participant;

-- 80 вибрати унікальні значення з стовпця таблиці
 select distinct country_id from place;

-- 81 вивести кількість унікальних значень в таблиці під імям з таблиці
 SELECT COUNT(DISTINCT country_id)
 AS CountOfCountry_id
 FROM place

-- 82 вивести кількість унікальних значень в таблиці з умовами
 select distinct * from competition
 where place_id='191' and day='2021-04-10';

-- 83 вивести всі колонки де прізвище Critzen і з імям з умови
 select * from participant
 where surname='Critzen' and (name='Bianca' or name='Eimile');

-- 84 записати нове значення
 insert into country (id)
 values('101');

-- 85 заповнити колонку значенням 3
 select *, COALESCE(some_column, '3') from participant;

-- 86  вибрати з таблиці де прізвище починаеться на g
 select * from participant
 where surname ILike  'g%';

-- 87 вибрати з таблиці де значення між 1 і 3
 select * from country
 where id BETWEEN '1' and '3';

-- 88 додати стовпець типу инт
 alter table participant add some_column integer;
 select * from participant;

-- 89 вибрати з таблиці з умовою
 select * from country
 where id in (1, 10, 30);

-- 90 вибрати з таблиці з умовою де імя починається на С
 select * from country
 where name::varchar like 'C_____';

-- 91 вибрати з таблиці з умовою
 select * from country
 where name::varchar like '%C%';

-- 92 вибрати з таблиці з умовою
 select * from country
 where name::varchar Ilike '%c%';

-- 93 вибрати з таблиці з умовою
 select * from country
 where cast(name as Text) Ilike '%c%';

-- 94 вибрати з таблиці з умовою
 SELECT * FRom country
 where name :: text like 'C%'

-- 95 вибрати з таблиці з умовою і відсортувати
 select name, surname from participant
 Where name like 'A%'
 Order by name asc, surname DESC;

-- 96 вибрати з таблиць
 select name, result
 FROM participant, result;

-- 97 вибрати з таблиць дані
 select c.name, p.name
 from competition as c, place as p
 where c.place_id=p.id and c.day='2021-11-09';

--  98 вибрати з таблиць з умовами
  select competition_id, result, participant_id from result
  where result In (select result from result
  where result < (select avg(result) from result))

-- 99 вибрати декілька колонок з однієї таблиці та декілька з іншої таблиці з умовою
 select c.name, p.name
 from competition as c
 Join place as p
 on c.place_id=p.id
 where c.day='2021-04-24';

-- 100 зробити таблицю з інших стовпців і таблиць з умовою
create view participant1 as
select prt.id, prt.name, prt.surname, cmp.day
from competition as cmp
Join place as p
on cmp.place_id=p.id
where cmp.day BETWEEN '2021-05-25' and '2021-11-09'

--Висновки
--на цій лаб роботі я навчився використовувати різні команди для запитів