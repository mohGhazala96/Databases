
---
Go
CREATE PROC Job_save_score
    @job_applied_for VARCHAR(20),
    @department int,
    @company VARCHAR(100),
    @seeker_username VARCHAR(20),
    @score int
AS
    UPDATE Job_Seekers_Apply_Jobs
    SET score = @score 
    WHERE job = @job_applied_for AND department = @department AND company = @company AND job_seeker=@seeker_username
--
exec Job_save_score 'Engineer', 6, 'info@facebook.com','Hossam.Azzab',300
--
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
    SELECT @job_applied_for= job, @department = department, @company = company, @hr_response = hr_response, @score = score
    FROM Job_Seekers_apply_Jobs
    WHERE job_seeker = @seeker_username
---
exec Review_Job_Status 'Hossam.Azzab'
---
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
                END
                ELSE PRINT 'Please Pick a day off other than Friday'    
            END
        END     
    ELSE PRINT 'Invalid Job -- Rejected'
END
---
EXEC Choose_Job 'Engineer', 6, 'info@facebook.com','Khaled.Hanafy','Saturday'
---
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
ELSE PRINT @hr_response + @manager_response
---
EXEC Delete_Job 'Graphic Designer', 8, 'info@facebook.com','Hello.world'

