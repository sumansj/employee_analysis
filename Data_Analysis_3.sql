Select * from [dbo].[Regions];
Select * from [dbo].[Country];
Select * from [dbo].[Job];
Select * from [dbo].[Department];
Select * from [dbo].[Employee];

/****************Data Analysis using Sub Query**********/

--Find ther department where employees are tagged into it
Select D.Id,D.Department_Name from
Department D where D.Id in(
Select E.Department_Id from Employee E);

--Implemnting above case using join
Select D.Id,D.Department_Name from
Department D inner join Employee E
on D.Id=E.department_id;

--Find employee work as Business Development for department Business Development Analyst having salary greater than 80000
Select * from Employee where Job_Id in(
Select Id from Job where Job_Name ='Business Development')
and department_id in( select Id from Department where Department_Name = 'Business Development Analyst')
and salary > 80000;

--Find only those employee along with the department name and country is India
Select E.Employee_Name,D.Department_Name,C.Country_Name from 
Employee E inner join Department D
on D.Id = E.department_id
inner join Country C
on E.country_id = C.Id
and C.Country_Name ='India';

--Find all employee along with the department name and country is India
Select E.Employee_Name,D.Department_Name,C.Country_Name from 
Employee E left join Department D
on D.Id = E.department_id
left join Country C
on E.country_id = C.Id
and C.Country_Name ='India';

/***************Aggregate Function********/

--Find Maximum Salary of the employee
Select max(salary) As Salary from Employee;

--List down the employee details who is getting maximum salary
Select * from employee
where salary in (select max(salary) from employee);

--Find the Minimum Salary of the employee
Select min(Salary) As Salary from Employee;

--List down the employee details who is getting maximum salary
Select * from employee
where salary in (Select min(Salary) As Salary from Employee);

--Find the average salary of employee
Select Avg(Salary) As Salary from Employee;

-- List down all employees geting greater salary than average salary
Select * from Employee
where salary > (Select Avg(Salary) from Employee);

--Find maximum salary and number of employees who are working in Engineering department and hired after 2005.
Select Max(Salary) As Salary, Count(*) As No_of_Employee from Employee
where Job_Id = 'EN105' and datepart(year,hire_date) > '2005';