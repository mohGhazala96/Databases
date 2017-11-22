
-- add new 8 users
INSERT INTO Users
VALUES
    ('Doaa.Ahmed', 'tobeornottobe', 'Doaa.Ahmed@Hotmail.com', '7/2/1975 00:00:00', 7, 'Doaa', 'Mohamed', 'Ahmed');
INSERT INTO Users
VALUES
    ('Rowan.Ibrahim', 'hala_beek_hala', 'Rowan.Ibrahim@Yahoo.com', '8/21/1976 00:00:00', 11, 'Rowan', 'Mostafa', 'Ibrahim');
INSERT INTO Users
VALUES
    ('Amina.Abaas', 'hussien_al_jasmi', 'Amina.Abaas@Hotmail.com', '9/18/1970 00:00:00', 9, 'Amina', 'Ashraf', 'Abaas');
INSERT INTO Users
VALUES
    ('Mona.Osman', 'ellonmeshellon', 'Mona.Osman@Gmail.com', '11/3/1979 00:00:00', 5, 'Mona', 'Ali', 'Osman');
INSERT INTO Users
VALUES
    ('Ashraf.Zaki', 'billkoftakormb', 'Ashraf.Zaki@Hotmail.com', '5/7/1974 00:00:00', 3, 'Ashraf', 'Ibrahim', 'Zaki');
INSERT INTO Users
VALUES
    ('Mahmoud.Hassan', 'war2_3nb', 'Mahmoud.Hassan@Gmail.com', '2/9/1978 00:00:00', 10, 'Mahmoud', 'Hamad', 'Hassan');
INSERT INTO Users
VALUES
    ('Khaled.Hanafy', 'keyskeyskeys', 'Khaled.Hanafy@Hotmail.com', '3/12/1982 00:00:00', 6, 'Khaled', 'Mohsen', 'Hanafy');
INSERT INTO Users
VALUES
    ('Hossam.Azzab', 'phonebehoney', 'Hossam.Azzab@Gmail.com', ' 6/24/1984 00:00:00', 4, 'Hossam', 'Shaker', 'Azzab');
-- job seekers
INSERT INTO Job_Seekers
VALUES
    ('Hossam.Azzab')
INSERT INTO Job_Seekers
VALUES
    ('Khaled.Hanafy')
INSERT INTO Job_Seekers
VALUES
    ('Mahmoud.Hassan')
INSERT INTO Job_Seekers
VALUES
    ('Ashraf.Zaki')
-- add 4 staff memebers
--info@facebook.com info@tesla.com Assigned Open Fixed
INSERT INTO Staff_Members
VALUES
    ('Mona.Osman', 10,'Mona.Osman@facebook.com', 'Friday', 70000, 'Engineer', (select code
        FROM Departments
        WHERE name='Online Operations' and company='info@facebook.com'), 'info@facebook.com');
INSERT INTO Staff_Members
VALUES
    ('Amina.Abaas', 12,'Amina.Abaas@facebook.com', 'Monday', 60000, 'Engineer', (select code
        FROM Departments
        WHERE name='Online Operations' and company='info@facebook.com'), 'info@facebook.com');
INSERT INTO Staff_Members
VALUES
    ('Rowan.Ibrahim', 40,'Rowan.Ibrahim@facebook.com', 'Saturday', 100000, 'Graphics Designer', (select code
        FROM Departments
        WHERE name='Creative' and company='info@facebook.com'), 'info@facebook.com');
INSERT INTO Staff_Members
VALUES
    ('Doaa.Ahmed', 40,'Doaa.Ahmed@facebook.com', 'Friday', 88000, 'Graphics Designer', (select code
        FROM Departments
        WHERE name='Creative' and company='info@facebook.com'), 'info@facebook.com');

-- add new 4 regular
INSERT INTO Regular_Employees
VALUES
    ('Mona.Osman')
INSERT INTO Regular_Employees
VALUES
    ('Amina.Abaas')
INSERT INTO Regular_Employees
VALUES
    ('Rowan.Ibrahim')
INSERT INTO Regular_Employees
VALUES
    ('Doaa.Ahmed')
-- add 2 projects
INSERT INTO Projects
VALUES
    ( 'cloudApp', 'info@facebook.com' , '9/2/2017 00:00:00', '10/2/2017 00:00:00', 'bakr.mostafa')
--online operations
INSERT INTO Projects
VALUES
    ( 'soundClound', 'info@facebook.com' , '11/27/2017 12:12:00', '12/12/2017 12:12:00', 'bakr.mostafa')
INSERT INTO Projects
VALUES
    ( 'Logo', 'info@facebook.com' , '1/9/2017 12:00:00', '2/9/2017 12:00:00', 'emad.sherif')
--Creative
INSERT INTO Projects
VALUES
    ( 'Animation Video', 'info@facebook.com' , '9/30/2017 12:00:00', '10/30/2017 12:00:00', 'emad.sherif')--Creative
-- add 4 tasks
--hr@Microsoft.com' info@facebook.com info@tesla.com Assigned Open Fixed
INSERT INTO Tasks
VALUES
    ('task1', 'cloudApp', 'info@facebook.com', '9/27/2017 00:00:00', 'Fixed', 'description', 'Mona.Osman', 'bakr.mostafa');
INSERT INTO Tasks
VALUES
    ('task2', 'cloudApp', 'info@facebook.com', '12/5/2017 00:00:00', 'Open', 'description', 'Amina.Abaas', 'bakr.mostafa');
INSERT INTO Tasks
VALUES
    ('task3', 'Animation Video', 'info@facebook.com', '12/20/2017 00:00:00', 'Open', 'description', 'Rowan.Ibrahim', 'emad.sherif');
INSERT INTO Tasks
VALUES
    ('task4', 'Animation Video', 'info@facebook.com', '10/20/2017 00:00:00', 'Open', 'description', 'Rowan.Ibrahim', 'emad.sherif');
INSERT INTO Tasks
VALUES
    ('task5', 'Animation Video', 'info@facebook.com', '10/20/2017 00:00:00', 'Fixed', 'description', 'Rowan.Ibrahim', 'emad.sherif');
INSERT INTO Tasks
VALUES
    ('task6', 'Animation Video', 'info@facebook.com', '10/20/2018 00:00:00', 'Fixed', 'description', 'Rowan.Ibrahim', 'emad.sherif');
-- add 4 requests
INSERT INTO  Requests
VALUES
    ( '9/29/2017 12:00:00', 'shady.ahmed' , '10/30/2017 12:00:00', '9/1/2017 00:00:00' , Null, 'Pending', Null, 'Pending', 'reason here')

INSERT INTO  Requests
VALUES
    ( '1/10/2017 11:00:00', 'Mona.Osman' , '2/9/2017 12:00:00', '1/1/2017 00:00:00', null, 'Pending', Null, 'Pending', 'reason here')

INSERT INTO  Requests
VALUES
    ( '9/26/2017 11:00:00', 'Amina.Abaas' , '10/30/2017 12:00:00', '9/1/2017 00:00:00', null, 'Pending', Null, 'Pending', 'reason here')
INSERT INTO  Requests
VALUES
    ( '9/23/2017 11:00:00', 'shady.ahmed' , '10/30/2017 12:00:00', '9/1/2017 00:00:00' , Null, 'Pending', Null, 'Pending', 'reason here')

INSERT INTO  Leave_Requests
VALUES
    ('9/29/2017 12:00:00', 'shady.ahmed' , 'type here')
INSERT INTO  Leave_Requests
VALUES
    ( '1/10/2017 11:00:00', 'Mona.Osman', 'type here')
INSERT INTO  Business_Trip_Requests
VALUES
    ( '9/26/2017 11:00:00', 'Amina.Abaas', 'cairo', 'purpose here')

INSERT INTO  Business_Trip_Requests
VALUES
    ( '9/23/2017 11:00:00', 'shady.ahmed', 'alex', 'purpose here')

INSERT INTO Regular_Employees_apply_replace_Requests
VALUES
    ('9/29/2017 12:00:00', 'shady.ahmed', 'Mona.Osman', 'Amina.Abaas')
INSERT INTO Regular_Employees_apply_replace_Requests
VALUES
    ('1/10/2017 11:00:00', 'Mona.Osman', 'Doaa.Ahmed', 'Rowan.Ibrahim')
INSERT INTO Regular_Employees_apply_replace_Requests
VALUES
    ( '9/26/2017 11:00:00', 'Amina.Abaas' , 'Mona.Osman', 'Amina.Abaas')
INSERT INTO Regular_Employees_apply_replace_Requests
VALUES
    ('9/23/2017 11:00:00', 'shady.ahmed', 'Amina.Abaas', 'Doaa.Ahmed')

-- add 4 Job_Seeker_apply_Job
INSERT INTO Job_Seekers_apply_Jobs
VALUES
    ( 'Graphics Designer', (select code
        FROM Departments
        WHERE name='Creative' and company='info@facebook.com'), 'info@facebook.com', 'Hossam.Azzab' , 'Approved', 'Pending', 80)
INSERT INTO Job_Seekers_apply_Jobs
VALUES
    ( 'Engineer', (select code
        FROM Departments
        WHERE name='Online Operations' and company='info@facebook.com'), 'info@facebook.com', 'Hossam.Azzab' , 'Approved', 'Pending', 60)
INSERT INTO Job_Seekers_apply_Jobs
VALUES
    ( 'Engineer', (select code
        FROM Departments
        WHERE name='Online Operations' and company='info@facebook.com'), 'info@facebook.com', 'Khaled.Hanafy' , 'Approved', 'Pending', 90)
INSERT INTO Job_Seekers_apply_Jobs
VALUES
    ( 'Graphics Designer', (select code
        FROM Departments
        WHERE name='Creative' and company='info@facebook.com'), 'info@facebook.com', 'Mahmoud.Hassan' , 'Approved', 'Pending', 100)

----

Go
CREATE PROCEDURE Work_on_task_again
    @in_username VARCHAR(20),
    @in_task VARCHAR(20),
    @change_status BIT
AS
    DECLARE @check_date DATETIME
    DECLARE @check_status VARCHAR(10)
    BEGIN
        SELECT @check_date= T.deadline, @check_status = T.status --get status and deadline of the task
        FROM Tasks T, Regular_Employees R,Staff_Members U
        WHERE @in_username =T.regular_employee And @in_task =T.name and U.company = T.company  and R.username=@in_username and @in_username=U.username ;
        BEGIN
            IF @check_date is NULL
            PRINT 'You donont work on such task'
        End
        BEGIN
            If @check_status <> 'Fixed'
                    PRINT 'The task status is not Fixed'
        END
        IF CURRENT_TIMESTAMP <= @check_date --to make sure deadline did not pass
        IF @change_status =1
            UPDATE Tasks
            SET status = 'Assigned'
            WHERE regular_employee = @in_username and name= @in_task and status ='Fixed';
        ELSE
            PRINT 'deadline has passed'
    END

GO
EXEC Work_on_task_again 'Rowan.Ibrahim', 'task6',1 -- to  change the status is optional , choose 1 else 0
GO
-------------------
--- function used in the next two procedures to filter the staff memebers 
CREATE FUNCTION filter_staff_members2
      (  @manager_name VARCHAR(20),@applicant_applied VARCHAR(20) )
    RETURNS BIT
    BEGIN
    DECLARE @returnedValue BIT
    DECLARE @check_appliacant VARCHAR(20)
    DECLARE @manager_company VARCHAR(100)
    DECLARE  @department_number INT
    DECLARE @manager_type VARCHAR(50)

        --getting manager's department
        SELECT @department_number= department
        FROM Staff_Members
        where @manager_name = username
        --getting manager's type
        SELECT @manager_type = type
        FROM Managers
        where @manager_name=username
        -- getting manager's company
        SELECT @manager_company= company
        FROM Staff_Members
        where @manager_name = username

    SET @returnedValue= 0
    IF @manager_type='HR' -- if the manager is hr then he can see all the other staff memebers
        SELECT @check_appliacant = username
        FROM Staff_Members
        WHERE @department_number = department AND username<>@manager_name and @applicant_applied = username and company = @manager_company
    ELSE
        SELECT @check_appliacant = s.username -- if the manager is hr then he can see all the other staff memebers except hr employees
        FROM Staff_Members s
        WHERE @department_number = s.department AND s.username<>@manager_name and @applicant_applied = s.username and s.company = @manager_company
        And s.username 
           Not IN(
                Select h.username
                FROM HR_Employees h
                )
    IF  @check_appliacant is NOT NULL -- if there is an applicant found return 1
        SET @returnedValue= 1
      
    RETURN @returnedValue
END
Go
--------
CREATE PROCEDURE View_New_Requests
    @manager_name VARCHAR(20)
AS
    SELECT R.*,L.type  -- to show leave requests
    from Requests R inner join Leave_Requests L on L.applicant =R.applicant and L.start_date=R.start_date
    WHERE  manager_response = 'Pending' and dbo.filter_staff_members2(@manager_name,R.applicant)=1

    SELECT R.*,L.destination,L.purpose -- to show business requests 
    from Requests R inner join Business_Trip_Requests L on L.applicant =R.applicant and L.start_date=R.start_date
    WHERE  manager_response = 'Pending' and dbo.filter_staff_members2(@manager_name,R.applicant)=1
GO
EXEC View_New_Requests 'bakr.mostafa'--hr type
EXEC View_New_Requests 'osama.rady' 

GO
--------------
CREATE PROCEDURE Change_Request_state
    @manager_name VARCHAR(20),
    @start_date_in DATETIME,
    @applicant_in VARCHAR(20),
    @status_in VARCHAR(10),
    @reason VARCHAR(MAX)
AS
    DECLARE @check_hr VARCHAR(20)
    If  (@status_in = 'Rejected' and @reason is NOT NULL )Or (@status_in = 'Approved')
        BEGIN
            SELECT @check_hr =@applicant_in
            FROM HR_Employees
            where @applicant_in=username

            IF  @check_hr Is  NOT NULL -- to check if the applicant is hr employee
                UPDATE Requests -- if the manager is of type hr he/she will finalize the review and add the hr_response as well
                SET manager_response =@status_in , manager_reason =@reason , hr_response =@status_in , manager =    @manager_name 
                WHERE @start_date_in = start_date and applicant= @applicant_in and dbo.filter_staff_members2(@manager_name,applicant)=1 and manager_response ='Pending' and hr_response='Pending' ; 
            ELSE
                UPDATE Requests
                SET manager_response =@status_in , manager_reason =@reason , manager =    @manager_name 
                WHERE @start_date_in = start_date and applicant= @applicant_in and dbo.filter_staff_members2(@manager_name,applicant)=1 and manager_response ='Pending' and hr_response='Pending' ;
        End
    ELSE
        PRINT 'You canot access this record, or it is not found'
Go
SELECT * from Requests       
EXEC Change_Request_state 'osama.rady','1/10/2017 11:00:00', 'Mona.Osman','Approved','reason'
---------------
GO
CREATE PROCEDURE View_All_Applications
    @manager_name VARCHAR(20)
AS
    DECLARE @manager_department int
    DECLARE @company_check VARCHAR(100)
    EXEC Staff_Members_get_my_department @manager_name , @manager_department output, @company_check output
    --below i showed all information of the job seeker except the username and password
    SELECT job ,score ,U.personal_email,U.birth_date,U.years_of_experience,U.first_name,U.middle_name,U.last_name,U.age
    FROM Job_Seekers_apply_Jobs J inner JOIN Users U on U.username=J.job_seeker AND J.company=@company_check
    WHERE @manager_department= J.department AND J.hr_response= 'Approved' and J.manager_response = 'Pending'

Go
EXEC View_All_Applications 'osama.rady'
GO
----------
GO
CREATE PROCEDURE Edit_Application
    @manager_name VARCHAR(20),
    @manager_in_response VARCHAR(10),
    @job_seeker_in VarCHAR(20),
    @job_in VarCHAR(20)
AS
    DECLARE @manager_department int
    DECLARE @company_check VARCHAR(100)
    EXEC Staff_Members_get_my_department @manager_name , @manager_department output, @company_check output
    UPDATE  Job_Seekers_apply_Jobs
    Set manager_response =@manager_in_response
    WHERE @manager_department= department AND  @company_check =company  AND hr_response= 'Approved' AND job_seeker=@job_seeker_in And job= @job_in and manager_response = 'Pending'

GO
select * from Job_Seekers_apply_Jobs
EXEC Edit_Application 'osama.rady','Rejected','Khaled.Hanafy','Engineer'
GO
----------------
Create PROCEDURE Create_project
  @manager_name VARCHAR(20) ,
  @name_in VARCHAR(20) ,
  @company_in VARCHAR(100) ,
  @start_date_in datetime,
  @end_date_in datetime

  AS
    INSERT Into Projects VALUES( @name_in, @company_in, @start_date_in,  @end_date_in,  @manager_name )
    GO
    EXEC Create_project 'osama.rady','project1','info@facebook.com','9/2/2017 00:00:00', '10/2/2017 00:00:00'
GO
----------- 
Create PROCEDURE Assign_regular_employees_on_projects
  @manager_name VARCHAR(20) ,
  @project_name_in VARCHAR(20),
  @regular_employee_in  VARCHAR(20)
  AS 
    DECLARE @manager_department int
    DECLARE @regular_department int
    DECLARE @regular_company VARCHAR(100)
    DECLARE @sum_of_projects int
    DECLARE @company_check_manager VARCHAR(100) 

    EXEC Staff_Members_get_my_department @manager_name , @manager_department output, @company_check_manager output
    EXEC Staff_Members_get_my_department @regular_employee_in , @regular_department output, @regular_company output


    IF @regular_department <> @manager_department or @company_check_manager <>@regular_company -- make sure the manager's company and department is the same as the regular employee
        PRINT 'regular employee should have same department as the manager'
    ELSE
        BEGIN
            SELECT @sum_of_projects = COUNT(*) -- as regular employee should work on maximum two projects so i get the count
            FROM Managers_assign_Regular_Employees_Projects
            WHERE  @regular_employee_in= regular_employee
        IF @sum_of_projects<2

            INSERT Into Managers_assign_Regular_Employees_Projects VALUES( @project_name_in, @company_check_manager, @regular_employee_in,  @manager_name )
        ELSE
            PRINT 'regular employee shouldnt be not working on more than two projects at the same time.'

        END
GO
EXEC Assign_regular_employees_on_projects 'osama.rady','project1','Mona.Osman'
GO
------
CREATE PROCEDURE Remove_regular_employee_from_project
  @manager_name VARCHAR(20) ,
  @project_name_in VARCHAR(20),
  @regular_employee_in  VARCHAR(20)
  AS 
    DECLARE @check_regular VARCHAR(20)
    DECLARE @check_manager_company varchar(100)
    DECLARE @manager_department int
    EXEC Staff_Members_get_my_department @manager_name , @manager_department output, @check_manager_company output

    Select @check_regular = regular_employee -- gets the old regular employee
    from Managers_assign_Regular_Employees_Projects
    where project_name=@project_name_in and regular_employee=@regular_employee_in  and @check_manager_company=company

    IF @check_regular is not NULL 
        DELETE FROM   Managers_assign_Regular_Employees_Projects
        WHERE project_name=@project_name_in And regular_employee =  @regular_employee_in;

GO
exec Remove_regular_employee_from_project'osama.rady','project1','Mona.Osman'
GO
-------
CREATE PROCEDURE Define_task
  @task_in VARCHAR(20),
  @project_name_in VARCHAR(20),
  @company_in VARCHAR(100) ,
  @deadline_in datetime,
  @description_in VARCHAR(MAX),
  @manager_name VARCHAR(20) 

  AS 
    DECLARE @manager_department int
    DECLARE @manager_company VARCHAR(100)
    DECLARE @project_manager_name VARCHAR(20) 
    DECLARE @project_manager_department int
    DECLARE @project_manager_company VARCHAR(100)
    EXEC Staff_Members_get_my_department @manager_name , @manager_department output, @manager_company output

    SELECT  @project_manager_name = manager -- get name of the manager who defined the project
    FROM  Projects
    WHERE name= @project_name_in


    SELECT @project_manager_department= department  ,@project_manager_company =company -- get the department and company of the manager who defined the project
    FROM Staff_Members
    where @project_manager_name = username

    IF @project_manager_department=  @manager_department and @project_manager_company=@manager_company 
        INSERT Into Tasks VALUES( @task_in,@project_name_in,@company_in, @deadline_in,'Open',@description_in,null, @manager_name)
    ELSE
        PRINT 'The project is not in your department or company'
GO
exec Define_task 'task0','project1','info@facebook.com','9/2/2018 00:00:00','description','osama.rady' -- the insertion is based on pervius procedure
GO
---------
CREATE PROCEDURE Assign_regular_employee_on_task
  @manager_name VARCHAR(20) ,
  @project_name_in VARCHAR(20),
  @task_in VARCHAR(20),
  @regular_employee_in VARCHAR(20)
  AS
    DECLARE @check_regular VARCHAR(20)
    DECLARE @manager_company VARCHAR(100)
    DECLARE @manager_department int
    EXEC Staff_Members_get_my_department @manager_name , @manager_department output, @manager_company output

    SELECT @check_regular = regular_employee -- gets regular employee assinged on the project
    FROM Managers_assign_Regular_Employees_Projects
    WHERE @regular_employee_in =  regular_employee

    IF @check_regular IS Not NULL
        UPDATE  Tasks
        Set regular_employee = @regular_employee_in , status='Assigned'
        WHERE @manager_name= manager AND @project_name_in = project and regular_employee is null and @task_in=name and @manager_company=company

    ELSE
        PRINT 'the regular employee doesnot work on such project'
GO
exec Assign_regular_employee_on_task 'osama.rady','project1','task0' ,'Mona.Osman'
GO
-----------
CREATE PROCEDURE Change_regular_employee_on_a_task
  @manager_name VARCHAR(20) ,
   @project_name_in VARCHAR(20),
   @task_in VARCHAR(20),
  @regular_employee_in VARCHAR(20)
  AS
    DECLARE @manager_company VARCHAR(100)
    DECLARE @manager_department int
    EXEC Staff_Members_get_my_department @manager_name , @manager_department output, @manager_company output

    UPDATE  Tasks
    Set regular_employee = @regular_employee_in
    WHERE @manager_name= manager AND @project_name_in = project and @task_in=name AND status='Assigned' AND regular_employee is not null and @manager_company= company
GO
exec Change_regular_employee_on_a_task 'osama.rady','project1','task0' ,'Amina.Abaas'
GO
----
Create PROCEDURE View_list_of_tasks_in_project
  @manager_name VARCHAR(20) ,
  @project_name_in VARCHAR(20),
  @status_in VARCHAR(10)
AS 
    DECLARE @manager_company VARCHAR(100)
    DECLARE @manager_department int
    EXEC Staff_Members_get_my_department @manager_name , @manager_department output, @manager_company output

    SELECT *
    FROM Tasks 
    Where @manager_name= manager AND @project_name_in = project  And status= @status_in and @manager_company= company

    SELECT *
    FROM Task_Comments
    Where  @project_name_in = project  and @manager_company= company

GO
 exec View_list_of_tasks_in_project 'osama.rady','project1','Assigned'
GO
------
CREATE PROCEDURE Review_task_in_a_project
  @manager_name VARCHAR(20) ,
  @task_in VARCHAR(20),
  @project_name_in VARCHAR(20),
  @accept_or_recject bit,
  @deadline_in datetime
  AS
    DECLARE @stauts_check VARCHAR(10)
    DECLARE @deadline_check datetime
    DECLARE @manager_company VARCHAR(100)
    DECLARE @manager_department int
    EXEC Staff_Members_get_my_department @manager_name , @manager_department output, @manager_company output

    IF @accept_or_recject = 1
        Begin
            Set @stauts_check = 'Closed'
            UPDATE  Tasks
            Set status = @stauts_check 
            WHERE @manager_name= manager AND @project_name_in = project AND @task_in=name  and status='Fixed' and @manager_company= company
        END
    ELSE
        BEGIN
            Set @stauts_check= 'Assigned'
            SET @deadline_check =   @deadline_in 
            UPDATE  Tasks
            Set status = @stauts_check , deadline= @deadline_check
            WHERE @manager_name= manager AND @project_name_in = project AND @task_in=name  and status='Fixed' and @manager_company= company
        END
Go
exec Review_task_in_a_project 'emad.sherif','task5','Animation Video',0,'12/2/2018 00:00:00' -- 0 reject 1 accept
GO
