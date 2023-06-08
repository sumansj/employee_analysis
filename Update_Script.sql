/*************Update Manager_id in Department Table**********/
Update Department Set manager_id =100115 where job_id='BD103';
Update Department Set manager_id =100019 where job_id='Fn102';
Update Department Set manager_id =100000 where job_id='AC101';
Update Department Set manager_id =100003 where job_id='QT104' and Id in(10016,10016,10017,10018,10019);
Update Department Set manager_id =100015 where job_id='QT104' and Id in(10020,10021);
Update Department Set manager_id =100028 where job_id='EN105' and Id in (10022,10023,10024,10025);
Update Department Set manager_id =100036 where job_id='EN105' and Id in (10026,10027,10028,10029);
Update Department Set manager_id =100058 where job_id='EN105' and Id in (10030,10031,10032,10033);
Update Department Set manager_id =100071 where job_id='HR106' and Id in (10034,10035,10036,10037);
Update Department Set manager_id =100095 where job_id='HR106' and Id in (10038,10039,10040);

/***********Update Manager_Id in Employee Table*******/
Update Employee Set manager_id = 100028 where Job_id ='EN105' and department_id in (10022,10023,10024,10025) and Id not in(100028,100036,100058);
Update Employee Set manager_id = 100036 where Job_id ='EN105' and department_id in (10026,10027,10028,10029) and Id not in(100028,100036,100058);
Update Employee Set manager_id = 100058 where Job_id ='EN105' and department_id in (10030,10031,10032,10033) and Id not in(100028,100036,100058);
Update Employee Set manager_id = 100003 where Job_id ='QT104' and department_id in (10016,10017,10018,10019) and Id not in(100003,100015);
Update Employee Set manager_id = 100015 where Job_id ='QT104' and department_id in (10020,10021) and Id not in(100003,100015);
Update Employee Set manager_id = 100071 where Job_id ='HR106' and department_id in (10034,10035,10036,10037) and Id not in(100071,100095);
Update Employee Set manager_id = 100095 where Job_id ='HR106' and department_id in (10038,10039,10040) and Id not in(100071,100095);
Update Employee Set manager_id = 100071 where Job_id ='AC101' and department_id in (10005,10006,10007,10008) and Id not in(100000);
Update Employee Set manager_id = 100019 where Job_id ='Fn102' and department_id in (10009,10010,10011,10012) and Id not in(100019);
Update Employee Set manager_id = 100115 where Job_id ='BD103' and department_id in (10013,10014,10015) and Id not in(100115);