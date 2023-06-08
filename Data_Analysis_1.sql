Select * from [dbo].[Regions];
Select * from [dbo].[Country];
Select * from [dbo].[Job];
Select * from [dbo].[Department];
Select * from [dbo].[Employee];

/**************Find employees and department based on certain condition***********/

--Find the list of departments that comes under manager_id 100028
Select *from Department where manager_Id=100028;

--Find the list of departments that does not belongs to manager_id 100028
Select * from Department where manager_Id <> 100028;

--Find the list of employees having salary more than 70000
Select * from Employee where salary > '70000';

--Find Name,email,phone_number from employee table having salary more than 70000
Select Employee_Name,email,phone_number from EMployee where salary > '70000';

--Find list of employees belonging to Marketing Department and having salary <=90000;
Select * from Employee E
Inner Join Department D On E.department_id = D.Id
where D.Department_Name = 'Marketing' and E.salary <= '90000';

/***************Display records in orderedmanner and dealing with NULL values************/

--Find employees having no department 
Select * from Employee where department_id = 0;

--Find he employees details where manager not available
Select * from Employee where manager_Id =0;

--Find the details of employee in ascending order of their name
Select * from Employee order by Employee_Name ASC;

--Find employee details belonging to England in ascending order of job
Select * from Employee where country_id = 8 order by job_id asc;

/****************Search for specific pattern in a column************/

--Find employees who work as Human Resource and Accounting
Select * from Employee E
inner join Job j on E.Job_Id = J.Id
where J.Job_Name in ('Accounting','Human Resource');
				--OR--
Select * from Employee where JOb_Id in('AC101','HR106');

--Find employees who does not work as Human Resource and Accounting
Select * from Employee E
inner join Job j on E.Job_Id = J.Id
where J.Job_Name not in ('Accounting','Human Resource');
			--OR--
Select * from Employee where JOb_Id not in('AC101','HR106');

--Find employees whose Job_id starts with QT
Select * from Employee where Job_Id Like 'QT%';

--Find employees whose Job_id not starts with EN
Select * from Employee where JOb_Id not Like 'EN%';

--Find employees whose Job_id neither starts with EN nor with QT
Select * from Employee where Job_Id not like 'EN%' and Job_Id not like 'QT%';


