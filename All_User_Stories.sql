GO

-- Registered/Unregistered User 1
CREATE PROC Company_Search 
@name varchar(100) ,
@adderss varchar(500) ,
@type varchar(200)
AS

IF @name is not null
(SELECT *
FROM  Companies c
WHERE c.name = @name )
else BEGIN
	IF @adderss is not null
	(SELECT *
	FROM  Companies c
	WHERE c.address = @adderss )
	ELSE BEGIN 
		IF @type is not null
		(SELECT *
		FROM  Companies c
		WHERE c.type = @type )
	END
END


go

-- Registered/Unregistered User 2

CREATE PROC List_Of_Companies
AS
SELECT *
FROM Companies c

go

-- Registered/Unregistered User 3
CREATE PROC View_Company_Department
@company varchar(40)
AS
SELECT c.* , d.*
FROM Companies c inner join Departments d ON c.email = d.company
WHERE  c.email = @company


-- Registered/Unregistered User 4
GO

CREATE PROC Department_Jobs
@company varchar(40) ,
@department int 
AS
SELECT d.* , j.*
FROM Departments d inner join Jobs j ON j.department = d.code AND j.company = d.company
WHERE d.company =  @company AND d.code = @department  AND   j.no_of_vacancies > 0


GO

-- Registered/Unregistered User 5
CREATE PROC Register
@username varchar(20) , 
@password varchar(30)  , 
@email varchar(100)  , 
@birthdate datetime  , 
@years_of_experience int   , 
@first_name varchar (30)  , 
@middle_name varchar (30)  ,
@last_name varchar(30)  
AS
IF ( EXISTS ( SELECT * FROM Users u where u.username = @username ) )
PRINT ( 'Username already exists' )
ELSE
INSERT INTO Users 
VALUES ( @username , @password , @email , @birthdate  , @years_of_experience , @first_name , @middle_name , @last_name   );

GO 

-- Registered/Unregistered User 6
------
------
------ Please replace the YOUR_DATABASE_NAME name with the name that you will use ... Won't work any other way
ALTER DATABASE master SET COMPATIBILITY_LEVEL = 130
-----
-----
-----
GO
CREATE PROC Search_Job 
@key varchar(100)
AS
SELECT *
FROM Jobs j
WHERE j.no_of_vacancies > 0 AND EXISTS (SELECT value  
    FROM STRING_SPLIT(@key, ' ') 
    WHERE value IN (SELECT value  
	   FROM STRING_SPLIT(j.short_description, ' ' )) )


GO


GO
-- Registered/Unregistered User 7

CREATE PROC Jobs_Sorted
AS


SELECT AVG(j.salary)
FROM Companies c inner join Jobs j ON c.email = j.company
GROUP BY c.email
ORDER BY AVG(j.salary)

GO


-- Registered User 1
CREATE PROC Login
@username varchar(100) ,
@password VARCHAR(100) ,
@out varchar(100) OUTPUT

AS
IF NOT EXISTS ( 
 SELECT * 
 FROM Users u1 
 where u1.username = @username AND u1.password = @password 
 )
 SELECT @out ='IS NOT A REGISTERED USER'

ELSE 
BEGIN
		IF EXISTS ( 
		SELECT * 
		FROM Job_Seekers j 
		where j.username = @username )
		SELECT @out = 'JOB SEEKER'

		ELSE  
		BEGIN

		IF EXISTS ( 
		SELECT * 
		FROM HR_Employees hr 
		where hr.username = @username )
		SELECT @out = 'HR EMPLOYEE'
		ELSE BEGIN

		IF EXISTS ( 
		SELECT * 
		FROM Regular_Employees r 
		where r.username = @username )
		SELECT @out = 'REGULAR EMPLOYEE'
		ELSE 
		SELECT @out =  'MANAGER' 


		END

END

END

GO

-- Registered User 2
CREATE PROC View_Information
@username varchar(100)
AS
SELECT *
FROM  Users u
WHERE u.username = @username




GO
-- Registered User 3
CREATE PROC Edit 
@username varchar ( 50) ,
@password varchar(30)  , 
@personal_email varchar(100)  , 
@birth_date datetime , 
@years_of_experience int  , 
@first_name varchar (30) , 
@middle_name varchar (30)  ,
@last_name varchar(30) 

AS

UPDATE Users 
SET password = @password , personal_email = @personal_email , birth_date = @birth_date , years_of_experience = @years_of_experience ,
first_name = @first_name  , middle_name = @middle_name    , last_name = @last_name
WHERE username  = @username


GO
-- Job seeker 1
CREATE PROC  Apply
@job_title varchar(100) ,
@department int         ,
@company varchar (100) ,
@username varchar(100) 

AS

IF  (SELECT u.years_of_experience
FROM Users u where u.username = @username ) >= (SELECT j.min_experience FROM Jobs j WHERE j.title = @job_title AND j.department = @department AND j.company = @company )
AND NOT EXISTS ( SELECT *  FROM Job_Seekers_apply_Jobs js where js.department = @department AND js.job = @job_title AND js.company = @company AND js.hr_response = 'Pending'  )
INSERT INTO Job_Seekers_apply_Jobs ( job ,     department  , company  , job_seeker )
VALUES ( @job_title , @department , @company , @username );
ELSE
print 'You do not have enough ecperience for the job or you have a pending application'



GO
-- Job seeker 2
CREATE PROC View_Question 
@job_title varchar(100) ,
@department int         ,
@company varchar (100) 

AS
Select q.question
FROM Questions q
where q.number = ANY
( SELECT js.question
FROM Job_Has_Question js
WHERE js.company = @company AND js.department = @department AND js.job = @job_title )

GO
-- Job seeker 3
CREATE PROC Save_Score 
@job_title varchar(100) ,
@department int         ,
@company varchar (100) ,
@job_seeker varchar(100) ,
@score int 

AS

UPDATE Job_Seekers_apply_Jobs
SET score = @score
WHERE   department = @department AND  job = @job_title AND  company = @company AND job_seeker = @job_seeker

--- Job Seeker 4
Go
CREATE PROC Review_Job_Status
    @seeker_username VARCHAR(20)
AS
DECLARE @job_applied_for VARCHAR(20)
DECLARE @department int
DECLARE @company VARCHAR(100)
DECLARE @hr_response VARCHAR(10)
DECLARE @manager_response VARCHAR(10)
DECLARE @score int
    SELECT job, department, company, hr_response, manager_response, score
    FROM Job_Seekers_apply_Jobs
    WHERE job_seeker = @seeker_username
---
--- Job Seeker 5
Go
CREATE PROC Choose_Job
    @job VARCHAR(20),
    @department int,
    @company VARCHAR(100),
    @seeker_username VARCHAR(20),
    @day_off VARCHAR(10)
AS
DECLARE @acceptance_status VARCHAR(10)
DECLARE @salary INT
DECLARE @nVacancies INT
DECLARE @domain VARCHAR(50)
SELECT @acceptance_status=manager_response
FROM Job_Seekers_apply_Jobs
WHERE job=@job AND department=@department and company= @company and job_seeker=@seeker_username
BEGIN
    IF @acceptance_status = 'Approved'
        BEGIN
            SELECT @salary = salary, @nVacancies = no_of_vacancies
            FROM Jobs
            WHERE title=@job AND department=@department and company= @company
            BEGIN
                SELECT @domain=domain
                FROM Companies
                WHERE email=@company
                IF @day_off != 'Friday'
                BEGIN
                    
                        UPDATE Jobs
                        SET no_of_vacancies = @nVacancies-1
                        WHERE title=@job AND department=@department and company= @company
                        BEGIN
                                INSERT INTO Staff_Members
                                VALUES(
                                    @seeker_username,30, @seeker_username + '@' + @domain, @day_off,@salary,@job,@department,@company
                                )
                        END
                        DELETE FROM Job_Seekers_apply_Jobs
                        WHERE job=@job AND department=@department and company= @company and job_seeker=@seeker_username
                END
                ELSE PRINT 'Please Pick a day off other than Friday'    
            END
        END     
    ELSE PRINT 'Invalid Job -- Not found or Rejected'
END
---
--- Job Seeker 6
Go
CREATE PROC Delete_Job
    @job VARCHAR(20),
    @department int,
    @company VARCHAR(100),
    @seeker_username VARCHAR(20)
AS
DECLARE @hr_response VARCHAR(10)
DECLARE @manager_response VARCHAR(10)
SELECT @hr_response = hr_response, @manager_response = manager_response
FROM Job_Seekers_apply_Jobs
WHERE job=@job AND department=@department and company= @company and job_seeker=@seeker_username
IF @hr_response = 'Pending' OR @manager_response = 'Pending'
BEGIN
    DELETE FROM Job_Seekers_apply_Jobs
    WHERE job=@job AND department=@department and company= @company and job_seeker=@seeker_username 
END
ELSE PRINT 'Unable to delete job. Job does not exist or Already reviewed'
---
--- Staff Member 1 
Go
CREATE PROC Check_in
    @username VARCHAR(20)
AS
DECLARE @Staff_Members_exist VARCHAR(20)
DECLARE @day_off VARCHAR(10)
SELECT @Staff_Members_exist = username, @day_off = day_off
FROM Staff_Members
WHERE username = @username
IF @Staff_Members_exist = @username
    IF @day_off != DATENAME(dw,CURRENT_TIMESTAMP) OR @day_off='Friday'
        INSERT INTO Attendance_Records
        VALUES(
            CONVERT(DATE,CURRENT_TIMESTAMP), @username, CONVERT(time, CURRENT_TIMESTAMP), NULL
        )
    ELSE PRINT 'Trying to attend a day off'
ELSE PRINT 'Invalid operation. Username not a staff member'
---
--- Staff Member 2
GO 
CREATE PROC Check_out
    @username VARCHAR(20)
AS
DECLARE @Staff_Members_exist VARCHAR(20)
DECLARE @day_off VARCHAR(10)
SELECT @Staff_Members_exist = username, @day_off=day_off
FROM Staff_Members
WHERE username = @username
IF @Staff_Members_exist = @username
    IF @day_off != DATENAME(dw,CURRENT_TIMESTAMP) OR @day_off='Friday'
        UPDATE Attendance_Records
        SET end_time = CONVERT(time, CURRENT_TIMESTAMP)
        WHERE attendance_date = CONVERT(DATE,CURRENT_TIMESTAMP) AND staff = @username
    ELSE PRINT 'Trying to attend a day off'
ELSE PRINT 'Invalid operation. Username not a staff member'
--
-- Staff Member 3
GO
CREATE PROC Review_Attendance
    @username VARCHAR(20),
    @from_date DATE = NULL,
    @to_date DATE = NULL
AS
IF @from_date IS NULL AND @to_date IS NULL
SELECT * 
FROM Attendance_Records
WHERE staff = @username
ELSE 
    IF @to_date IS NULL
    SELECT *
    FROM Attendance_Records
    WHERE staff = @username AND attendance_date >= @from_date
    ELSE IF
        @from_date IS NULL
        SELECT *
        FROM Attendance_Records
        WHERE staff = @username AND attendance_date<= @to_date
        ELSE
            SELECT *
            FROM Attendance_Records
            WHERE staff = @username AND attendance_date >= @from_date AND attendance_date <= @to_date

--
-- Staff Member 4
Go
CREATE PROC Apply_for_Leave_Request
    @username VARCHAR(20),
    @replacement VARCHAR(20),
    @from_date DATETIME,
    @to_date DATETIME,
    @type VARCHAR(20)
AS
DECLARE @applicant_exist VARCHAR(20)
DECLARE @replacement_exist VARCHAR(20)
DECLARE @position1 VARCHAR(20)
DECLARE @position2 VARCHAR(20)
DECLARE @annual_leaves int
DECLARE @requests_start DATE
DECLARE @requests_end DATE
DECLARE @company_name VARCHAR(100)
DECLARE @company_replacement VARCHAR(100)
SELECT @annual_leaves = annual_leaves
FROM Staff_Members
WHERE username = @username
IF DATEDIFF(DAY,@from_date,@to_date) < @annual_leaves
    BEGIN 
    SELECT @requests_start = start_date, @requests_end = end_date
    FROM Requests
    WHERE applicant = @username
    IF (@from_date > @requests_start AND @from_date < @requests_end)OR(@to_date>@requests_start AND @to_date<@requests_end)
    PRINT 'Request Overlapping'
    ELSE
        BEGIN
        SELECT @company_replacement = company
        FROM Staff_Members
        Where username = @replacement
        IF @company_name != @company_replacement
        PRINT 'not in same company'
        ELSE
            BEGIN
            SELECT @applicant_exist = username  -- First Check both managers
            FROM Managers
            WHERE username = @username
            IF @applicant_exist = @username
                BEGIN
                PRINT 'Applicant is Manager'
                SET @position1 = 'Manager'
                PRINT 'User 1 is a manager'
                SELECT @replacement_exist = username
                FROM Managers
                WHERE username = @replacement
                IF @replacement_exist = @replacement
                SET @position2 = 'Manager'
                    IF @position1 = @position2
                        BEGIN
                            INSERT INTO Requests(start_date,applicant,end_date,request_date,hr_response,manager,manager_response)
                            VALUES(
                                @from_date,@username,@to_date,CURRENT_TIMESTAMP,'PENDING',@username,'Approved'
                            )
                            INSERT INTO Leave_Requests
                            VALUES(
                                @from_date,@username,@type
                            )
                            INSERT INTO Managers_apply_replace_Requests
                            VALUES(
                                @from_date, @username, @username,@replacement
                            )
                        END
                    ELSE PRINT 'Sorry the replacement is not a manager'
                END
            ELSE
                BEGIN
                SELECT @applicant_exist = username  -- First Check both HR
                FROM HR_Employees
                WHERE username=@username
                IF @applicant_exist = @username
                    BEGIN
                    print 'APPLICANT IS HR'
                    SET @position1 = 'HR'
                    SELECT @replacement_exist = username
                    FROM HR_Employees
                    WHERE username = @replacement
                    IF @replacement_exist = @replacement
                    SET @position2 = 'HR'
                        IF @position1 = @position2
                            BEGIN
                                INSERT INTO Requests (start_date,applicant,end_date,request_date)
                                VALUES(
                                    @from_date,@username,@to_date,CURRENT_TIMESTAMP
                                )
                                INSERT INTO Leave_Requests
                                VALUES(
                                    @from_date,@username,@type
                                )
                                INSERT INTO HR_Employee_apply_replace_Requests
                                VALUES(
                                    @from_date, @username, @username,@replacement
                                )
                            END
                        ELSE PRINT 'Sorry the replacement is not an HR'
                    END
                ELSE
                    BEGIN
                    SELECT @applicant_exist = username  -- Third Check both Reg
                    FROM Regular_Employees
                    WHERE username=@username
                    IF @applicant_exist = @username
                        BEGIN
                        SET @position1 = 'Reg'
                        SELECT @replacement_exist = username
                        FROM Regular_Employees
                        WHERE username = @replacement
                        IF @replacement_exist = @replacement
                        SET @position2 = 'Reg'
                            IF @position1 = @position2
                                BEGIN
                                    INSERT INTO Requests(start_date,applicant,end_date,request_date)
                                    VALUES(
                                        @from_date,@username,@to_date,CURRENT_TIMESTAMP
                                    )
                                    INSERT INTO Leave_Requests
                                    VALUES(
                                        @from_date,@username,@type
                                    )
                                    INSERT INTO Regular_Employees_apply_replace_Requests
                                    VALUES(
                                        @from_date, @username, @username ,@replacement
                                    )
                                END
                            ELSE PRINT 'Sorry the replacement is not an HR'
                        END
                    END
                END
            END
        END
    END
ELSE PRINT 'Sorry, you are out of annual leaves' 
--
-- Staff Member 4 (part 2)
GO
CREATE PROC Apply_for_Business_Request
    @username VARCHAR(20),
    @replacement VARCHAR(20),
    @from_date DATETIME,
    @to_date DATETIME,
    @destination VARCHAR(50),
    @purpose VARCHAR(1000)
AS
DECLARE @applicant_exist VARCHAR(20)
DECLARE @replacement_exist VARCHAR(20)
DECLARE @position1 VARCHAR(20)
DECLARE @position2 VARCHAR(20)
DECLARE @annual_leaves int
DECLARE @requests_start DATE
DECLARE @requests_end DATE
DECLARE @company_name VARCHAR(100)
DECLARE @company_replacement VARCHAR(100)
SELECT @annual_leaves = annual_leaves, @company_name=company
FROM Staff_Members
WHERE username = @username
IF DATEDIFF(DAY,@from_date,@to_date) < @annual_leaves
    BEGIN 
    SELECT @requests_start = start_date, @requests_end = end_date
    FROM Requests
    WHERE applicant = @username
    IF (@from_date > @requests_start AND @from_date < @requests_end)OR(@to_date>@requests_start AND @to_date<@requests_end)
    PRINT 'Request Overlapping'
    ELSE
        BEGIN
        SELECT @company_replacement = company
        FROM Staff_Members
        Where username = @replacement
        IF @company_name != @company_replacement
        PRINT 'not in same company'
        ELSE
            BEGIN
            SELECT @applicant_exist = username  -- First Check both managers
            FROM Managers
            WHERE username = @username
            IF @applicant_exist = @username
                BEGIN
                PRINT 'Applicant is Manager'
                SET @position1 = 'Manager'
                PRINT 'User 1 is a manager'
                SELECT @replacement_exist = username
                FROM Managers
                WHERE username = @replacement
                IF @replacement_exist = @replacement
                SET @position2 = 'Manager'
                    IF @position1 = @position2
                        BEGIN
                            INSERT INTO Requests(start_date,applicant,end_date,request_date,hr_response,manager,manager_response)
                            VALUES(
                                @from_date,@username,@to_date,CURRENT_TIMESTAMP,'PENDING',@username,'Approved'
                            )
                            INSERT INTO Business_Trip_Requests
                            VALUES(
                                @from_date,@username,@destination,@purpose
                            )
                            INSERT INTO Managers_apply_replace_Requests
                            VALUES(
                                @from_date, @username, @username,@replacement
                            )
                        END
                    ELSE PRINT 'Sorry the replacement is not a manager'
                END
            ELSE
                BEGIN
                SELECT @applicant_exist = username  -- First Check both HR
                FROM HR_Employees
                WHERE username=@username
                IF @applicant_exist = @username
                    BEGIN
                    print 'APPLICANT IS HR'
                    SET @position1 = 'HR'
                    SELECT @replacement_exist = username
                    FROM HR_Employees
                    WHERE username = @replacement
                    IF @replacement_exist = @replacement
                    SET @position2 = 'HR'
                        IF @position1 = @position2
                            BEGIN
                                INSERT INTO Requests (start_date,applicant,end_date,request_date)
                                VALUES(
                                    @from_date,@username,@to_date,CURRENT_TIMESTAMP
                                )
                                INSERT INTO Business_Trip_Requests
                                VALUES(
                                    @from_date,@username,@destination,@purpose
                                )
                                INSERT INTO HR_Employee_apply_replace_Requests
                                VALUES(
                                    @from_date, @username, @username,@replacement
                                )
                            END
                        ELSE PRINT 'Sorry the replacement is not an HR'
                    END
                ELSE
                    BEGIN
                    SELECT @applicant_exist = username  -- Third Check both Reg
                    FROM Regular_Employees
                    WHERE username=@username
                    IF @applicant_exist = @username
                        BEGIN
                        SET @position1 = 'Reg'
                        SELECT @replacement_exist = username
                        FROM Regular_Employees
                        WHERE username = @replacement
                        IF @replacement_exist = @replacement
                        SET @position2 = 'Reg'
                            IF @position1 = @position2
                                BEGIN
                                    INSERT INTO Requests(start_date,applicant,end_date,request_date)
                                    VALUES(
                                        @from_date,@username,@to_date,CURRENT_TIMESTAMP
                                    )
                                    INSERT INTO Business_Trip_Requests
                                    VALUES(
                                        @from_date,@username,@destination, @purpose
                                    )
                                    INSERT INTO Regular_Employees_apply_replace_Requests
                                    VALUES(
                                        @from_date, @username, @username ,@replacement
                                    )
                                END
                            ELSE PRINT 'Sorry the replacement is not an HR'
                        END
                    END
                END
            END
        END
    END
ELSE PRINT 'Sorry, you are out of annual leaves' 
----

--- Staff Member 5
GO
CREATE PROC View_Requests
    @username VARCHAR(20)
AS
SELECT *
FROM Requests
WHERE applicant = @username
---
--- Staff Member 6
GO
CREATE PROC Delete_Request
    @start_date DATETIME,
    @username VARCHAR(20)
AS
DECLARE @hr_response VARCHAR(50)
DECLARE @manager_response VARCHAR(50)
SELECT @hr_response = hr_response , @manager_response = manager_response
FROM Requests
WHERE start_date = @start_date and applicant = @username
IF @hr_response = 'Pending' OR @manager_response = 'Pending'
    BEGIN
        DELETE FROM Requests
        WHERE start_date = @start_date AND applicant = @username

        DELETE FROM Leave_Requests
        WHERE start_date = @start_date AND applicant = @username

        DELETE FROM Business_Trip_Requests
        WHERE start_date = @start_date AND applicant = @username
    END
ELSE 
    PRINT 'Sorry, Request already processed'
--
-- Staff Member 7
Go
CREATE PROC Send_email
    @sender VARCHAR(20),
    @recipient VARCHAR(20),
    @subject VARCHAR(50),
    @body VARCHAR(3000)
AS
DECLARE @emailnum int
DECLARE @company1 VARCHAR(100)
DECLARE @company2 VARCHAR(100)
SELECT @company1=company
FROM Staff_Members
WHERE username = @sender
SELECT @company2=company
FROM Staff_Members
WHERE username = @recipient
IF @company1 = @company2
BEGIN
    INSERT INTO Emails (email_subject,email_date,body)
    VALUES(
        @subject,CURRENT_TIMESTAMP,@body
    )
    SELECT @emailnum=SCOPE_IDENTITY()
    INSERT INTO Staff_Members_send_Email_Staff_Members
    VALUES(
         @emailnum ,@recipient,@sender
    )
END
--
-- Staff Member 8
GO
CREATE PROC View_emails
    @recipient VARCHAR(20)
AS
SELECT *
FROM Staff_Members_send_Email_Staff_Members s INNER JOIN Emails e
ON email_number = serial_number
WHERE s.recipient=@recipient
--
--- Staff Member 9
GO
CREATE PROC Reply_email
    @recipient VARCHAR(20),
    @email_number INT,
    @subject VARCHAR(50),
    @body VARCHAR(3000)
AS
DECLARE @sender VARCHAR(20)
DECLARE @emailnum INT
SELECT @sender = sender
FROM Staff_Members_send_Email_Staff_Members
WHERE recipient = @recipient
INSERT INTO Emails (email_subject,email_date,body)
VALUES(
    @subject,CURRENT_TIMESTAMP,@body
)
SELECT @emailnum=SCOPE_IDENTITY()
INSERT INTO Staff_Members_send_Email_Staff_Members
VALUES(
    @emailnum,@sender,@recipient
)
--
-- Staff Member 10
GO
CREATE PROC View_Announcements
    @username VARCHAR(20)
AS
DECLARE @company Varchar(100)
SELECT @company = company
FROM Staff_Members
WHERE username = @username
SELECT *
FROM Announcements a inner join Staff_Members s
ON a.hr_employee = s.username
WHERE s.company = @company AND datediff(day,a.date,CURRENT_TIMESTAMP)<21
--
GO

CREATE PROCEDURE Staff_Members_get_my_department
    @username varchar(20),
    @code int output,
    @company VARCHAR(100) output
AS
    SELECT @code = department, @company = company FROM Staff_Members WHERE username = @username;
GO

CREATE PROCEDURE HR_Employee_check
    @username VARCHAR(20),
    @is_hr BIT OUTPUT
AS
    declare @count int;
    SET @is_hr = 0;

    SELECT @count = COUNT(*) FROM HR_Employees WHERE username = @username

    IF @count > 0
        SET @is_hr = 1
GO

CREATE TYPE q_list AS TABLE (
    question varchar(100) NOT NULL PRIMARY KEY,
    answer varchar(100) NOT NULL
);
GO

CREATE PROCEDURE HR_Employees_add_job /* I forgot to add the questions, add them */
    @username varchar(20),
    @title VARCHAR(20),
    @short_description VARCHAR(100),
    @detailed_description VARCHAR(200),
    @min_experience int,
    @salary int,
    @deadline datetime,
    @no_of_vacancies int,
    @working_hours int,
    @q_list q_list READONLY
AS
    declare @is_hr BIT;
    EXEC HR_Employee_check @username, @is_hr output
    IF @is_hr = 0
        BEGIN
            PRINT 'Request does not exist or you do not have access to it'
            RETURN
        END

    declare @dep int;
    declare @company VARCHAR(100);
    EXEC Staff_Members_get_my_department @username, @dep output, @company output

    INSERT INTO Jobs VALUES(
        @title,
        @dep,
        @company,
        @short_description,
        @detailed_description,
        @min_experience,
        @salary,
        @deadline,
        @no_of_vacancies,
        @working_hours
    )

    DECLARE @inserted_ids TABLE ([id] INT);

    INSERT INTO Questions OUTPUT INSERTED.number INTO @inserted_ids SELECT * FROM @q_list
    INSERT INTO Job_Has_Question SELECT @title, @dep, @company, id FROM @inserted_ids
GO

CREATE PROCEDURE HR_Employees_view_job
    @username VARCHAR(20),
    @title VARCHAR(20)
AS
    declare @is_hr BIT;
    EXEC HR_Employee_check @username, @is_hr output
    IF @is_hr = 0
        BEGIN
            PRINT 'Request does not exist or you do not have access to it'
            RETURN
        END

    declare @dep int;
    declare @company VARCHAR(100);
    EXEC Staff_Members_get_my_department @username, @dep output, @company output
    SELECT * FROM Jobs WHERE title = @title AND department = @dep AND company = @company
GO

CREATE PROCEDURE HR_Employees_update_job
    @username VARCHAR(20),
    @title VARCHAR(20),
    @new_title VARCHAR(20),
    @new_short_description VARCHAR(100),
    @new_detailed_description VARCHAR(200),
    @new_min_experience int,
    @new_salary int,
    @new_deadline datetime,
    @new_no_of_vacancies int,
    @new_working_hours int
AS
    declare @is_hr BIT;
    EXEC HR_Employee_check @username, @is_hr output
    IF @is_hr = 0
        BEGIN
            PRINT 'Request does not exist or you do not have access to it'
            RETURN
        END

    declare @dep int;
    declare @company VARCHAR(100);
    EXEC Staff_Members_get_my_department @username, @dep output, @company output

    UPDATE Jobs SET title = @new_title,
                    short_description = @new_short_description,
                    detailed_description = @new_detailed_description,
                    min_experience = @new_min_experience,
                    salary = @new_salary,
                    deadline = @new_deadline,
                    no_of_vacancies = @new_no_of_vacancies,
                    working_hours = @new_working_hours
        WHERE Jobs.title = @title AND Jobs.department = @dep AND Jobs.company = @company
GO

CREATE PROCEDURE HR_Employees_view_applications /* Does "new" applications mean that the hr_response is pending? I believe so */
    @username VARCHAR(20),
    @job_title VARCHAR(20)
AS
    declare @is_hr BIT;
    EXEC HR_Employee_check @username, @is_hr output
    IF @is_hr = 0
        BEGIN
            PRINT 'Request does not exist or you do not have access to it'
            RETURN
        END

    declare @department int;
    declare @company VARCHAR(100);
    EXEC Staff_Members_get_my_department @username, @department output, @company output

    SELECT Job_Seekers_apply_Jobs.job,
           Job_Seekers_apply_Jobs.score,
           Users.personal_email,
           Users.birth_date,
           Users.years_of_experience,
           Users.first_name,
           Users.middle_name,
           Users.last_name,
           Users.age
        FROM Job_Seekers_apply_Jobs INNER JOIN Users ON
            Job_Seekers_apply_Jobs.job_seeker = Users.username
        WHERE job = @job_title AND
              department = @department AND
              company = @company AND
              hr_response = 'Pending';
GO

CREATE PROCEDURE HR_Employees_accept_reject_applications
    @username VARCHAR(20),
    @job_seeker VARCHAR(20),
    @job VARCHAR(20),
    @response VARCHAR(10)
AS
    declare @is_hr BIT;
    EXEC HR_Employee_check @username, @is_hr output
    IF @is_hr = 0
        BEGIN
            PRINT 'Request does not exist or you do not have access to it'
            RETURN
        END

    declare @department int;
    declare @company VARCHAR(100);
    EXEC Staff_Members_get_my_department @username, @department output, @company output

    UPDATE Job_Seekers_apply_Jobs SET hr_response = @response WHERE job = @job AND
                                                                    job_seeker = @job_seeker AND
                                                                    department = @department AND
                                                                    company = @company AND
                                                                    manager_response = 'Pending';
GO

CREATE PROCEDURE HR_Employees_create_announcement
    @username VARCHAR(20),
    @title VARCHAR(50),
    @type VARCHAR(50),
    @description VARCHAR(MAX)
AS
    declare @is_hr BIT;
    EXEC HR_Employee_check @username, @is_hr output
    IF @is_hr = 0
        BEGIN
            PRINT 'Request does not exist or you do not have access to it'
            RETURN
        END

    INSERT INTO Announcements VALUES(getdate(), @title, @username, @type, @description)
GO

CREATE PROCEDURE HR_Employees_view_requests
    @username VARCHAR(20)
AS
    declare @is_hr BIT;
    EXEC HR_Employee_check @username, @is_hr output
    IF @is_hr = 0
        BEGIN
            PRINT 'Request does not exist or you do not have access to it'
            RETURN
        END

    declare @dep int;
    declare @company_email VARCHAR(50);

    EXEC Staff_Members_get_my_department @username, @dep output, @company_email output;

    SELECT Requests.*, Business_Trip_Requests.destination, Business_Trip_Requests.purpose FROM Requests INNER JOIN Staff_Members
        ON (applicant = Staff_Members.username AND Staff_Members.department = @dep)
    INNER JOIN Business_Trip_Requests ON
        Requests.start_date = Business_Trip_Requests.start_date AND
        Requests.applicant = Business_Trip_Requests.applicant
    WHERE Requests.manager_response = 'Approved'

    SELECT Requests.*, Leave_Requests.type FROM Requests INNER JOIN Staff_Members
        ON (applicant = Staff_Members.username AND Staff_Members.department = @dep)
    INNER JOIN Leave_Requests ON
        Requests.start_date = Leave_Requests.start_date AND
        Requests.applicant = Leave_Requests.applicant
    WHERE Requests.manager_response = 'Approved'
GO

CREATE PROCEDURE HR_Employees_update_requests /* Should updating the value of annual_leaves be exclusive to leave requests? */
    @username VARCHAR(20),
    @applicant VARCHAR(20),
    @start_date DATETIME,
    @response VARCHAR(50)
AS
    declare @is_hr BIT;
    EXEC HR_Employee_check @username, @is_hr output
    IF @is_hr = 0
        BEGIN
            PRINT 'Request does not exist or you do not have access to it'
            RETURN
        END

    declare @dep int;
    declare @company_email VARCHAR(50);
    EXEC Staff_Members_get_my_department @username, @dep output, @company_email output;

    declare @end_date DATETIME;
    
    SELECT @end_date = end_date FROM
        Requests INNER JOIN Staff_Members ON (
            Requests.applicant = Staff_Members.username
        )
    WHERE Staff_Members.department = @dep
            AND Staff_Members.company = @company_email
            AND Staff_Members.username = @applicant
            AND Requests.start_date = @start_date
            AND Requests.manager_response = 'Approved';

    IF @end_date IS NULL
        BEGIN
            PRINT 'Request does not exist or you do not have access to it'
            RETURN
        END
    
    IF @response = 'Approved'
        BEGIN
            declare @annual_leave int;

            SELECT @annual_leave = COUNT(*) FROM Leave_Requests WHERE
                start_date = @start_date AND
                applicant = @applicant AND
                type = 'annual'

            IF @annual_leave > 0
            BEGIN
                declare @start_date_temp DATETIME;
                SET @start_date_temp = @start_date;

                declare @day_off VARCHAR(10);

                SELECT @day_off = day_off FROM Staff_Members

                declare @vacation_days int;
                SET @vacation_days = 0;

                while(@start_date_temp <= @end_date)
                    BEGIN
                        declare @day_name VARCHAR(10);

                        SELECT @day_name = DATENAME(dw, @start_date_temp);

                        IF NOT (@day_name = @day_off OR @day_name = 'Friday')
                            SET @vacation_days = @vacation_days + 1;
                        
                        SET @start_date_temp = DATEADD(d, 1, @start_date_temp)
                    END
                
                declare @annual_leaves int;

                SELECT @annual_leaves = annual_leaves FROM Staff_Members WHERE username = @username

                IF @vacation_days > @annual_leaves
                    PRINT 'Staff member does not have enough annual leaves'
                    RETURN

                UPDATE Staff_Members SET annual_leaves = (@annual_leaves - @vacation_days)
            END

            UPDATE Requests SET hr_response = 'Approved' WHERE
                start_date = @start_date AND
                applicant = @applicant

        END
    ELSE
        BEGIN
            UPDATE Requests SET hr_response = 'Rejected' WHERE
                start_date = @start_date AND
                applicant = @applicant
        END
GO

CREATE PROCEDURE HR_Employees_view_attendance /* Does "Any staff member" mean list all staff members,
    or be able to specify which staff member do you want to view?
    If we need to list all, just remove the WHERE condition and the @staff variable */
    @username VARCHAR(20),
    @start_datetime DATETIME,
    @end_datetime DATETIME
AS
    declare @is_hr BIT;
    EXEC HR_Employee_check @username, @is_hr output
    IF @is_hr = 0
        BEGIN
            PRINT 'Request does not exist or you do not have access to it'
            RETURN
        END

    declare @dep int;
    declare @company_email VARCHAR(50);

    EXEC Staff_Members_get_my_department @username, @dep output, @company_email output;

    declare @temp int;

    SELECT @temp = COUNT(*) FROM Staff_Members WHERE
        username = @staff AND
        department = @dep AND
        company = @company_email;

    IF @temp = 0
    BEGIN
        PRINT 'Staff member not in your department or does not exist'
        RETURN
    END

    SELECT attendance_date,
           start_time,
           end_time,
           DATEDIFF(second, start_time, end_time) / 3600.0 AS duration,
           Jobs.working_hours,
           CASE WHEN Jobs.working_hours > (DATEDIFF(second, start_time, end_time) / 3600.0)
                THEN Jobs.working_hours - (DATEDIFF(second, start_time, end_time) / 3600.0)
                ELSE 0 END AS missed_hours
        FROM Staff_Members INNER JOIN Jobs ON (
            Staff_Members.job = Jobs.title AND
            Staff_Members.department = Jobs.department AND
            Staff_Members.company = Jobs.company
        ) INNER JOIN Attendance_records ON Staff_Members.username = Attendance_records.staff
        WHERE CAST(Attendance_records.attendance_date AS DATETIME) + CAST(CAST(Attendance_records.start_time AS TIME) AS DATETIME) BETWEEN @start_datetime AND @end_datetime
GO

CREATE PROCEDURE HR_Employees_total_hours /* Check if this is correct. Should the total hours be total working hours? */
    @username VARCHAR(20),
    @year int
AS
    declare @is_hr BIT;
    EXEC HR_Employee_check @username, @is_hr output
    IF @is_hr = 0
        BEGIN
            PRINT 'Request does not exist or you do not have access to it'
            RETURN
        END

    declare @dep int;
    declare @company_email VARCHAR(50);

    EXEC Staff_Members_get_my_department @username, @dep output, @company_email output;

    SELECT username,
       ISNULL(January, 0) as January,
       ISNULL(February, 0) as February,
       ISNULL(March, 0) as March,
       ISNULL(April, 0) as April,
       ISNULL(May, 0) as May,
       ISNULL(June, 0) as June,
       ISNULL(July, 0) as July,
       ISNULL(August, 0) as August,
       ISNULL(September, 0) as September,
       ISNULL(October, 0) as October,
       ISNULL(November, 0) as November,
       ISNULL(December, 0) as December FROM(
    SELECT Staff_Members.username,
           DATENAME(MONTH, attendance_date) as month,
           DATEDIFF(second, start_time, end_time) / 3600.0 as duration
    FROM Staff_Members
        LEFT OUTER JOIN(
            SELECT * FROM Attendance_Records WHERE YEAR(attendance_date) = @year
        ) a ON Staff_Members.username = a.staff
        WHERE Staff_Members.company = @company_email AND
              Staff_Members.department = @dep
    ) d
    PIVOT (
        SUM(duration) for month in (
            January,
            February,
            March,
            April,
            May,
            June,
            July,
            August,
            September,
            October,
            November,
            December)
    ) piv;
GO

CREATE PROCEDURE HR_Employees_view_high_achievers
    @username VARCHAR(20)
AS
    declare @is_hr BIT;
    EXEC HR_Employee_check @username, @is_hr output
    IF @is_hr = 0
        BEGIN
            PRINT 'Request does not exist or you do not have access to it'
            RETURN
        END

    declare @dep int;
    declare @company_email VARCHAR(50);

    EXEC Staff_Members_get_my_department @username, @dep output, @company_email output;

    SELECT TOP 3 Users.first_name, Users.middle_name, Users.last_name, SUM(DATEDIFF(second, Attendance_Records.start_time, Attendance_Records.end_time) / 3600.0) as hours_spent
        FROM Regular_Employees INNER JOIN Attendance_Records
            ON Regular_Employees.username = Attendance_Records.staff
        INNER JOIN Staff_Members ON Regular_Employees.username = Staff_Members.username
        INNER JOIN Users ON Staff_Members.username = Users.username
        WHERE Staff_Members.department = @dep
              AND Staff_Members.company = @company_email
              AND NOT EXISTS(SElECT * FROM Tasks WHERE
                Tasks.regular_employee = Regular_Employees.username
                AND Tasks.status <> 'Fixed'
              )
        GROUP BY Users.first_name, Users.middle_name, Users.last_name
        ORDER BY hours_spent DESC;
GO

-- CREATE PROCEDURE Managers_view_requests
--     @username VARCHAR(20)
-- AS
--     declare @type VARCHAR(50);
--     SELECT @type = type FROM Managers WHERE username = @username;

--     declare @dep int;
--     declare @company_email VARCHAR(50);

--     EXEC Staff_Members_get_my_department @username, @dep output, @company_email output;

--     SELECT * FROM Requests INNER JOIN Staff_Members
--             ON Requests.applicant = Staff_Members.username
--         WHERE Staff_Members.company = @company_email
--               AND Staff_Members.department = @dep
--               AND (@type = 'HR' OR NOT EXISTS (
--                   SELECT * FROM HR_Employees WHERE Requests.applicant = HR_Employees.username
--               ))
-- GO

CREATE PROCEDURE Regular_Employees_view_projects
    @username VARCHAR(20)
AS
    SELECT Projects.* FROM Managers_assign_Regular_Employees_Projects INNER JOIN Projects
        ON Managers_assign_Regular_Employees_Projects.company = Projects.company
           AND Managers_assign_Regular_Employees_Projects.project_name = Projects.name
        WHERE Managers_assign_Regular_Employees_Projects.regular_employee = @username
GO

CREATE PROCEDURE Regular_Employees_view_tasks /* Should I view only my tasks?
    Assigned to me here means project, or task? */
    @username VARCHAR(20),
    @project_name VARCHAR(20)
AS
    SELECT Tasks.* FROM Managers_assign_Regular_Employees_Projects INNER JOIN Projects
        ON Managers_assign_Regular_Employees_Projects.company = Projects.company
           AND Managers_assign_Regular_Employees_Projects.project_name = Projects.name
        INNER JOIN Tasks ON Tasks.project = Projects.name AND Tasks.company = Projects.company
        WHERE Managers_assign_Regular_Employees_Projects.regular_employee = @username
GO

CREATE PROCEDURE Regular_Employee_finalize_task
    @username VARCHAR(20),
    @project_name VARCHAR(20),
    @task_name VARCHAR(20)
AS
    declare @dep int;
    declare @company_email VARCHAR(50);

    EXEC Staff_Members_get_my_department @username, @dep output, @company_email output;

    UPDATE Tasks SET status = 'Fixed' WHERE
        Tasks.name = @task_name AND
        Tasks.company = @company_email AND
        Tasks.project = @project_name AND
        Tasks.deadline >= GETDATE() AND
        Tasks.regular_employee = @username AND
        Tasks.status = 'Assigned'
GO
----- regular 4
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
-- manager1

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
--------------
-- manager2
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

---------------
-- manager3
GO
CREATE PROCEDURE View_All_Applications
    @manager_name VARCHAR(20),
    @job_name VARCHAR(20)
AS
    DECLARE @manager_department int
    DECLARE @company_check VARCHAR(100)
    EXEC Staff_Members_get_my_department @manager_name , @manager_department output, @company_check output
    --below i showed all information of the job seeker except the username and password
    SELECT job ,score ,U.personal_email,U.birth_date,U.years_of_experience,U.first_name,U.middle_name,U.last_name,U.age
    FROM Job_Seekers_apply_Jobs J inner JOIN Users U on U.username=J.job_seeker AND J.company=@company_check
    WHERE @manager_department= J.department AND J.hr_response= 'Approved' and J.manager_response = 'Pending' and job=@job_name


GO
----------
GO
-- manager4
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
----------------
-- manager5
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
-- manager6
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

-----
-- manager7
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

-------
-- manager8
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

---------
Go
-- manager9
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

-----------
-- manager10
CREATE PROCEDURE Change_regular_employee_on_a_task
  @manager_name VARCHAR(20) ,
   @project_name_in VARCHAR(20),
   @task_in VARCHAR(20),
  @regular_employee_in VARCHAR(20)
  AS
    DECLARE @manager_company VARCHAR(100)
    DECLARE @manager_department int
    EXEC Staff_Members_get_my_department @manager_name , @manager_department output, @manager_company output
    INSERT INTO Managers_assign_Regular_Employees_Projects VALUES(
     @project_name_in, @manager_company, @regular_employee_in, @manager_name
    )
    UPDATE  Tasks
    Set regular_employee = @regular_employee_in
    WHERE @manager_name= manager AND @project_name_in = project and @task_in=name AND status='Assigned' AND regular_employee is not null and @manager_company= company
GO

----
-- manager11
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

------
-- manager12
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
