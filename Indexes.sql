/*****************Index Creation**************/

Create Unique Index UIX_Job_Id On Job(Id);

Create NonCLustered Index NIX_Country_Name On Country(Country_Name);

Create NonCLustered Index NIX_Department_Name On Department(Department_Name);

Create NonCLustered Index NIX_Employee_Name On Employee(Employee_Name);

Create NonCLustered Index NIX_Employee_email On Employee(email);

Create NonCLustered Index NIX_Job_Name On Job(Job_name);

Create NonCLustered Index NIX_Region_Name On Regions(Region_name);