--regular 4
EXEC Work_on_task_again 'Rowan.Ibrahim', 'task6',1 -- to  change the status is optional , choose 1 else 0
--manager 1
EXEC View_New_Requests 'bakr.mostafa'--hr type
EXEC View_New_Requests 'osama.rady' 
--manager 2
EXEC Change_Request_state 'osama.rady','1/10/2017 11:00:00', 'Mona.Osman','Approved','reason'
--manager 3
EXEC View_All_Applications 'osama.rady','Engineer'
--manager 4
EXEC Edit_Application 'osama.rady','Rejected','Khaled.Hanafy','Engineer'
--manager 5
EXEC Create_project 'osama.rady','project1','info@facebook.com','9/2/2017 00:00:00', '10/2/2017 00:00:00'
--manager 6
EXEC Assign_regular_employees_on_projects 'osama.rady','project1','Amina.Abaas'
--manager 7
exec Remove_regular_employee_from_project'osama.rady','project1','Amina.Abaas'
--manager 8
exec Define_task 'task0','project1','info@facebook.com','9/2/2018 00:00:00','description','osama.rady' -- the insertion is based on pervius procedure
--manager 9
exec Assign_regular_employee_on_task 'emad.sherif','Logo','task_Logo' ,'Doaa.Ahmed'
--manager 10
exec Change_regular_employee_on_a_task 'emad.sherif','Logo','task_Logo' ,'Rowan.Ibrahim'
--manager 11
exec View_list_of_tasks_in_project 'emad.sherif','Logo','Assigned'
--manager 12
exec Review_task_in_a_project 'emad.sherif','task5','Animation Video',0,'12/2/2018 00:00:00' -- 0 reject 1 accept
