----EXEC [dbo].[SP_Email_Update] 100001,'AARON_KARINA@internal.com'
Create or Alter Procedure [dbo].[SP_Email_Update](
@EmployeeId int,
@NewEmail varchar(50)
)
As
Begin
	--insert into audit table
	Insert into [audit].[EmailUpdate] 
	(Id,oldEmail,newEmail,Updated_On,Updated_By)
	Select Id,email,@NewEmail,getutcdate(),suser_name()
	from [dbo].[Employee] where Id = @EmployeeId;

	--update into employee table
	Update [dbo].[Employee]
	Set email = @NewEmail
	where Id = @EmployeeId;
End;