-- 1. Создайте таблицу с мобильными телефонами, используя графический интерфейс. Заполните БД данными.
CREATE DATABASE IF NOT EXISTS ht1;
USE ht1;
DROP TABLE IF EXISTS phones;
CREATE TABLE  phones
(
id INT PRIMARY KEY AUTO_INCREMENT,
ProductName VARCHAR(45),
Manufacturer VARCHAR(45),
ProductCount INT,
Price INT
);
INSERT phones (ProductName, Manufacturer, ProductCount, Price)
VALUES
("iPhone X", "Apple", 3, 76000),
("iPhone 8", "Apple", 2, 51000),
("Galaxy S9", "Samsung", 2, 56000),
("Galaxy S8", "Samsung", 1, 41000),
("P20 Pro", "Huawei", 5, 36000);
SELECT * FROM phones;

-- 2. Выведите название, производителя и цену для товаров, количество которых превышает 2
SELECT ProductName, Manufacturer, Price FROM phones
WHERE ProductCount > 2;

-- 3. Выведите весь ассортимент товаров марки “Samsung”.
SELECT ProductName FROM phones
WHERE  Manufacturer = "Samsung";
/*
а хотелось вот так:
SELECT DISTINCT ProductName FROM phones
WHERE  Manufacturer = "Samsung";
правда для нашей таблицы это чрезмерно
*/

-- 4. Выведите информацию о телефонах, где суммарный чек больше 100 000 и меньше 145 000**
SELECT * FROM phones
WHERE ProductCount * Price > 100000 AND ProductCount * Price < 145000;

-- 4.*** С помощью регулярных выражений найти (можно использовать операторы “LIKE”, “RLIKE” для 4.3 ):
-- 		4.1. Товары, в которых есть упоминание "Iphone"
SELECT ProductName FROM phones
WHERE  ProductName LIKE '%Iphone%';

-- 		4.2. "Galaxy"
SELECT ProductName FROM phones
WHERE  ProductName LIKE '%Galaxy%';

-- 		4.3.  Товары, в которых есть ЦИФРЫ
/*
сначала в голову приходит тупой вариант:
SELECT ProductName FROM phones
WHERE  ProductName LIKE '%1%' 
OR ProductName LIKE '%2%' 
OR ProductName LIKE '%3%' 
OR ProductName LIKE '%4%' 
OR ProductName LIKE '%5%' 
OR ProductName LIKE '%6%' 
OR ProductName LIKE '%7%' 
OR ProductName LIKE '%8%' 
OR ProductName LIKE '%9%' 
OR ProductName LIKE '%0%';
*/
SELECT ProductName FROM phones
WHERE  ProductName RLIKE '[0-9]';

-- 		4.4.  Товары, в которых есть ЦИФРА "8"  
SELECT ProductName FROM phones
WHERE  ProductName LIKE '%8%';