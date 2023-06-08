--Exec [dbo].[SP_Employee_Insert];
ALTER   Procedure [dbo].[SP_Employee_Insert]
AS
Begin
	--Create Temp table
	Create Table #Employee_temp(
	Id int,
	Employee_Name varchar(20),
	email varchar(100),
	phone_number varchar(15),
	hire_date date,
	salary varchar(15),
	region_id int,
	country_id int,
	department_id int,
	manager_id int,
	Job_id varchar(5),
	Updated_On datetime
	);

	--Insert into temp table from stage table
	Insert into #Employee_temp(Id,Employee_Name,email,phone_number,hire_date,salary,region_id,country_id,department_id,manager_id,Job_id,Updated_On)
	Select Id,Employee_Name,email,phone_number,hire_date,salary,region_id,country_id,department_id,manager_id,Job_id,Getutcdate()
	from Stage.Employee;

	--Removeing spaces from Name column
	Update #Employee_temp set Employee_Name = Replace(Replace(Employee_Name,' ',''),'  ','');

	--Updateing the email id.
	Update #Employee_temp set email=Concat(Employee_Name,'@internal.com');

	--Insert into main table
	Insert into dbo.Employee(Employee_Name,email,phone_number,hire_date,salary,region_id,country_id,department_id,manager_id,Job_id,Updated_On)
	Select Employee_Name,email,phone_number,hire_date,salary,region_id,country_id,department_id,manager_id,Job_id,Getutcdate()
	from #Employee_temp;

	Drop Table #Employee_temp;
End;