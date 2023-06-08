/**********Create Table*****************/
Create Table Regions(
Id int Identity(100,1),
Name Varchar(20)
);

ALter Table Regions Add Constraint pk_id Primary Key(Id);

Create Table Country(
Id int Identity(1,1),
Name varchar(10)
);

Alter Table Country Alter Column Name varchar(50);
Alter Table Country Add Region_id Int;
Alter Table Country Add Constraint pk_cid Primary Key(Id);
Alter Table Country Add Constraint fk_regionId Foreign Key (Region_id) References Regions(Id);

Create Table Job(
Id int,
Name varchar(20),
Min_Salary varchar(10),
Max_Salary varchar(15),
);

Alter Table Job Drop Column Min_Salary;
Alter Table Job Drop Column Max_Salary;

Create Table Department(
Id int Identity(10000,1) Primary Key,
Name varchar(20),
job_id varchar(5)
);

Alter Table Department Add Constraint FK_job_id Foreign Key(Job_Id) References Job(Id);
Alter Table Department Add manager_Id int;
Alter Table Department Alter Column Name varchar(50);

Create Table Employee(
Id int Identity(100000,1) Primary Key,
Name varchar(20),
email varchar(50),
phone_number varchar(15),
hire_date date,
salary varchar(15),
region_id int Foreign Key References Regions(Id),
country_id int Foreign Key References Country(Id),
job_id varchar(5),
department_id int Foreign Key References Department(Id)
);
Alter Table Employee Add manager_Id int;
Alter Table Employee Add Constraint FK_Employee_job_id Foreign Key(Job_Id) References Job(Id);
Alter Table Employee Add Updated_On Datetime;

Create Table dbo.Employee_His(
Employee_Id int,
Emloyee_Name varchar(50),
start_date date,
end_date date,
job_id varchar(5),
department_id int
);
ALter Table Employee Alter Column Salary float;

/********Created tables in archive schema to keep record of archive data deleted**********/
Create Table archive.Employee(
Id int Identity(1000000,1) Primary key,
Employee_Id int,
Emloyee_Name varchar(20),
email varchar(50),
phone_number varchar(15),
hire_date date,
salary varchar(15),
region_id int,
country_id int,
department_id int,
manager_id int,
job_id varchar(5)
);

Alter Table archive.Employee Add Deleted_On datetime;
Alter Table [archive].[Employee] Add Deleted_By nvarchar(100);

/**********Create Log Table to track the activity********/
Create Table dbo.DataLog(
Id int Identity(100,1),
ProcessName varchar(200),
Updated_On Datetime
);

Alter Table [dbo].[DataLog] Add Updated_By nvarchar(200);

/***********Create table in audit schema to keep a track of record updated*************/
Create Table audit.EmailUpdate(
Id int,
oldEmail varchar(50),
newEmail varchar(50),
Updated_On Datetime,
Updated_By nvarchar(200)
);

Create Table audit.Employee_His(
Employee_Id int,
Employee_Name varchar(50),
start_date date,
end_date date,
job_id varchar(5),
department_id int
)

/***************Create table in stage schema****************/
Create Table stage.Employee(
Id int Identity(100000,1) Primary Key,
Employee_Name varchar(100),
email varchar(50),
phone_number varchar(15),
hire_date date,
salary float,
region_id int Foreign Key References Regions(Id),
country_id int Foreign Key References Country(Id),
manager_id int,
department_id int Foreign Key References Department(Id),
job_id varchar(5),
);