--схема БД: https://docs.google.com/document/d/1NVORWgdwlKepKq_b8SPRaSpraltxoMg2SIusTEN6mEQ/edit?usp=sharing
--colab/jupyter: https://colab.research.google.com/drive/1j4XdGIU__NYPVpv74vQa9HUOAkxsgUez?usp=sharing

-- Задание 1: Вывести name, class по кораблям, выпущенным после 1920

select *
FROM ships 
where launched >= '1920'

-- Задание 2: Вывести name, class по кораблям, выпущенным после 1920, но не позднее 1942

select *
FROM ships 
where launched >= '1920' and launched <= '1942'

-- Задание 3: Какое количество кораблей в каждом классе. Вывести количество и class

select count(*), class
from ships 
group by class

-- Задание 4: Для классов кораблей, калибр орудий которых не менее 16, укажите класс и страну. (таблица classes)

select class, country, bore
from Classes 
where bore >='16'

-- Задание 5: Укажите корабли, потопленные в сражениях в Северной Атлантике (таблица Outcomes, North Atlantic). Вывод: ship. 

select ship
FROM Outcomes 
where battle = 'North Atlantic' and result = 'sunk'

-- Задание 6: Вывести название (ship) последнего потопленного корабля

select *
FROM Outcomes
left join Battles
on Battles.name = Outcomes.battle
where result = 'sunk'
ORDER BY date desc

-- возвращает все потопленные корабли

select *
FROM Battles
right join Outcomes
on Battles.name = Outcomes.battle
where result = 'sunk' and date = (select max (date) from Battles)

-- возвращает пустую таблицу

-- Задание 7: Вывести название корабля (ship) и класс (class) последнего потопленного корабля
select name, class
FROM ships
left join Outcomes
on ships.name = Outcomes.ship
where result = 'sunk'

-- результат верный, так как всего один вывод, удовлетворяющий условиям. Однако у решения та же сложность, что и в задании 6

-- Задание 8: Вывести все потопленные корабли, у которых калибр орудий не менее 16, и которые потоплены. Вывод: ship, classse

select *
FROM classes
join ships 
on  ships.class = classes.class
join Outcomes
on ships.name = Outcomes.ship
where result = 'sunk' and bore >= '16'


-- Задание 9: Вывести все классы кораблей, выпущенные США (таблица classes, country = 'USA'). Вывод: class

select class 
from classes
where  country = 'USA'

-- Задание 10: Вывести все корабли, выпущенные США (таблица classes & ships, country = 'USA'). Вывод: name, class

select ships.class, name
from ships
join classes
on classes.class = ships.class
where country = 'USA'

