--EXEC dbo.[SP_Employee_Delete] 100120;
Create or Alter Procedure dbo.[SP_Employee_Delete](
@Id int
)
AS
Declare
	@EmployeeId int;
	Select @EmployeeId = Id from dbo.Employee where dbo.Employee.Id = @Id;
Begin
	EXEC dbo.[Sp_DataLog] 'Start Employee Data Delete';
	--Insert deleted record into archive.Employee table
	Insert into archive.Employee ([Employee_Id],[Emloyee_Name],[email],[phone_number],[hire_date],[salary],[region_id],
	[country_id],[department_id],[manager_id],[job_id],[Deleted_On],[Deleted_By])
	Select e.Id,e.[Employee_Name],e.[email],e.[phone_number],e.[hire_date],e.[salary],e.[region_id],e.[country_id],
	e.[department_id],e.[manager_Id],e.[Job_Id],Getutcdate(),SUSER_NAME() from dbo.Employee e where e.Id= @EmployeeId;

	--Delete data from dbo.Employee table
	Delete from dbo.Employee where Id = @EmployeeId;

	EXEC dbo.[Sp_DataLog] 'Stop Employee Data Delete';
End;