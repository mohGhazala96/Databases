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

