Select * from [dbo].[Regions];
Select * from [dbo].[Country];
Select * from [dbo].[Job];
Select * from [dbo].[Department];
Select * from [dbo].[Employee];

--Find maximum salary from each department.
Select D.Department_Name,Max(E.Salary) As Maximum_Salary
from Department D inner join Employee E
on D.Id=E.department_id
Group by D.Department_Name;

--Find Department wise maximum salary, number of employees, sum of salary
Select D.Department_Name,Max(E.Salary) As Maximum_Salary,Count(E.Id) AS Number_Of_Employees,Sum(E.Salary) As Sum_Of_Salary
from Department D inner join Employee E
on D.Id=E.department_id
Group by D.Department_Name;

--Find Country wise number of Employees
Select C.Country_Name,Count(E.Id) As Number_Of_Employee
from Country C inner join Employee E
on C.Id=E.country_id
Group by C.Country_Name;

--Find the number of employee working under each manager.
Select M.Id As Manager_Id, M.Employee_Name As Manager_Name, COunt(E.Id) AS Number_Of_Employee
from Employee E inner join Employee M
on E.manager_Id = M.Id
Group by M.Id,M.Employee_Name;

--Find department wise maximum salary in ordered way where maximum salary 90000
Select D.Department_Name,Max(E.Salary)As Maximum_Salary
from Department D inner join Employee E
on D.Id=E.department_id
group by D.Department_Name
Having Max(E.Salary) > 90000
Order by Max(E.Salary)Asc;

--Show Department wise analysis
Select D.Id,D.Department_Name,Min(E.Salary) As Minimum_Salary,Max(E.Salary) As Maximum_Salary,Count(E.Id) As Number_Of_Employee, 
M.Id As ManagerId
from Department D inner join Employee E
on D.Id=E.department_id
Inner Join Employee M
on E.manager_Id = M.Id
Group by D.Department_Name,D.Id,M.Id;

--Retrive all the department records where employee exists using EXISTS statement
Select * from Department D
where Exists(Select 1 from Employee E where E.department_id=D.Id);

--Retrive department wise number of manager and records
Select D.Department_Name,Count(E.Manager_Id) As Number_Of_Manager
from Department D inner join Employee E
on E.department_id = D.Id
Group by D.Department_Name;

--Categorise employees based on hire dates
Select E.Id,E.Employee_Name,E.hire_date,
case
	when datepart(year,E.hire_date) < '1980' Then 'Before 1980'
	when datepart(year,E.hire_date) Between '1980' and '1990' Then 'Between 1980 and 1990'
	when datepart(year,E.hire_date) Between '1990' and '2000' Then 'Between 1990 and 2000'
	when datepart(year,E.hire_date) Between '2000' and '2010' Then 'Between 2000 and 2010'
	when datepart(year,E.hire_date) Between '2010' and '2020' Then 'Between 2010 and 2020'
	Else 'Not categorized'
End
from Employee E;