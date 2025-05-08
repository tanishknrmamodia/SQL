CREATE DATABASE LAB4; 
USE LAB3;
SELECT CONCAT (lname,',',fname) as fullname,CONCAT('Rs' ,FORMAT(salary, 2)) AS salary FROM employee;
SELECT * FROM EMPLOYEE;

SELECT CONCAT(LNAME, ", ", FNAME) AS "FULL_NAME", IFNULL(COMMISSION, 0) AS "COMMISSION" FROM EMPLOYEE;
SELECT * FROM employee WHERE commission IS NULL OR commission = 0;

SELECT COUNT( RoomId) AS totalrooms FROM location;

SELECT count(distinct building) as building from location;

USE LAB_2;
SELECT EmployeeId,date_format(DepDOB,"%d/ %m/ %y") from DEPENDENT; 
SELECT EmployeeId, DepDOB FROM DEPENDENT;


select date_format(current_date,"%y")- date_format(DepDOB,"%y")as age from DEPENDENT;

SELECT AVG(YEAR(CURDATE()) - YEAR(DepDOB)) AS average_age, MAX(YEAR(CURDATE()) - YEAR(DepDOB)) AS highest_age, MIN(YEAR(CURDATE()) - YEAR(DepDOB)) AS lowest_age FROM DEPENDENT;

SELECT e. EmployeeId, CONCAT(e.Fname, ' ', e.Lname) AS employeename FROM employee e JOIN dependent d ON e.EmployeeId = d.EmployeeId GROUP BY e.EmployeeId HAVING COUNT(d.DependentId) ;

SELECT AVG(commission) AS average_commission FROM employee;

SELECT POWER(2, 10) AS Result;

USE LAB3;
SELECT PreReq, CASE WHEN PreReq IS NULL THEN 'none' ELSE 'one' END AS prerequisite_status FROM course;

SELECT DeptId, COUNT(FacultyId) AS facultycount FROM faculty GROUP BY DeptId;
SELECT * FROM FACULTY;
SELECT DeptId, AVG(salary) AS average_salary FROM employee GROUP BY DeptId HAVING AVG(salary) >= 75000;

SELECT EmployeeId ,FLOOR(DATEDIFF(CURDATE(), HireDate) / 365) AS years_worked FROM employee;

USE LAB_2;
SELECT * FROM DEPENDENT WHERE MONTH(DepDOB) = 8;

SELECT lname, fname, CASE WHEN commission IS NOT NULL THEN salary + commission ELSE salary END AS total_compensation FROM employee;

SELECT CONCAT(fname, ' ', lname) AS full_name, CASE WHEN salary > 100000 THEN 'HIGH' WHEN salary BETWEEN 50000 AND 100000 THEN 'MEDIUM' WHEN salary < 50000 THEN 'LOW' END AS salary_message FROM employee;





















