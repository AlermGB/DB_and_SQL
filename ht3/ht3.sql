CREATE DATABASE IF NOT EXISTS ht3; 

USE ht3;

DROP TABLE IF EXISTS staff;

CREATE TABLE staff
(
	id INT PRIMARY KEY AUTO_INCREMENT, 
    firstname VARCHAR(45),
    lastname VARCHAR(45),
    post VARCHAR(45),
    seniority INT,
    salary DECIMAL(8,2),
    age INT
);

INSERT INTO staff (firstname, lastname, post, seniority, salary, age)
VALUES
 ('Вася', 'Петров', 'Начальник', 40, 100000, 60),
 ('Петр', 'Власов', 'Начальник', 8, 70000, 30),
 ('Катя', 'Катина', 'Инженер', 2, 70000, 25),
 ('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
 ('Иван', 'Петров', 'Рабочий', 40, 30000, 59),
 ('Петр', 'Петров', 'Рабочий', 20, 55000, 60),
 ('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
 ('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
 ('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
 ('Максим', 'Петров', 'Рабочий', 2, 11000, 19),
 ('Юрий', 'Петров', 'Рабочий', 3, 12000, 24),
 ('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);
 
 SELECT * FROM staff;
 
 --  * Отсортируйте данные по полю заработная плата (salary) в порядке: убывания;
SELECT * FROM staff
ORDER BY salary DESC;
 
 -- возрастания
SELECT * FROM staff
ORDER BY salary;

-- * Выведите 5 максимальных заработных плат (saraly)
SELECT salary
FROM staff
ORDER BY salary DESC
LIMIT 5;

-- * Посчитайте суммарную зарплату (salary) по каждой специальности (роst)
SELECT
	post,
	SUM(salary) AS sum_sal
FROM staff
GROUP BY post;

-- * Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно.
SELECT COUNT(post) AS 'Количество рабочих от 24-х до 49-и лет'
FROM staff
WHERE post = 'Рабочий' AND age >= 24 AND age <= 49
GROUP BY post;
 
 -- * Найдите количество специальностей
SELECT COUNT(DISTINCT(post)) AS 'Количество специальностей'
FROM staff;

-- * Выведите специальности, у которых средний возраст сотрудников меньше 30 лет
SELECT DISTINCT(post)
FROM staff
GROUP BY post
HAVING AVG(age) <= 30; -- с ваших слов на семинаре

/*
Доп:
Внутри каждой должности вывести ТОП-2 по ЗП (2 самых высокооплачиваемых сотрудника по ЗП внутри каждой должности)
*/
SELECT
    CONCAT(firstname, ' ', lastname) AS 'Топ начальников'
FROM staff
WHERE post = 'Начальник'
ORDER BY salary DESC
LIMIT 2;

SELECT
    CONCAT(firstname, ' ', lastname) AS 'Топ инженеров'
FROM staff
WHERE post = 'Инженер'
ORDER BY salary DESC
LIMIT 2;

SELECT
    CONCAT(firstname, ' ', lastname) AS 'Топ рабочих'
FROM staff
WHERE post = 'Рабочий'
ORDER BY salary DESC
LIMIT 2;

SELECT
    CONCAT(firstname, ' ', lastname) AS 'Топ уборщиков'
FROM staff
WHERE post = 'Уборщик'
ORDER BY salary DESC
LIMIT 2;
