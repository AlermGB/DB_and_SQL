/* 1. Создайте функцию, которая принимает кол-во сек и формат их в
  кол-во дней, часов, минут и секунд.

  Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
*/
CREATE DATABASE ht6;
USE ht6;
DROP FUNCTION IF EXISTS seconds_to_time;
DELIMITER $$
CREATE FUNCTION seconds_to_time(seconds BIGINT)
RETURNS VARCHAR(65)
DETERMINISTIC
BEGIN

    DECLARE days INT DEFAULT 0;
    DECLARE hours INT DEFAULT 0;
    DECLARE minutes INT DEFAULT 0;
    
    SET days = FLOOR(seconds / (24 * 60 * 60));
    SET seconds = seconds % (24 * 60 * 60);
  
    SET hours = FLOOR(seconds / (60 * 60));
    SET seconds = seconds % (60 * 60);

    SET minutes = FLOOR(seconds / 60);
    SET seconds = seconds % 60;

RETURN CONCAT
(
  days, ' days ',
  hours, ' hours ',
  minutes, ' minutes ',
  seconds, ' seconds'
);
END $$
DELIMITER ;

SELECT seconds_to_time(123456);
-- Никак не мог подумать, что SQL int округляет в большую. Он мне всю голову сломал

/*
Выведите только четные числа от 1 до 10 (Через цикл внутри процедуры).
Пример: 2,4,6,8,10
*/

DROP PROCEDURE IF EXISTS chain_even_to_10;
DELIMITER $$
CREATE PROCEDURE chain_even_to_10()
BEGIN
	DECLARE current_num int DEFAULT 2;
    DECLARE num_chain VARCHAR(20) DEFAULT current_num;
    WHILE current_num < 10 DO
    SET current_num = current_num + 2;
	SET num_chain = CONCAT(num_chain, ',', current_num);

    END WHILE;

SELECT num_chain;
END $$
DELIMITER ;

CALL chain_even_to_10();
