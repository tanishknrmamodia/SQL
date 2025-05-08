/*
1. Create a table name student with the following attributes (data types are
shown in the parenthesis): Roll No (Integer), Name (varchar(50)), Gender
(Char), CGPA (Float)
2. Insert at least ten records into the table.
3. Add a new column to the table, for the Date of Birth (Date). Use the date
data type to store this. Also, update the date of birth of all the records
4. Delete from the table the record of the student whose CGPA is the lowest
5. Display only those students whose CGPA lies in the range of [6, 8]
6. Order the data in the tables based on CGPA from ascending to descending.
7. Display the records for students with the smallest and the largest CGPA
8.  Display only those students whose CGPA lies in the range of [6, 8] and
whose DOB is after 1-6-2006
*/
CREATE DATABASE LAB1;

USE LAB1;

CREATE TABLE STUDENT(
Roll_No INT,
Name VARCHAR(50),
Gender Char (1),
CGPA Float
);

INSERT INTO STUDENT VALUES(1,"ADITYA","M",7.2);
INSERT INTO STUDENT VALUES(2,"RAVI","M",8.1);
INSERT INTO STUDENT VALUES(3,"SURAJ","M",8.6);
INSERT INTO STUDENT VALUES(4,"POOJA","F",6.8);
INSERT INTO STUDENT VALUES(5,"ROHIT","M",8.9);
INSERT INTO STUDENT VALUES(6,"ANJALI","F",9.1);
INSERT INTO STUDENT VALUES(7,"KRISHNA","M",7.5);
INSERT INTO STUDENT VALUES(8,"RAM","M",8.0);
INSERT INTO STUDENT VALUES(9,"ANGAD","M",9.0);
INSERT INTO STUDENT VALUES(10,"SHIVAM","M",10.0);


SELECT * FROM STUDENT ;
ALTER TABLE STUDENT ADD COLUMN DOB DATE; 

SET SQL_SAFE_UPDATES=0;

UPDATE STUDENT SET DOB = "2005-01-21" WHERE NAME = "ADITYA";
UPDATE STUDENT SET DOB = "2005-02-22" WHERE NAME = "RAVI";
UPDATE STUDENT SET DOB = "2005-03-23" WHERE NAME = "SURAJ";
UPDATE STUDENT SET DOB = "2005-04-24" WHERE NAME = "POOJA";
UPDATE STUDENT SET DOB = "2005-05-25" WHERE NAME = "ROHIT";
UPDATE STUDENT SET DOB = "2007-06-26" WHERE NAME = "ANJALI";
UPDATE STUDENT SET DOB = "2005-07-27" WHERE NAME = "KRISHNA";
UPDATE STUDENT SET DOB = "2005-08-28" WHERE NAME = "RAM";
UPDATE STUDENT SET DOB = "2005-09-29" WHERE NAME = "ANGAD";
UPDATE STUDENT SET DOB = "2005-10-30" WHERE NAME = "SHIVAM";

SELECT * FROM STUDENT ;

SELECT * FROM STUDENT WHERE CGPA <= 8 AND 6 <= CGPA;
SELECT * FROM STUDENT ORDER BY CGPA;
SELECT * FROM STUDENT ORDER BY CGPA DESC;  
SELECT * FROM STUDENT WHERE CGPA = (SELECT MAX(CGPA) FROM STUDENT);  
SELECT * FROM STUDENT WHERE CGPA = (SELECT MIN(CGPA) FROM STUDENT);  
SELECT * FROM STUDENT WHERE 6 < CGPA AND CGPA < 8 AND DOB > "2006-06-01";
