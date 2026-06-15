create database Case_Study2
use Case_Study2
go

CREATE TABLE LOCATION (
  Location_ID INT PRIMARY KEY,
  City VARCHAR(50)
);

INSERT INTO LOCATION (Location_ID, City)
VALUES (122, 'New York'),
       (123, 'Dallas'),
       (124, 'Chicago'),
       (167, 'Boston');


  CREATE TABLE DEPARTMENT (
  Department_Id INT PRIMARY KEY,
  Name VARCHAR(50),
  Location_Id INT,
  FOREIGN KEY (Location_Id) REFERENCES LOCATION(Location_ID)
);


INSERT INTO DEPARTMENT (Department_Id, Name, Location_Id)
VALUES (10, 'Accounting', 122),
       (20, 'Sales', 124),
       (30, 'Research', 123),
       (40, 'Operations', 167);

	   CREATE TABLE JOB (
  Job_ID INT PRIMARY KEY,
  Designation VARCHAR(50)
);

INSERT  INTO JOB VALUES
(667, 'CLERK'),
(668,'STAFF'),
(669,'ANALYST'),
(670,'SALES_PERSON'),
(671,'MANAGER'),
(672, 'PRESIDENT')


CREATE TABLE EMPLOYEE
(EMPLOYEE_ID INT,
LAST_NAME VARCHAR(20),
FIRST_NAME VARCHAR(20),
MIDDLE_NAME CHAR(1),
JOB_ID INT FOREIGN KEY
REFERENCES JOB(JOB_ID),
MANAGER_ID INT,
HIRE_DATE DATE,
SALARY INT,
COMM INT,
DEPARTMENT_ID  INT FOREIGN KEY
REFERENCES DEPARTMENT(DEPARTMENT_ID))

INSERT INTO EMPLOYEE VALUES
(7369,'SMITH','JOHN','Q',667,7902,'17-DEC-84',800,NULL,20),
(7499,'ALLEN','KEVIN','J',670,7698,'20-FEB-84',1600,300,30),
(7505,'DOYLE','JEAN','K',671,7839,'04-APR-85',2850,NULl,30),
(7506,'DENNIS','LYNN','S',671,7839,'15-MAY-85',2750,NULL,30),
(7507,'BAKER','LESLIE','D',671,7839,'10-JUN-85',2200,NULL,40),
(7521,'WARK','CYNTHIA','D',670,7698,'22-FEB-85',1250,500,30);

select * from LOCATION
select * from DEPARTMENT
select * from JOB
select * from EMPLOYEE

--SIMPLE QUERIES

--1.List all the employee details.

SELECT * FROM EMPLOYEE;

--2.List all the department details.

SELECT * FROM DEPARTMENT;

--3.List all job details.

SELECT * FROM JOB;

--4.List all the locations.

SELECT * FROM LOCATION;

--5.List out the First Name, Last Name, Salary, Commission for all Employees.

SELECT FIRST_NAME,LAST_NAME,SALARY,COMM
FROM EMPLOYEE;

/*6.List out the Employee ID, Last Name, Department ID for all employees and alias
Employee ID as "ID of the Employee", Last Name as "Name of the Employee", Department ID as "Dep_id".*/

SELECT EMPLOYEE_ID AS ID_of_the_Employee, LAST_NAME AS Name_of_the_Employee,DEPARTMENT_ID AS Dep_id
FROM EMPLOYEE;

--7.List out the annual salary of the employees with their names only.

SELECT 
FIRST_NAME AS EMPLOYEE_NAME,
SALARY*12 AS ANNUAL_SALARY
FROM EMPLOYEE;


--WHERE CONDITION
--1.List the details about "Smith".

SELECT * FROM EMPLOYEE 
WHERE LAST_NAME = 'SMITH';

--2.List out the employees who are working in department 20.

SELECT * FROM EMPLOYEE 
WHERE DEPARTMENT_ID = '20';

--3.List out the employees who are earning salary between 2000 and 3000.

SELECT * FROM EMPLOYEE 
WHERE SALARY BETWEEN '2000' AND '3000';

--4.List out the employees who are working in department 10 or 20.

SELECT * FROM EMPLOYEE 
WHERE DEPARTMENT_ID IN (10, 20);

--5.Find out the employees who are not working in department 10 or 30.

SELECT * FROM EMPLOYEE 
WHERE DEPARTMENT_ID NOT IN (10, 30);

--6.List out the employees whose name starts with 'L'.

SELECT * FROM EMPLOYEE 
WHERE FIRST_NAME LIKE 'L%';

--7.List out the employees whose name starts with 'L' and ends with 'E'.

SELECT * FROM EMPLOYEE 
WHERE FIRST_NAME LIKE 'L%E';

--8.List out the employees whose name length is 4 and start with 'J'.

SELECT * FROM EMPLOYEE 
WHERE FIRST_NAME LIKE 'J___';

--9.List out the employees who are working in department 30 and draw the salaries more than 2500.

SELECT * FROM EMPLOYEE 
WHERE DEPARTMENT_ID = '30' AND SALARY > 2500;

--10.List out the employees who are not receiving commission.

SELECT * FROM EMPLOYEE 
WHERE COMM IS NULL;

--ORDER BY Clause:

--1.List out the Employee ID and Last Name in ascending order based on the Employee ID.

SELECT EMPLOYEE_ID,LAST_NAME
FROM EMPLOYEE
ORDER BY EMPLOYEE_ID ASC;

--2.List out the Employee ID and Name in descending order based on salary.

SELECT EMPLOYEE_ID,CONCAT (FIRST_NAME,' ',LAST_NAME) AS NAME
FROM EMPLOYEE
ORDER BY SALARY DESC;

--3.List out the employee details according to their Last Name in ascending-order.

SELECT * FROM EMPLOYEE
ORDER BY LAST_NAME DESC;

--4.List out the employee details according to their Last Name in ascending order and then Department ID in descending order.

SELECT * FROM EMPLOYEE
ORDER BY LAST_NAME ASC, DEPARTMENT_ID DESC;

--GROUP BY and HAVING Clause:
--1.List out the department wise maximum salary, minimum salary and average salary of the employees.

SELECT DEPARTMENT_ID, MAX(SALARY) AS Max_Salary,
MIN(SALARY) AS Min_Salary, AVG(SALARY) AS Avg_Salary
FROM EMPLOYEE
GROUP BY DEPARTMENT_ID;

--2.List out the job wise maximum salary, minimum salary and average salary of the employees.

SELECT JOB_ID, MAX(SALARY) AS Max_Salary,
MIN(SALARY) AS Min_Salary, AVG(SALARY) AS Avg_Salary
FROM EMPLOYEE
GROUP BY JOB_ID;

--3.List out the number of employees who joined each month in ascending order.

SELECT DATENAME(MM, HIRE_DATE) MONTH, COUNT(EMPLOYEE_ID) AS NO_OF_EMPLOYEE
FROM EMPLOYEE
GROUP BY DATENAME(MM, HIRE_DATE)
ORDER BY NO_OF_EMPLOYEE ASC;

--4.List out the number of employees for each month and year in ascending order based on the year and month.

SELECT * FROM EMPLOYEE

SELECT YEAR(HIRE_DATE) AS YEAR,MONTH(HIRE_DATE) AS MONTH,COUNT(EMPLOYEE_ID) AS No_of_Employees
FROM EMPLOYEE
GROUP BY YEAR(HIRE_DATE),MONTH(HIRE_DATE)
ORDER BY YEAR(HIRE_DATE) ASC,MONTH(HIRE_DATE) ASC;

--5.List out the Department ID having at least four employees.

SELECT DEPARTMENT_ID
FROM EMPLOYEE
GROUP BY DEPARTMENT_ID
HAVING COUNT(EMPLOYEE_ID) >=4

--6.How many employees joined in February month.

SELECT * FROM EMPLOYEE

SELECT MONTH(HIRE_DATE) AS FEBRUARY,
COUNT(EMPLOYEE_ID) AS No_Of_Employees
FROM EMPLOYEE
WHERE MONTH(HIRE_DATE) = 2
GROUP BY MONTH(HIRE_DATE);

--7.How many employees joined in May or June month.

SELECT COUNT(*) FROM EMPLOYEE
WHERE MONTH(HIRE_DATE) IN (5,6);

--8.How many employees joined in 1985?

SELECT COUNT(*) AS NoOfEmployee
FROM EMPLOYEE
WHERE YEAR(HIRE_DATE) = 1985;

--9.How many employees joined each month in 1985?

SELECT YEAR(HIRE_DATE) AS YEAR,MONTH(HIRE_DATE) AS MONTH,COUNT(EMPLOYEE_ID) AS NoOfEmployee
FROM EMPLOYEE
WHERE YEAR(HIRE_DATE) = 1985
GROUP BY HIRE_DATE;

--10.How many employees were joined in April 1985?

SELECT YEAR(HIRE_DATE) AS YEAR,MONTH(HIRE_DATE) AS MONTH,COUNT(EMPLOYEE_ID) AS NoOfEmployee
FROM EMPLOYEE
WHERE YEAR(HIRE_DATE) = 1985 AND MONTH(HIRE_DATE) = 4
GROUP BY HIRE_DATE;

--11.Which is the Department ID having greater than or equal to 3 employees joining in April 1985?

SELECT EMPLOYEE_ID,COUNT(*) AS NumberOfEmployee
FROM EMPLOYEE
WHERE DATEPART(YY, HIRE_DATE) = '1985'
AND DATEPART(MM, HIRE_DATE) = '4'
GROUP BY EMPLOYEE_ID
HAVING COUNT(*) >=3;


--Joins:

--1.List out employees with their department names.

SELECT * FROM EMPLOYEE E
INNER JOIN DEPARTMENT D ON
E.DEPARTMENT_ID = D.Department_Id;

--2.Display employees with their designations.

SELECT * FROM EMPLOYEE E
INNER JOIN JOB J ON
E.JOB_ID = J.Job_ID;

--3.Display the employees with their department names and city.

SELECT * FROM EMPLOYEE E
INNER JOIN DEPARTMENT D ON
E.DEPARTMENT_ID = D.Department_Id;

--4.How many employees are working in different departments? Display with department names.

SELECT Name, COUNT(E.EMPLOYEE_ID) AS Employee_Count
FROM DEPARTMENT D
LEFT JOIN EMPLOYEE E ON D.Department_Id = E.DEPARTMENT_ID
GROUP BY D.Name;

--5.How many employees are working in the sales department?

SELECT COUNT(EMPLOYEE_ID) AS NoOfEmployee
FROM EMPLOYEE E
INNER JOIN DEPARTMENT D ON
E.DEPARTMENT_ID = D.Department_Id
WHERE D.Name ='Sales';

--6.Which is the department having greater than or equal to 3 employees and display the department names in ascending order.

SELECT E.DEPARTMENT_ID,D.Name, COUNT(EMPLOYEE_ID) AS NoOfEmployee
FROM EMPLOYEE E
INNER JOIN DEPARTMENT D ON
E.DEPARTMENT_ID = D.Department_Id
WHERE E.DEPARTMENT_ID >=3
GROUP BY E.DEPARTMENT_ID,D.Name
ORDER BY D.Name ASC;

--7.How many employees are working in 'Dallas'?

SELECT D.Location_Id,L.City,COUNT(E.EMPLOYEE_ID) AS NoOfEmployees
FROM DEPARTMENT D
INNER JOIN LOCATION L ON 
D.Location_Id = L.Location_ID
INNER JOIN EMPLOYEE E ON 
D.Department_Id = E.DEPARTMENT_ID
WHERE E.DEPARTMENT_ID = '30'
GROUP BY D.Location_Id, L.City;

--8.Display all employees in sales or operation departments.

SELECT E.DEPARTMENT_ID, COUNT(EMPLOYEE_ID) AS NoOfEmployee
FROM EMPLOYEE E
INNER JOIN DEPARTMENT D ON
E.DEPARTMENT_ID = D.Department_Id
WHERE E.DEPARTMENT_ID = '20' OR E.DEPARTMENT_ID = '40'
GROUP BY E.DEPARTMENT_ID;

--CONDITIONAL STATEMENT

--1.Display the employee details with salary grades. Use conditional statement to create a grade column.

SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) AS NameOfEmployee, EMPLOYEE_ID,SALARY,
CASE
    WHEN SALARY >= 2500 THEN 'GARDE A (High)'
    WHEN SALARY >= 2000 THEN 'GARDE B (Medium)'
    WHEN SALARY >= 1500 THEN 'GARDE C (Low)'
    WHEN SALARY < 1500 THEN 'GARDE D (Dihadi)'
END AS salaryGarde
FROM EMPLOYEE
ORDER BY salaryGarde ASC;

--2.List out the number of employees grade wise. Use conditional statement to create a grade column.

SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) AS NameOfEmployee,COUNT(EMPLOYEE_ID) AS NoOfEmployee,SALARY,
CASE
    WHEN SALARY >= 2500 THEN 'GARDE A (High)'
    WHEN SALARY >= 2000 THEN 'GARDE B (Medium)'
    WHEN SALARY >= 1500 THEN 'GARDE C (Low)'
    WHEN SALARY < 1500 THEN 'GARDE D (Dihadi)'
END AS salaryGarde
FROM EMPLOYEE
GROUP BY SALARY,CONCAT(FIRST_NAME,' ',LAST_NAME)
ORDER BY salaryGarde ASC;

--3.Display the employee salary grades and the number of employees between 2000 to 5000 range of salary.

SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) AS NameOfEmployee,COUNT(EMPLOYEE_ID) AS NoOfEmployee,SALARY,
CASE
    WHEN SALARY >= 2500 THEN 'GARDE A (High)'
    WHEN SALARY >= 2000 THEN 'GARDE B (Medium)'
END AS salaryGarde
FROM EMPLOYEE
WHERE SALARY BETWEEN 2000 AND 5000
GROUP BY SALARY,CONCAT(FIRST_NAME,' ',LAST_NAME)
ORDER BY salaryGarde ASC;

--Subqueries:
--1.Display the employees list who got the maximum salary.

SELECT * FROM EMPLOYEE
WHERE SALARY = (SELECT MAX(SALARY) FROM EMPLOYEE);

--2.Display the employees who are working in the sales department.

SELECT * FROM EMPLOYEE
WHERE DEPARTMENT_ID = (SELECT Department_Id FROM DEPARTMENT WHERE NAME = 'Sales');

--3.Display the employees who are working as 'Clerk'.

SELECT * FROM EMPLOYEE
WHERE JOB_ID = (SELECT JOB_ID FROM JOB WHERE Designation = 'Clerk');

--4.Display the list of employees who are living in 'Boston'.

SELECT * FROM EMPLOYEE
WHERE DEPARTMENT_ID =
(SELECT Department_Id FROM DEPARTMENT D 
INNER JOIN LOCATION L ON D.Location_Id = L.Location_ID
WHERE L.City = 'Boston'
);

--5.Find out the number of employees working in the sales department.

SELECT COUNT(EMPLOYEE_ID) FROM EMPLOYEE
WHERE DEPARTMENT_ID = (SELECT Department_Id FROM DEPARTMENT WHERE Name = 'Sales');

--6.Update the salaries of employees who are working as clerks on the basis of 10%.

UPDATE EMPLOYEE SET SALARY = (SALARY+SALARY*0.10)
WHERE JOB_ID = (SELECT JOB_ID FROM JOB WHERE Designation = 'Clerk');

--7.Display the second highest salary drawing employee details.

SELECT * FROM EMPLOYEE
WHERE SALARY IN (SELECT MAX(SALARY) AS maxsal FROM EMPLOYEE
WHERE SALARY < (SELECT MAX(SALARY) AS maxsal FROM EMPLOYEE));

--8.List out the employees who earn more than every employee in department 30.

SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,SALARY,DEPARTMENT_ID FROM EMPLOYEE
WHERE SALARY = (SELECT MAX(SALARY) FROM EMPLOYEE WHERE DEPARTMENT_ID = 30);

--9.Find out which department has no employees.

SELECT Department_Id,Name FROM DEPARTMENT
WHERE DEPARTMENT_ID NOT IN (SELECT DEPARTMENT_ID FROM EMPLOYEE);

--10.Find out the employees who earn greater than the average salary for their department.

SELECT * FROM EMPLOYEE E
WHERE SALARY = (SELECT AVG(SALARY) FROM EMPLOYEE WHERE DEPARTMENT_ID = E.DEPARTMENT_ID GROUP BY DEPARTMENT_ID);