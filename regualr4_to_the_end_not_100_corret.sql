
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
    ('Mona.Osman', 'ceo@tesla.com', 'Friday', 70000, 'Engineer', (select code
        FROM Departments
        WHERE name='Online Operations' and company='info@facebook.com'), 'info@facebook.com');
INSERT INTO Staff_Members
VALUES
    ('Amina.Abaas', 'ceo@tesla.com', 'Monday', 60000, 'Engineer', (select code
        FROM Departments
        WHERE name='Online Operations' and company='info@facebook.com'), 'info@facebook.com');
INSERT INTO Staff_Members
VALUES
    ('Rowan.Ibrahim', 'ceo@tesla.com', 'Saturday', 100000, 'Graphics Designer', (select code
        FROM Departments
        WHERE name='Creative' and company='info@facebook.com'), 'info@facebook.com');
INSERT INTO Staff_Members
VALUES
    ('Doaa.Ahmed', 'ceo@tesla.com', 'Friday', 88000, 'Graphics Designer', (select code
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
    ('task1', 'cloudApp', 'info@facebook.com', '9/27/2017 00:00:00', 'Open', 'description', 'Mona.Osman', 'bakr.mostafa');
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
INSERT INTO Tasks
VALUES
    ('task7', 'Animation Video', 'info@facebook.com', '10/20/2018 00:00:00', 'Fixed', 'description', 'Amina.Abaas', 'emad.sherif');
-- add 4 requests
INSERT INTO  Requests
VALUES
    ( '9/1/2017 00:00:00', 'Mona.Osman' , '10/2/2017 00:00:00', '8/2/2017 00:00:00', 'tarek.osman', 'Pending', 'osama.rady', 'Pending', 'reason here')
INSERT INTO  Requests
VALUES
    ( '1/10/2017 12:00:00', 'Mona.Osman' , '2/9/2017 12:00:00', '1/1/2017 00:00:00', 'shady.ahmed', 'Pending', 'bakr.mostafa', 'Pending', 'reason here')
INSERT INTO  Requests
VALUES
    ( '9/29/2017 12:00:00', 'Amina.Abaas' , '10/30/2017 12:00:00', '9/1/2017 00:00:00', 'shady.ahmed', 'Pending', 'bakr.mostafa', 'Pending', 'reason here')
INSERT INTO  Requests
VALUES
    ( '9/29/2017 12:00:00', 'shady.ahmed' , '10/30/2017 12:00:00', '9/1/2017 00:00:00' , Null, 'Pending', Null, 'Pending', 'reason here')

INSERT INTO  Requests
VALUES
    ( '1/10/2017 11:00:00', 'Mona.Osman' , '2/9/2017 12:00:00', '1/1/2017 00:00:00', 'shady.ahmed', 'Pending', Null, 'Pending', 'reason here')

INSERT INTO  Requests
VALUES
    ( '9/26/2017 11:00:00', 'Amina.Abaas' , '10/30/2017 12:00:00', '9/1/2017 00:00:00', 'shady.ahmed', 'Pending', Null, 'Pending', 'reason here')
INSERT INTO  Requests
VALUES
    ( '9/23/2017 11:00:00', 'shady.ahmed' , '10/30/2017 12:00:00', '9/1/2017 00:00:00' , Null, 'Pending', Null, 'Pending', 'reason here')


INSERT INTO  Leave_Requests
VALUES
    ('9/2/2017 00:00:00', 'Mona.Osman' , 'type here')
INSERT INTO  Leave_Requests
VALUES
    ('11/27/2017 12:12:00', 'Doaa.Ahmed', 'type here')
INSERT INTO  Business_Trip_Requests
VALUES
    ( '1/9/2017 12:00:00', 'Mona.Osman', 'cairo', 'purpose here')
INSERT INTO  Business_Trip_Requests
VALUES
    ( '9/30/2017 12:00:00', 'Amina.Abaas', 'alex', 'purpose here')
INSERT INTO Regular_Employees_apply_replace_Requests
VALUES
    ( '9/2/2017 00:00:00', 'Mona.Osman', 'Mona.Osman', 'Amina.Abaas')
INSERT INTO Regular_Employees_apply_replace_Requests
VALUES
    ('11/27/2017 12:12:00', 'Doaa.Ahmed' , 'Doaa.Ahmed', 'Rowan.Ibrahim')
INSERT INTO Regular_Employees_apply_replace_Requests
VALUES
    ( '1/9/2017 12:00:00', 'Mona.Osman' , 'Mona.Osman', 'Amina.Abaas')
INSERT INTO Regular_Employees_apply_replace_Requests
VALUES
    ( '9/30/2017 12:00:00', 'Amina.Abaas', 'Amina.Abaas', 'Doaa.Ahmed')
-- add 4 Job_Seeker_apply_Job
INSERT INTO Job_Seekers_apply_Jobs
VALUES
    ( 'Graphics Designer', (select code
        FROM Departments
        WHERE name='Creative' and company='info@facebook.com'), 'info@facebook.com', 'Hossam.Azzab' , 'Approved', 'Rejected', 80)
INSERT INTO Job_Seekers_apply_Jobs
VALUES
    ( 'Engineer', (select code
        FROM Departments
        WHERE name='Online Operations' and company='info@facebook.com'), 'info@facebook.com', 'Hossam.Azzab' , 'Rejected', 'Rejected', 60)
INSERT INTO Job_Seekers_apply_Jobs
VALUES
    ( 'Engineer', (select code
        FROM Departments
        WHERE name='Online Operations' and company='info@facebook.com'), 'info@facebook.com', 'Khaled.Hanafy' , 'Approved', 'Approved', 90)
INSERT INTO Job_Seekers_apply_Jobs
VALUES
    ( 'Graphics Designer', (select code
        FROM Departments
        WHERE name='Creative' and company='info@facebook.com'), 'info@facebook.com', 'Mahmoud.Hassan' , 'Approved', 'Rejected', 100)
----

Go
CREATE PROCEDURE Work_on_task_again
    @in_username VARCHAR(20),
    @in_task VARCHAR(20)
AS
DECLARE @check_username VARCHAR(20)
DECLARE @check_date DATETIME
DECLARE @check_status VARCHAR(10)
SELECT @check_username = username
FROM Regular_Employees
WHERE @in_username =username
BEGIN
    SELECT @check_date= deadline, @check_status = status
    FROM Tasks
    WHERE @in_username =regular_employee And @in_task =name;
    BEGIN
        IF @check_date is NULL
        PRINT 'You donont work on such task'
    End
    BEGIN
        If @check_status <> 'Fixed'
                PRINT 'The task status is Fixed'
    END
    IF CURRENT_TIMESTAMP <= @check_date
        UPDATE Tasks
        SET status = 'Assigned'
        WHERE regular_employee = @in_username and name= @in_task and status ='Fixed';
    ELSE
        PRINT 'deadline has passed'
END

GO
EXEC Work_on_task_again 'Rowan.Ibrahim', 'task8'
select *
from Tasks
GO
-------------------
CREATE FUNCTION filter_staff_memebrs
      (  @department_number INT,@manager_name VARCHAR(20),@manager_type VARCHAR(50),@applicant_applied VARCHAR(20) )
    RETURNS BIT
    BEGIN
    DECLARE @returnedValue BIT
    DECLARE @check_appliacant VARCHAR(20)
    SET @returnedValue= 0
    IF @manager_type='HR'
        SELECT @check_appliacant = username
    FROM Staff_Members
    WHERE @department_number = department AND username<>@manager_name and @applicant_applied = username
    ELSE
        SELECT @check_appliacant = s.username
    FROM Staff_Members s
    WHERE @department_number = s.department AND s.username<>@manager_name and @applicant_applied = s.username And s.username    Not IN(
            Select h.username
        FROM HR_Employees h
        )
    IF  @check_appliacant is NOT NULL
       SET @returnedValue= 1
        ELSE
        PRINT 'You canot access this record, or it is not found'
    RETURN @returnedValue
END
Go
CREATE PROCEDURE View_New_Requests
    @manager_name VARCHAR(50)
AS
DECLARE @manager_department VARCHAR(50)
DECLARE @manager_type VARCHAR(50)
SELECT @manager_department= department
FROM Staff_Members
where @manager_name = username
SELECT @manager_type = type
FROM Managers
where @manager_name=username
SELECT *
from Requests R
WHERE dbo.filter_staff_memebrs(@manager_department,@manager_name,@manager_type,R.applicant)=1 AND manager_response = 'Pending'

EXEC View_New_Requests 'bakr.mostafa'
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
DECLARE @manager_department VARCHAR(50)
DECLARE @manager_type VARCHAR(50)
DECLARE @check_hr VARCHAR(20)
SELECT @manager_department= department
FROM Staff_Members
where @manager_name = username

SELECT @manager_type = type
FROM Managers
where @manager_name=username

IF @status_in = 'Rejected'
BEGIN
    If @reason =Null
        PRINT 'You should provide a reason'
End
If  (@status_in = 'Rejected' and @reason is NOT NULL )Or (@status_in = 'Accepted')
BEGIN
    SELECT @check_hr =@applicant_in
    FROM HR_Employees
    IF  @check_hr Is  NOT NULL
    
        UPDATE Requests
        SET manager_response =@status_in , manager_reason =@reason , hr_response =@status_in 
        WHERE @start_date_in = start_date and applicant= @applicant_in and dbo.filter_staff_memebrs(@manager_department,@manager_name,@manager_type,applicant)=1 and manager_response ='Pending' and hr_response='Pending' ; 
        ELSE
        UPDATE Requests
        SET manager_response =@status_in , manager_reason =@reason 
        WHERE @start_date_in = start_date and applicant= @applicant_in and dbo.filter_staff_memebrs(@manager_department,@manager_name,@manager_type,applicant)=1 and manager_response ='Pending' and hr_response='Pending' ;End
    ELSE
        
         PRINT 'You canot access this record, or it is not found'
SELECT * from Requests    
GO   
EXEC Change_Request_state 'osama.rady','2017-09-26 11:00:00.000','Amina.Abaas','rejected',null
---------------
GO
CREATE PROCEDURE View_All_Applications
    @manager_name VARCHAR(20)
AS
DECLARE @manager_department VARCHAR(50)

SELECT @manager_department= department
FROM Staff_Members
where @manager_name = username

SELECT job,job_seeker ,score 
FROM Job_Seekers_apply_Jobs
WHERE @manager_department= department AND hr_response= 'Approved'

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
DECLARE @manager_department VARCHAR(50)

SELECT @manager_department= department
FROM Staff_Members
where @manager_name = username

UPDATE  Job_Seekers_apply_Jobs
Set manager_response =@manager_in_response
WHERE @manager_department= department AND hr_response= 'Approved' AND job_seeker=@job_seeker_in And job= @job_in

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
----------- 
Create PROCEDURE Assign_regular_employees_on_projects
  @manager_name VARCHAR(20) ,
  @project_name_in VARCHAR(20),
  @regular_employee_in  VARCHAR(20)
  AS 
  DECLARE @manager_department VARCHAR(50)
  DECLARE @regular_department VARCHAR(50)
  DECLARE @sum_of_projects int
  DECLARE   @company_in VARCHAR(100) 


  SELECT @manager_department= department ,  @company_in =company
  FROM Staff_Members
  where @manager_name = username

  SELECT @regular_department= department
  FROM Staff_Members
  where @regular_employee_in = username
IF @regular_department <> @manager_department
PRINT 'regular employee should have same department as the manager'
ELSE
BEGIN
SELECT @sum_of_projects = COUNT(*)
FROM Managers_assign_Regular_Employees_Projects
WHERE  @regular_employee_in= regular_employee
IF @sum_of_projects<2

INSERT Into Managers_assign_Regular_Employees_Projects VALUES( @project_name_in, @company_in, @regular_employee_in,  @manager_name )
ELSE
PRINT 'regular employee shouldnt be not working on more than two projects at the same time.'

END
GO
------
CREATE PROCEDURE Remove_regular_employee_from_project
@manager_name VARCHAR(20) ,
  @project_name_in VARCHAR(20),
  @regular_employee_in  VARCHAR(20)
  AS 
 DECLARE @check_regular VARCHAR(20)
  Select @check_regular = regular_employee
  from Tasks
  where project=@project_name_in and regular_employee=@regular_employee_in 
IF @check_regular is not NULL
DELETE FROM   Managers_assign_Regular_Employees_Projects
WHERE project_name=@project_name_in And regular_employee =  @regular_employee_in;
ELSE
PRINT 'you cant do such operation'
GO
-------
CREATE PROCEDURE Define_task
  @manager_name VARCHAR(20) ,
  @project_name_in VARCHAR(20),
  @task_in VARCHAR(20),
  @deadline_in datetime,
  @description_in VARCHAR(MAX),
  @regular_employee_in VARCHAR(20)
  -- add description

  AS 
  DECLARE @manager_department VARCHAR(50)
  DECLARE   @company_in VARCHAR(100) 
  DECLARE @project_manager_name VARCHAR(20) 
  DECLARE @project_manager_department VARCHAR(20) 

  SELECT @manager_department= department ,  @company_in =company
  FROM Staff_Members
  where @manager_name = username

  SELECT  @project_manager_name = manager
  FROM  Projects
  WHERE name= @project_name_in

  SELECT @project_manager_department= department 
  FROM Staff_Members
  where @project_manager_name = username
IF @project_manager_department=  @manager_department
INSERT Into Tasks VALUES( @task_in,@project_name_in,@company_in, @deadline_in,'Open','description',null, @manager_name)
ELSE
PRINT 'The project is not in your department'
GO
---------
CREATE PROCEDURE Assign_regular_employee
  @manager_name VARCHAR(20) ,
  @project_name_in VARCHAR(20),
  @task_in VARCHAR(20),
  @regular_employee_in VARCHAR(20)
  AS
DECLARE @check_regular VARCHAR(20)
SELECT @check_regular = regular_employee
FROM Managers_assign_Regular_Employees_Projects
WHERE @regular_employee_in =  regular_employee

IF @regular_employee_in IS Not NULL

UPDATE  Tasks
Set regular_employee = @regular_employee_in
WHERE @manager_name= manager AND @project_name_in = project AND regular_employee = null and @task_in=name

ELSE
PRINT 'the regular employee doesnot work on such project'
GO
-----------
CREATE PROCEDURE Change_regular_employee_on_a_task
  @manager_name VARCHAR(20) ,
  @task_in VARCHAR(20),
  @project_name_in VARCHAR(20),
  @regular_employee_in VARCHAR(20)
  AS
UPDATE  Tasks
Set regular_employee = @regular_employee_in
WHERE @manager_name= manager AND @project_name_in = project and @task_in=name AND status='Assigned' AND regular_employee is not null
GO
----
Create PROCEDURE View_list_of_tasks_in_project
@manager_name VARCHAR(20) ,
  @project_name_in VARCHAR(20),
  @status_in VARCHAR(10)
AS 
SELECT *
FROM Tasks
Where @manager_name= manager AND @project_name_in = project  And status= @status_in

GO
------
--add company checks
CREATE PROCEDURE Review_task_in_a_project
  @manager_name VARCHAR(20) ,
  @task_in VARCHAR(20),
  @project_name_in VARCHAR(20),
  @accept_or_recject VARCHAR(10),
  @deadline_in DATETIME

  AS
DECLARE @stauts_check VARCHAR(10)
DECLARE @deadline_check VARCHAR(10)

IF @accept_or_recject = 'accept'
Set @stauts_check = 'Closed'
ELSE
BEGIN
Set @stauts_check= 'Assigned'
SET @deadline_check =   @deadline_in 
END
UPDATE  Tasks
Set status = @stauts_check , deadline= @deadline_check
WHERE @manager_name= manager AND @project_name_in = project AND @task_in=name  and status='Fixed'
Go