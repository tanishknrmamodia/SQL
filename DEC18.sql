CREATE DATABASE secondclass;
USE secondclass;
CREATE TABLE STUDENT
(
ID INT ,

 /* NOT NULL MEANS IT MEANS WHILE ENTERING THE DATA I HAVE TO ENTER ALL THE DATA , MAI KUCH CHD NHI SAKTA WHILE ENTERING 
 THE DATA MEANS MAI STUDENT KI ID ENTER KAR RHA HU BUT AGE NHI KAR RHA */  
 
NAME VARCHAR(20) NOT NULL,
AGE INT NOT NULL,
MENTOR_ID INT DEFAULT 3892,            -- IN CASE I FORGET TO ENTER MENTOR ID THEN IT WILL REPRESENT THIS ID 
CHECK (AGE>16) ,                        -- NOW IT WILL ONLY ENTER THE DATA WHOSE AGE IS GREATER 16
PRIMARY KEY (ID)                        -- PRIMARY KEY DOES NOT ACCEPT DUPPLICATES, IT IS UNIQUE AND IT CANNOT BE NULL 
);
DESC STUDENT;
DROP TABLE STUDENT;                    -- THIS IS THE WAY TO DELETE TABLE 