Create or Alter Procedure dbo.SP_Employee_History(
@emp_id int,
@job_id varchar(5),
@department_id int
)

AS
Begin
	EXEC dbo.SP_DataLog 'Update Employee data Start';
	--Insert data into Employee_Update Table
	Insert into audit.Employee_His(Employee_Id,Employee_Name,start_date,end_date,job_id,department_id)
	Select Id,Employee_Name,hire_date,getutcdate(),job_id,department_id from dbo.Employee where Id = @emp_id;

	--Update new data in Employee Table
	Update dbo.Employee Set Job_Id=@job_id,department_id=@department_id where Id=@emp_id;
	EXEC dbo.SP_DataLog 'Update Employee data End';
End;