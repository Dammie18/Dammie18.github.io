create database Employee_Sql_Practice

create table EmployeeInfo (
	EmpID int,
	EmpFname varchar(99),
	EmpLname varchar (99),
	Department varchar(99),
	Project varchar(99),
	Address varchar(99),
	DOB Date,
	Gender Char(1)
)

select * 
from EmployeeInfo

insert into EmployeeInfo
values ('1', 'Sanjay', 'Mehra', 'HR', 'P1', 'Hyderabad(HYD)', '12/1/1976', 'M'),
		('2', 'Ananya', 'Mishra', 'Admin', 'P2', 'Delhi(DEL)', '5/2/1968', 'F'),
		('3', 'Rohan', 'Diwan', 'Account', 'P3', 'Mumbai(BOM)', '1/1/1980', 'M'),
		('4', 'Sonia',	'Kulkarni', 'HR', 'P1', 'Hyderabad(HYD)', '5/2/1992', 'F'),
		('5', 'Ankit', 'Kapoor', 'Admin', 'P2', 'Delhi(DEL)', '7/3/1994', 'M')

create table EmployeePosition(
	EmpID int,
	EmpPosition varchar(99),
	DateOfJoining date,
	Salary int
)

select *
from EmployeePosition

insert into EmployeePosition
values ('1', 'Manager', '5/1/2022', '500000'),
		('2', 'Executive', '5/2/2022', '75000'),
		('3', 'Manager', '5/1/2022', '90000'),
		('4', 'Lead', '5/2/2022', '85000'),
		('5', 'Executive', '5/1/2022', '300000')

--QUESTION 1
select upper(EmpFname) as EmpName
from EmployeeInfo

--QUESTION 2
select count (EmpID)
from EmployeeInfo
where Department = 'HR'

--QUESTION 3
select getdate()

--QUESTION 4
select left(EmpLname, 4)
from EmployeeInfo

--QUESTION 5
select substring(Address, 0, charindex('(', Address))
from EmployeeInfo

--QUESTION 6
select *
from EmployeeInfo
join EmployeePosition
on EmployeeInfo.EmpID = EmployeePosition.EmpID

--QUESTION 7
select * 
from EmployeePosition
where Salary between 50000 and 100000

--QUESTION 8
select *
from EmployeeInfo
where EmpFname like 'S%'

--QUESTION 9
select top 3*
from EmployeeInfo

--QUESTION 10
select EmpFname + ' ' + EmpLname as FullName
from EmployeeInfo

--QUESTION 11
/*select count (*)
from EmployeeInfo
where DOB between '1970/05/02' and '1995/12/31'*/

select count(*), Gender
from EmployeeInfo
where DOB between '1970/05/02' and '1995/12/31'
group by Gender

--QUESTION 12
select *
from EmployeeInfo
order by EmpLname desc, Department asc

--QUESTION 13
select *
from EmployeeInfo
where EmpLname like '____a'

--QUESTION 14
select *
from EmployeeInfo
where EmpFname not in ('Sanjay', 'Sonia')

--QUESTION 15
select *
from EmployeeInfo
where Address = 'Delhi(DEL)'

--QUESTION 16
select *
from EmployeePosition
where EmpPosition = 'Manager'

--QUESTION 17
select Department, count(EmpID) as EMpDeptCount
from EmployeeInfo 
group by Department
order by EMpDeptCount asc

--QUESTION 18
select *
from EmployeeInfo
where Department = 'HR' and Gender = 'M'

--QUESTION 19
select *
from EmployeeInfo
inner join EmployeePosition
on EmployeeInfo.EmpID = EmployeePosition.EmpID

--QUESTION 20
select min (Salary)
from EmployeePosition
union
select min (Salary) 
from EmployeePosition
where Salary > (select min (Salary) from EmployeePosition)


select max (Salary)
from EmployeePosition
union
select max (Salary) 
from EmployeePosition
where Salary < (select max (Salary) from EmployeePosition)
