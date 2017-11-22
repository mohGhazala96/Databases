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
exec Apply_for_Business_Request 'ElonMusk', 'BenedictCumberbatch', '2017-11-27', '2017-12-3', 'Cairo','Buy'

exec Apply_for_Business_Request 'JenniferLaw', 'BenedictCumberbatch', '2017-11-27', '2017-12-3', 'Cairo', 'Buy'
exec Apply_for_Business_Request 'JenniferLaw', 'EmmaStone', '2017-11-27', '2017-12-3', 'Cairo', 'Buy'

exec Delete_Request '2017-11-27', 'JenniferLaw'

exec Send_email 'ElonMusk', 'JenniferLaw','Welcome','You are awesome'

exec View_emails 'JenniferLaw'

exec Reply_email 'JenniferLaw', 1, 'Thank you!','I Love you too'

exec View_Announcements 'ElonMusk'
