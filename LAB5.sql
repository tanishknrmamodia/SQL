CREATE DATABASE LAB5;
USE LAB5;
USE LAB3;
SELECT Fname, Lname, PositionId FROM EMPLOYEE;

SELECT S.Fname, S.Lname
FROM EMPLOYEE E
JOIN EMPLOYEE S ON E.Supervisor = S.EmployeeId
WHERE E.EmployeeId = 433;

SELECT E.Lname, E.Fname, E.Salary, S.Lname AS Supervisor_Lname, S.Fname AS Supervisor_Fname, S.Salary AS Supervisor_Salary
FROM EMPLOYEE E
LEFT JOIN EMPLOYEE S ON E.Supervisor = S.EmployeeId;

SELECT E.Fname, E.Lname, E.Salary, L.LevelNo
FROM EMPLOYEE E
JOIN EMPLEVEL L ON E.Salary BETWEEN L.LowSalary AND L.HighSalary;

SELECT E.Fname, E.Lname, D.DeptName, P.PosDesc, Q.QualDesc
FROM EMPLOYEE E
JOIN DEPT D ON E.DeptId = D.DeptId
JOIN POSITION P ON E.PositionId = P.PositionId
JOIN QUALIFICATION Q ON E.QualId = Q.QualId;

SELECT E.Fname, E.Lname
FROM EMPLOYEE E
JOIN DEPT D ON E.DeptId = D.DeptId
WHERE D.DeptName = 'Sales';

SELECT E.Fname, E.Lname, D.DependentId, D.DepDOB, D.Relation
FROM EMPLOYEE E
LEFT JOIN DEPENDENT D ON E.EmployeeId = D.EmployeeId;

SELECT E.Fname, E.Lname, D.DeptName, TIMESTAMPDIFF(YEAR, E.HireDate, CURDATE()) AS YearsWorked
FROM EMPLOYEE E
JOIN DEPT D ON E.DeptId = D.DeptId
ORDER BY YearsWorked DESC;

SELECT E.Fname, E.Lname
FROM EMPLOYEE E
WHERE E.DeptId = (SELECT DeptId FROM EMPLOYEE WHERE Fname = 'John' AND Lname = 'Smith');



USE COLLEGE_STUDENTTSS;
SELECT S.First, S.Last, M.MajorDesc
FROM STUDENT S
JOIN MAJOR M ON S.MajorId = M.MajorId;

SELECT S.First, S.Last
FROM STUDENT S
JOIN REGISTRATION R ON S.StudentId = R.StudentId
JOIN CRSSECTION CS ON R.CsId = CS.CsId
JOIN TERM T ON CS.TermId = T.TermId
WHERE R.Final < 40 AND T.TermDesc = 'Winter 2003';

SELECT S.First, S.Last, F.Name AS FacultyName, F.RoomId
FROM STUDENT S
JOIN FACULTY F ON S.FacultyId = F.FacultyId;

SELECT CS.CsId, CS.Section, T.TermDesc, C.Title, F.Name AS FacultyName
FROM CRSSECTION CS
JOIN COURSE C ON CS.CourseId = C.CourseId
JOIN TERM T ON CS.TermId = T.TermId
LEFT JOIN FACULTY F ON CS.FacultyId = F.FacultyId
WHERE T.TermDesc = 'Spring 2003';

SELECT C1.Title AS CourseTitle, C2.Title AS PreReqTitle
FROM COURSE C1
LEFT JOIN COURSE C2 ON C1.PreReq = C2.CourseId;

