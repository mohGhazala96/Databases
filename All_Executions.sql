EXEC Company_Search NULL , NULL , 'International'
EXEC Company_Search 'Microsoft' , NULL , 'International'
EXEC Company_Search NULL ,'Tesla Motors. 3500 Deer Creek Road.Palo Alto, CA 94304.' ,NULL

EXEC List_Of_Companies

EXEC View_Company_Department 'hr@Microsoft.com'

EXEC Department_Jobs 'hr@Microsoft.com' , 1

EXEC Register 'Khalid.K' , 'abcdef' , 'Mamdouh@gmail.com' , '03/12/1990'  , 15 , 'Khalid' , 'Mohamed' , 'Mamdouh'

EXEC Search_Job 'innovating'
EXEC Search_Job 'CEO'
EXEC Search_Job 'Teach Company'

EXEC Jobs_Sorted

GO
DECLARE @out1 varchar(100)
EXEC Login 'Albert.enstein' , 'abcdef' , @out1 OUTPUT
print @out1

DECLARE @out2 varchar(100)
EXEC Login 'Ahmed.Mohamed' , 'ab123' , @out2 OUTPUT
print @out2

EXEC View_Information 'Ahmed.Massoud'
exec Review_Job_Status 'Hossam.Azzab'

EXEC Edit 'John.Harris' , 'abcdef' , 'Mostafa.Mamdouh@gmail.com' , '03/12/1990'  , 15 , 'Mostafa' , 'Ahmed' , 'Mamdouh' 

EXEC Apply 'Engineer' , 6 , 'info@facebook.com' , 'Albert.enstein'
EXEC Apply 'Engineer' , 6 , 'info@facebook.com' , 'John.Harris'
EXEC Apply 'Engineer' , 6 , 'info@facebook.com' , 'John.Harris'

EXEC View_Question  'CEO' , 9 , 'info@tesla.com' 
EXEC View_Question  'Engineer' , 2 , 'hr@Microsoft.com'

EXEC Save_Score  'Engineer' , 6 , 'info@facebook.com' , 'Albert.enstein'  , 100
EXEC Save_Score  'CEO' , 9 , 'info@tesla.com' , 'John.Steve'  , 50

EXEC Choose_Job 'Engineer', 6, 'info@facebook.com','Khaled.Hanafy','Saturday'

EXEC Delete_Job 'Graphics Designer', 8, 'info@facebook.com','Hello.world'

exec Check_in 'ElonMusk'

exec Check_out 'ElonMusk'

exec Review_Attendance 'ElonMusk', '2017-11-19'

exec Apply_for_Leave_Request 'ElonMusk', 'BenedictCumberbatch', '2017-11-27', '2017-12-3', 'Medical'
exec Apply_for_Leave_Request 'JenniferLaw', 'BenedictCumberbatch', '2017-11-27', '2017-12-3', 'Medical'
exec Apply_for_Leave_Request 'JenniferLaw', 'EmmaStone', '2017-11-27', '2017-12-3', 'Medical'

exec Apply_for_Business_Request 'bakr.mostafa', 'ElonMusk', '2017-11-27', '2017-12-3', 'Cairo','Buy'
exec Apply_for_Business_Request 'bakr.mostafa', 'osaasdadma.rady', '2017-11-27', '2017-12-3', 'Cairo','Buy'

exec Apply_for_Business_Request 'JenniferLaw', 'BenedictCumberbatch', '2017-11-27', '2017-12-3', 'Cairo', 'Buy'
exec Apply_for_Business_Request 'JenniferLaw', 'EmmaStone', '2017-11-27', '2017-12-3', 'Cairo', 'Buy'

exec Delete_Request '2017-11-27', 'JenniferLaw'

exec Send_email 'ElonMusk', 'JenniferLaw','Welcome','You are awesome'

exec View_emails 'JenniferLaw'

exec Reply_email 'JenniferLaw', 1, 'Thank you!','I Love you too'

exec View_Announcements 'ElonMusk'

--hr 1
declare @q_list q_list
INSERT INTO @q_list VALUES('Is this true?', 'True'), ('Really?', 'False')
SELECT * FROM @q_list

EXEC HR_Employees_add_job "JenniferLaw",
                          "Rocket Scientist",
                          "Mad scientists",
                          "It's not rocket science? Surprise, it is.",
                          2,
                          250000,
                          "12/12/2020",
                          5,
                          8,
                          @q_list;
--hr 2
EXEC HR_Employees_view_job "JenniferLaw", "Rocket Scientist"
--hr 3
EXEC HR_Employees_update_job "JenniferLaw",
                             "Rocket Scientist",
                             "Rocket Scientistaaaa",
                             "Scienziati pazzi",
                             "Non è scienza missilistica? Sorpresa, lo è.",
                             20,
                             25000,
                             "12/12/2021",
                             4,
                             10;
--hr 4
EXEC HR_Employees_view_applications "tarek.osman", "Engineer"
--hr 5
EXEC HR_Employees_accept_reject_applications "tarek.osman", "Ashraf.Zaki", "Engineer", "Approved"
--hr 6
EXEC HR_Employees_create_announcement "tarek.osman",
                                      "Deadline extension",
                                      "type",
                                      "The databases milestone deadline has been extended to 12/12/2021"
--hr 7

EXEC HR_Employees_view_requests "JenniferLaw"
--hr 8
EXEC HR_Employees_update_requests 'JenniferLaw', /* Accept non-leave request */
                                  'BenedictCumberbatch',
                                  '9/26/2017 15:00:00',
                                  'Approved'

EXEC HR_Employees_update_requests 'JenniferLaw', /* Reject non-leave request */
                                  'BenedictCumberbatch',
                                  '9/26/2017 16:00:00',
                                  'Rejected'

EXEC HR_Employees_update_requests 'JenniferLaw', /* Accept annual leave request */
                                  'BenedictCumberbatch',
                                  '9/27/2017 16:00:00',
                                  'Rejected'

EXEC HR_Employees_update_requests 'JenniferLaw', /* Accept annual leave request with not enough annual leaves */
                                  'BenedictCumberbatch',
                                  '9/26/2017 16:00:00',
                                  'Rejected'

EXEC HR_Employees_update_requests 'JenniferLaw', /* Accept accidental leave request */
                                  'BenedictCumberbatch',
                                  '9/26/2017 16:00:00',
                                  'Rejected'
--hr 9
EXEC HR_Employees_view_attendance 'JenniferLaw', '2012-01-01 08:00:00', '2022-12-12 09:00:00'
--hr 10
EXEC HR_Employees_total_hours 'JenniferLaw', 2012
-- hr11
EXEC HR_Employees_view_high_achievers "tarek.osman"
--regular 1
EXEC Regular_Employees_view_projects "Mona.Osman"
--regular 2
EXEC Regular_Employees_view_tasks "Rowan.Ibrahim", "Animation Video"
--regular 3
EXEC Regular_Employee_finalize_task "Rowan.Ibrahim", "Animation Video", "task7"

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
