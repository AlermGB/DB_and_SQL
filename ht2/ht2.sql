DROP DATABASE IF EXISTS ht2;
CREATE DATABASE ht2;
USE ht2;

-- 1. Используя операторы языка SQL, создайте таблицу “sales”. Заполните ее данными.

DROP TABLE IF EXISTS sales;
CREATE TABLE sales (
	id SERIAL PRIMARY KEY, 
    order_date DATE,
    count_product INT
);

INSERT INTO sales (order_date, count_product)
VALUES
('2022-01-01', 156),
('2022-01-02', 180),
('2022-01-03', 21),
('2022-01-04', 124),
('2022-01-05', 341);

SELECT * FROM sales;

-- 2. Для данных таблицы “sales” укажите тип заказа в зависимости от кол-ва :
	-- меньше 100 - Маленький заказ от 100 до 300 - Средний заказ больше 300 - Большой заказ

SELECT
	id AS 'id заказа',
CASE
	WHEN count_product < 100
		THEN 'Маленький заказ'
	WHEN count_product >= 100 AND count_product <= 300
		THEN 'Средний заказ'
	ELSE 'Большой заказ'
END AS 'Тип заказа'
FROM sales;

-- 3. Создайте таблицу “orders”, заполните ее значениями
CREATE TABLE orders (
		id SERIAL PRIMARY KEY,
        employee_id VARCHAR(10),
        amount DECIMAL(7,2),
        order_status VARCHAR(9)
);
SELECT * FROM orders;
INSERT INTO orders (employee_id, amount, order_status)
VALUES
	('e03', 15, 'OPEN'),
    ('e01', 25.5, 'OPEN'),
    ('e05', 100.7, 'CLOSED'),
    ('e02', 22.18, 'OPEN'),
    ('e04', 9.5, 'CANSELLED');

SELECT * FROM orders;

/* Выберите все заказы. В зависимости от поля order_status выведите столбец
full_order_status:
OPEN – «Order is in open state» ; CLOSED - «Order is closed»; CANCELLED - «Order is
cancеlled» */

SELECT id,
CASE
	WHEN order_status = 'OPEN'
		THEN 'Order is in open state'
	WHEN order_status = 'CLOSED'
		THEN 'Order is closed'
	WHEN order_status = 'CANCELLED'
		THEN 'Order is cancеlled'
	ELSE 'Unknovn status'
END as full_order_status
FROM orders;

