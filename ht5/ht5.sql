CREATE DATABASE IF NOT EXISTS ht5; 

USE ht5;

CREATE TABLE cars
(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
SELECT *
FROM cars;


-- 1.	Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов

CREATE OR REPLACE VIEW cheap_auto
AS SELECT
	* FROM cars
    WHERE cost < 25000;

SELECT * FROM cheap_auto;

-- 2.	Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW) 

ALTER VIEW cheap_auto
AS SELECT
	* FROM cars
    WHERE cost < 30000;
    
    SELECT * FROM cheap_auto;
    
-- 3. 	Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”

CREATE OR REPLACE VIEW s_a_auto
AS SELECT
	* FROM cars
    WHERE name IN ("Skoda", "Audi");
    
    SELECT * FROM s_a_auto;
    
/*
Добавьте новый столбец под названием «время до следующей станции».
Чтобы получить это значение, мы вычитаем время станций для пар смежных станций.
Мы можем вычислить это значение без использования оконной функции SQL,
но это может быть очень сложно. Проще это сделать с помощью оконной функции LEAD .
Эта функция сравнивает значения из одной строки со следующей строкой, чтобы получить результат.
В этом случае функция сравнивает значения в столбце «время» для станции со станцией сразу после нее.
*/
    
CREATE TABLE train_timetable 
(
	train_id INT,
	station VARCHAR(20),
	station_time TIME
);

INSERT INTO train_timetable
VALUES
	(110, 'San Francisco', '10:00:00'),
    (110, 'Redwood City', '10:54:00'),
    (110, 'Palo Alto', '11:02:00'),
    (110, 'San Jose', '12:35:00'),
    (120, 'San Francisco', '11:00:00'),
	(120, 'Palo Alto', '12:49:00'),
	(120, 'San Jpse', '13:30:00');

SELECT * FROM train_timetable;

SELECT *,
SUBTIME(LEAD (station_time) OVER(PARTITION BY train_id ORDER BY train_id), station_time)  AS 'время до следующей станции'
FROM train_timetable;  
