use Company4

GO

-- 1
ALTER PROC Company_Search 
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

EXEC Company_Search NULL , NULL , 'International'
EXEC Company_Search 'Microsoft' , NULL , 'International'
EXEC Company_Search NULL ,'Tesla Motors. 3500 Deer Creek Road.Palo Alto, CA 94304.' ,NULL

go
CREATE PROC InsertEmployeeSP
@name VARCHAR(50),
@hasInsurance BIT,
@birthCountryId SMALLINT,
@companyId INT,
@age INT
AS
IF @name IS NULL or @hasInsurance IS NULL or @birthCountryId IS NULL or
@companyId IS NULL or @age IS NULL
print 'One of the inputs is null'
Else
INSERT INTO Employee(name, has_insurance, birth_country_id, company_id, age)
VALUES(@name, @hasInsurance, @birthCountryId, @companyId, @age)

go

/* Procedure 2 */

CREATE PROC List_Of_Companies
AS
SELECT *
FROM Companies c
go

EXEC List_Of_Companies

go

-- Procedure 3
CREATE PROC View_Company_Department
@company varchar(40)
AS
SELECT c.* , d.*
FROM Companies c inner join Departments d ON c.email = d.company
WHERE  c.email = @company

go 

EXEC View_Company_Department 'hr@Microsoft.com'
GO


-- 4
CREATE PROC Department_Jobs
@company varchar(40) ,
@department int 
AS
SELECT d.* , j.*
FROM Departments d inner join Jobs j ON j.department = d.code AND j.company = d.company
WHERE d.company =  @company AND d.code = @department  AND   j.no_of_vacancies > 0

EXEC Department_Jobs 'hr@Microsoft.com' , 1

GO

-- 5
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

EXEC Register 'Khalid.K' , 'abcdef' , 'Mamdouh@gmail.com' , '03/12/1990'  , 15 , 'Khalid' , 'Mohamed' , 'Mamdouh'

GO


--6

  


ALTER DATABASE Company4 SET COMPATIBILITY_LEVEL = 130

GO


alter PROC Search_Job 
@key varchar(100)
AS
SELECT *
FROM Jobs j
WHERE j.no_of_vacancies > 0 AND EXISTS (SELECT value  
    FROM STRING_SPLIT(@key, ' ') 
    WHERE value IN (SELECT value  
	   FROM STRING_SPLIT(j.short_description, ' ' )) )



EXEC Search_Job 'innovating'
EXEC Search_Job 'CEO'
EXEC Search_Job 'Teach Company'

GO
-- PROCEDURE 7

CREATE PROC Jobs_Sorted
AS


SELECT AVG(j.salary)
FROM Companies c inner join Jobs j ON c.email = j.company
GROUP BY c.email
ORDER BY AVG(j.salary)

go

EXEC Jobs_Sorted


GO



ALTER PROC Login
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

DECLARE @out varchar(100)
EXEC Login 'Albert.enstein' , 'abcdef' , @out OUTPUT
print @out

DECLARE @out varchar(100)
EXEC Login 'Ahmed.Mohamed' , 'ab123' , @out OUTPUT
print @out


INSERT INTO Users
VALUES ( 'Albert.enstein' , 'abcdef' , 'Albert.enstein@gmail.com' , 03/12/1990  , 15 , 'Albert' , 'Steve' , 'enstein'   );
INSERT INTO Users
VALUES ( 'John.Harris' , '12345' , 'John.Harris@gmail.com' , 06/11/1990  , 1 , 'John' , 'Albert' , 'Harris'   );
INSERT INTO Users
VALUES ( 'Steve.Sipser' , 'ab123' , 'Steve.Sipser@yahoo.com' , 05/07/1991 , 1 , 'Steve' , 'Michael' , 'Sipser'   );
INSERT INTO Users
VALUES ( 'Rami.Kamal' , 'a12be' , 'Rami.Kamal@outlook.com' , 04/07/1992  , 10 , 'Rami' , 'Momdouh' , 'Kamal'   );
INSERT INTO Job_Seekers
VALUES ( 'Albert.enstein' )
INSERT INTO Job_Seekers
VALUES ( 'John.Harris' )

INSERT INTO Job_Seekers
VALUES ( 'John.Steve' )


GO

ALTER PROC View_Information
@username varchar(100)
AS
SELECT *
FROM  Users u
WHERE u.username = @username


EXEC View_Information 'Ahmed.Massoud'

GO


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

EXEC Edit 'John.Harris' , 'abcdef' , 'Mostafa.Mamdouh@gmail.com' , '03/12/1990'  , 15 , 'Mostafa' , 'Ahmed' , 'Mamdouh' 

GO

ALTER PROC  Apply
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

EXEC Apply 'Engineer' , 6 , 'info@facebook.com' , 'Albert.enstein'
EXEC Apply 'Engineer' , 6 , 'info@facebook.com' , 'John.Harris'
EXEC Apply 'Engineer' , 6 , 'info@facebook.com' , 'John.Harris'

GO

ALTER PROC View_Question 
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

INSERT INTO Questions ( question , answer  )
VALUES ('What is the Programming language you know best' , 'Python'    );
INSERT INTO Questions ( question , answer  )
VALUES ('What is the String in C++' , 'Array of chars'    );
INSERT INTO Questions ( question , answer  )
VALUES ('How to implement merge sort' , 'divide and conquer'    );

INSERT INTO Job_Has_Question
VALUES ( 'CEO' , 9 , 'info@tesla.com' , 3 );
INSERT INTO Job_Has_Question
VALUES ( 'CEO' , 9 , 'info@tesla.com' , 4 );
INSERT INTO Job_Has_Question
VALUES ( 'Engineer' , 2 , 'hr@Microsoft.com' , 2 );

GO

EXEC View_Question  'CEO' , 9 , 'info@tesla.com' 
EXEC View_Question  'Engineer' , 2 , 'hr@Microsoft.com'




GO

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



INSERT INTO Job_Seekers_apply_Jobs ( job ,     department  , company  , job_seeker , score )
VALUES ( 'CEO' , 9 , 'info@tesla.com' , 'John.Steve' , 100  );

EXEC Save_Score  'Engineer' , 6 , 'info@facebook.com' , 'Albert.enstein'  , 100
EXEC Save_Score  'CEO' , 9 , 'info@tesla.com' , 'John.Steve'  , 50
