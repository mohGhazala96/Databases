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
GO
exec Review_Job_Status 'Hossam.Azzab'
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
GO
EXEC Choose_Job 'Engineer', 6, 'info@facebook.com','Khaled.Hanafy','Saturday'
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
GO
EXEC Delete_Job 'Graphics Designer', 8, 'info@facebook.com','Hello.world'
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
GO
exec Check_in 'ElonMusk'
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
        WHERE attendace_date = CONVERT(DATE,CURRENT_TIMESTAMP) AND staff = @username
    ELSE PRINT 'Trying to attend a day off'
ELSE PRINT 'Invalid operation. Username not a staff member'
--
GO
exec Check_out 'ElonMusk'
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
    WHERE staff = @username AND attendace_date >= @from_date
    ELSE IF
        @from_date IS NULL
        SELECT *
        FROM Attendance_Records
        WHERE staff = @username AND attendace_date<= @to_date
        ELSE
            SELECT *
            FROM Attendance_Records
            WHERE staff = @username AND attendace_date >= @from_date AND attendace_date <= @to_date

--
GO
exec Review_Attendance 'ElonMusk', '2017-11-19'
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
GO
exec Apply_for_Leave_Request 'ElonMusk', 'BenedictCumberbatch', '2017-11-27', '2017-12-3', 'Medical'
exec Apply_for_Leave_Request 'JenniferLaw', 'BenedictCumberbatch', '2017-11-27', '2017-12-3', 'Medical'
exec Apply_for_Leave_Request 'JenniferLaw', 'EmmaStone', '2017-11-27', '2017-12-3', 'Medical'
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
GO
exec Apply_for_Business_Request 'ElonMusk', 'bakr.mostafa', '2017-11-27', '2017-12-3', 'Cairo','Buy'
exec Apply_for_Business_Request 'ElonMusk', 'BenedictCumberbatch', '2017-11-27', '2017-12-3', 'Cairo','Buy'
exec Apply_for_Business_Request 'JenniferLaw', 'BenedictCumberbatch', '2017-11-27', '2017-12-3', 'Cairo', 'Buy'
exec Apply_for_Business_Request 'JenniferLaw', 'EmmaStone', '2017-11-27', '2017-12-3', 'Cairo', 'Buy'
--- Staff Member 5
GO
CREATE PROC View_Requests
    @username VARCHAR(20)
AS
SELECT *
FROM Requests
WHERE applicant = @username
---
Go
exec View_Requests 'ElonMusk'
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
GO
exec Delete_Request '2017-11-27', 'JenniferLaw'
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
---
GO
exec Send_email 'ElonMusk', 'JenniferLaw','Welcome','You are awesome'

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
GO
exec View_emails 'JenniferLaw'
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
GO
exec Reply_email 'JenniferLaw', 1, 'Thank you!','I Love you too'
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
WHERE s.company = @company AND datediff(day,date,CURRENT_TIMESTAMP)<90
--
exec View_Announcements 'ElonMusk'

