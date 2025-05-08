create database openended1;
use openended1;
-- 1. Procedure to check if a year is a leap year

DELIMITER //
CREATE PROCEDURE CheckLeapYear(IN year INT)
BEGIN
    IF (MOD(year, 4) = 0 AND MOD(year, 100) <> 0) OR (MOD(year, 400) = 0) THEN
        SELECT CONCAT(year, ' is a Leap Year') AS Result;
    ELSE
        SELECT CONCAT(year, ' is NOT a Leap Year') AS Result;
    END IF;
END //
DELIMITER ;

CALL CheckLeapYear(2000);
CALL CheckLeapYear(1900);

-- 2. Procedure to print all odd numbers between 1 and 10
DELIMITER //
CREATE PROCEDURE PrintOddNumbers()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 10 DO
        IF MOD(i, 2) <> 0 THEN
            SELECT i;
        END IF;
        SET i = i + 1;
    END WHILE;
END //
DELIMITER ;

CALL PrintOddNumbers();

-- 3. Procedure to print values from 10 to 1
DELIMITER //
CREATE PROCEDURE PrintReverse()
BEGIN
    DECLARE i INT DEFAULT 10;
    WHILE i >= 1 DO
        SELECT i;
        SET i = i - 1;
    END WHILE;
END //
DELIMITER ;

CALL PrintReverse();

-- 4. Create table ITEM and procedure to insert values 1 to 5
CREATE TABLE ITEM (
    ItemNum INT
);

DELIMITER //
CREATE PROCEDURE InsertItems()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 5 DO
        INSERT INTO ITEM (ItemNum) VALUES (i);
        SET i = i + 1;
    END WHILE;
END //
DELIMITER ;

CALL InsertItems();

-- 5. Procedure to print multiplication table of a number
DELIMITER //
CREATE PROCEDURE MultiplicationTable(IN num INT)
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 10 DO
        SELECT CONCAT(num, ' x ', i, ' = ', num * i) AS Multiplication;
        SET i = i + 1;
    END WHILE;
END //
DELIMITER ;

CALL MultiplicationTable(5);

-- 6. Procedure to print number of days in a month
DELIMITER //
CREATE PROCEDURE DaysInMonth(IN month INT, IN year INT)
BEGIN
    IF month IN (1, 3, 5, 7, 8, 10, 12) THEN
        SELECT '31 Days' AS Days;
    ELSEIF month IN (4, 6, 9, 11) THEN
        SELECT '30 Days' AS Days;
    ELSEIF month = 2 THEN
        IF (MOD(year, 4) = 0 AND MOD(year, 100) <> 0) OR (MOD(year, 400) = 0) THEN
            SELECT '29 Days' AS Days;
        ELSE
            SELECT '28 Days' AS Days;
        END IF;
    ELSE
        SELECT 'Invalid Month' AS Days;
    END IF;
END //
DELIMITER ;

CALL DaysInMonth(2, 2024);

-- 7. Procedure to delete item number 4 from ITEM table


DELIMITER //
CREATE PROCEDURE DeleteItemV2()
BEGIN
    DELETE FROM ITEM WHERE ItemNum = 4;
END //
DELIMITER ;

-- Verify ITEM table after deletion
SELECT * FROM ITEM;

