create database openended2;
use openended2;
DELIMITER //

-- 1. Procedure to declare a cursor and print employee info
CREATE PROCEDURE GetHighSalaryEmployees()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE emp_lastname VARCHAR(50);
    DECLARE emp_firstname VARCHAR(50);
    DECLARE hire_date DATE;
    DECLARE emp_salary DECIMAL(10,2);
    
    DECLARE emp_cursor CURSOR FOR 
    SELECT last_name, first_name, hire_date, salary 
    FROM EMPLOYEE 
    WHERE salary > 50000 AND hire_date < '1997-12-31';

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    
    OPEN emp_cursor;
    
    read_loop: LOOP
        FETCH emp_cursor INTO emp_lastname, emp_firstname, hire_date, emp_salary;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT emp_lastname, emp_firstname, hire_date, emp_salary;
    END LOOP;

    CLOSE emp_cursor;
END //


-- 2. Procedure to declare a cursor with a salary parameter
CREATE PROCEDURE GetEmployeesAboveSalary(IN min_salary DECIMAL(10,2))
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE emp_lastname VARCHAR(50);
    DECLARE emp_firstname VARCHAR(50);
    DECLARE emp_salary DECIMAL(10,2);

    DECLARE emp_cursor CURSOR FOR 
    SELECT last_name, first_name, salary 
    FROM EMPLOYEE 
    WHERE salary > min_salary;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN emp_cursor;

    read_loop: LOOP
        FETCH emp_cursor INTO emp_lastname, emp_firstname, emp_salary;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT emp_lastname, emp_firstname, emp_salary;
    END LOOP;

    CLOSE emp_cursor;
END //

-- Example usage:
-- CALL GetEmployeesAboveSalary(60000);

-- 3. Procedure to increase salary based on salary range
CREATE PROCEDURE IncreaseSalary()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE emp_id INT;
    DECLARE emp_salary DECIMAL(10,2);

    DECLARE emp_cursor CURSOR FOR 
    SELECT id, salary FROM EMPLOYEE;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN emp_cursor;

    read_loop: LOOP
        FETCH emp_cursor INTO emp_id, emp_salary;
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        IF emp_salary < 100000 THEN
            UPDATE EMPLOYEE SET salary = salary * 1.15 WHERE id = emp_id;
        ELSE
            UPDATE EMPLOYEE SET salary = salary * 1.10 WHERE id = emp_id;
        END IF;
    END LOOP;

    CLOSE emp_cursor;
END //

-- Example usage:
-- CALL IncreaseSalary();

-- 4. Procedure to handle employee qualification search exceptions
CREATE PROCEDURE GetEmployeesByQualification(IN qual_id INT)
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE emp_count INT;

    SELECT COUNT(*) INTO emp_count FROM EMPLOYEE WHERE qualification_id = qual_id;

    IF emp_count = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No employee with such qualification.';
    ELSEIF emp_count > 1 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'More than one employee with such qualification.';
    ELSE
        SELECT last_name, first_name, salary FROM EMPLOYEE WHERE qualification_id = qual_id;
    END IF;
END //

-- Example usage:
-- CALL GetEmployeesByQualification(3);

-- 5. Procedure to retrieve course details and handle missing course ID
CREATE PROCEDURE GetCourseDetails(IN course_id VARCHAR(10))
BEGIN
    DECLARE course_exists INT;

    SELECT COUNT(*) INTO course_exists FROM COURSE WHERE id = course_id;

    IF course_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Course does not exist.';
    ELSE
        SELECT * FROM COURSE WHERE id = course_id;
    END IF;
END //

-- Example usage:
-- CALL GetCourseDetails('CIS555');

-- 6. Procedure to perform arithmetic operations with exception handling
CREATE PROCEDURE Calculate(IN num1 DECIMAL(10,2), IN num2 DECIMAL(10,2), IN operator CHAR(1))
BEGIN
    DECLARE result DECIMAL(10,2);
    
    IF operator = '+' THEN
        SET result = num1 + num2;
    ELSEIF operator = '-' THEN
        SET result = num1 - num2;
    ELSEIF operator = '*' THEN
        SET result = num1 * num2;
    ELSEIF operator = '/' THEN
        IF num2 = 0 THEN
            SIGNAL SQLSTATE '22012' SET MESSAGE_TEXT = 'Division by zero error.';
        ELSE
            SET result = num1 / num2;
        END IF;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid operator.';
    END IF;

    SELECT result AS CalculationResult;
END //

-- Example usage:
-- CALL Calculate(10, 2, '+');
-- CALL Calculate(10, 0, '/'); -- Should throw "Division by zero error"

-- 7. Trigger to log inserted students into a tracking table
CREATE TABLE IF NOT EXISTS TRACKING (
    student_id INT,
    last_name VARCHAR(50),
    entry_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TRIGGER LogStudentInsert
AFTER INSERT ON STUDENT
FOR EACH ROW
BEGIN
    INSERT INTO TRACKING (student_id, last_name) VALUES (NEW.id, NEW.last_name);
END //

DELIMITER ;

-- Example usage:
-- Insert a new student and check the tracking table:
-- INSERT INTO STUDENT (id, last_name) VALUES (101, 'Smith');
-- SELECT * FROM TRACKING; -- Should show the newly inserted student record
