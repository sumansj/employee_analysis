/********Create View for Employee Reports*********/
Create or Alter View vw_employee_reports
As
Select e.Id,e.Employee_Name,r.Region_Name,c.Country_Name,d.Department_Name,j.Job_Name,e.email,e.phone_number,e.salary
from Employee e,Regions r,Country c,Department d,JOb j
where e.region_id=r.Id and
e.country_id=c.Id and
e.department_id=d.Id and
e.job_id=j.Id;