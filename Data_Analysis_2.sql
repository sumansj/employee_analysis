Select * from [dbo].[Regions];
Select * from [dbo].[Country];
Select * from [dbo].[Job];
Select * from [dbo].[Department];
Select * from [dbo].[Employee];

/*************Display employee details for particular department*************/
Select * from Employee E
inner join Department D on D.Id = E.department_id
where D.Department_Name = 'Financial Planner';

Select * from Employee E
inner join Department D on D.Id = E.department_id
inner join Country C on E.country_id=C.Id
where D.Department_Name = 'Financial Planner'
and C.Country_Name ='Egypt';

/***********List down all the department along the employee under it********/
Select D.Id, D.Department_Name, E.Employee_Name
from Department D
Left join Employee E
on D.Id = E.department_id;

/******List down all the employee along with their department*******/
Select E.Id, D.Department_Name, E.Employee_Name
from Department D
Right join Employee E
on D.Id = E.department_id;

--Fetch data of those employees who is having Id greater thsn 100020
Select E.Id,E.Employee_Name,D.Id,D.Department_Name from
Employee E inner join Department D
on E.department_id=D.Id where E.Id>100020;

