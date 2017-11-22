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
                                                                    company = @company;
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

CREATE PROCEDURE HR_Employees_view_requests /* Does "Approved by a manager only" mean that we should exclude those approved by HR? */
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

    SELECT * FROM Requests INNER JOIN Staff_Members
        ON (applicant = Staff_Members.username AND Staff_Members.department = @dep)
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
    @staff VARCHAR(20),
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