Create or ALter Procedure dbo.[SP_DataLog](
@ProcessName varchar(200)
)
AS
Begin
	Insert into dbo.DataLog(ProcessName,Updated_On)
	Values(@ProcessName,GetUtcDate());
End;