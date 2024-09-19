CREATE DATABASE [Sql Question]

CREATE TABLE Employee_Details(
	EmpId INT,
	FullName VARCHAR(99),
	ManagerId INT,
	DateOfJoining DATE,
	City VARCHAR(99)
)

SELECT *
FROM Employee_Details

SELECT *
FROM Employee_Salary

INSERT INTO Employee_Details
VALUES ('121', 'John Snow', '321', '01/31/2019', 'Toronto'),
		('321', 'Walter White', '986', '01/30/2020', 'California'),
		('421', 'Kuldeep Rana', '876', '11/27/2021', 'New Delhi'),
		('655', 'Alex Brown', '955', '02/28/2020', 'London'),
		('577', 'Chris George', '487', '04/02/2021', 'Manchester')

CREATE TABLE Employee_Salary (
	EmpId INT,
	Project VARCHAR(50),
	Salary INT,
	Variable INT
)

INSERT INTO Employee_Salary
VALUES ('121', 'P1', '8000', '500'),
		('321', 'P2', '10000', '1000'),
		('421', 'P1', '12000', '0'),
		('655', 'P1', '14000', '500'),
		('577', 'P2', '16000', '1000')

--QUESTION 1
SELECT EmpId, FullName
FROM Employee_Details
WHERE ManagerId = '986'

--QUESTION 2
SELECT Project
FROM Employee_Salary

--QUESTION 3
SELECT COUNT (Project)
FROM Employee_Salary
WHERE Project = 'P1'

--QUESTION 4
SELECT MAX (Salary)
FROM Employee_Salary

SELECT MIN (Salary)
FROM Employee_Salary

SELECT AVG (Salary)
FROM Employee_Salary

--QUESTION 5
SELECT EmpId
FROM Employee_Salary
WHERE Salary BETWEEN 9000 AND 15000

--QUESTION 6
SELECT *
FROM Employee_Details
WHERE City = 'Toronto' AND ManagerId = '321'

--QUESTION 7
SELECT *
FROM Employee_Details
WHERE City = 'California' OR ManagerId = '321'

--QUESTION 8
SELECT *
FROM Employee_Salary
WHERE Project != 'P1'

--QUESTION 9
ALTER TABLE Employee_Salary
ADD TotalSalary INT

UPDATE Employee_Salary
SET TotalSalary = (Salary + Variable)

--QUESTION 10
SELECT FullName
FROM Employee_Details
WHERE FullName LIKE '__hn%'

--QUESTION 11
SELECT EmpId FROM Employee_Details
UNION
SELECT EmpId FROM Employee_Salary
