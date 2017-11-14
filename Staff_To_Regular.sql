
CREATE TABLE Companies (
email  varchar(100) NOT NULL PRIMARY KEY ,
name varchar(40) NOT NULL ,
address  varchar(50) NOT NULL ,
domain varchar(50) NOT NULL ,
type   varchar(20) ,
vision  varchar(50) ,
specialization varchar(20) NOT NULL
);

CREATE TABLE Company_Phone_Numbers (

company varchar(100) NOT NULL ,
phone char(11)  NOT NULL ,
PRIMARY KEY (phone , company),
FOREIGN KEY (company) REFERENCES Companies (email)  ON DELETE CASCADE ON UPDATE CASCADE
)



CREATE TABLE Departments (
code int IDENTITY NOT NULL ,
company varchar(100) NOT NULL  ,
name varchar ( 20 ) NOT NULL ,
PRIMARY KEY (code ,company),
FOREIGN KEY (company) REFERENCES Companies (email)  ON DELETE CASCADE ON UPDATE CASCADE

);



CREATE TABLE Jobs ( 

title varchar(20) NOT NULL ,
department int NOT NULL ,
company varchar(100) NOT NULL ,
short_description varchar(100) NOT NULL,
detailed_description varchar(200) NOT NULL,
min_experience int NOT NULL , 
salary int , 
deadline datetime NOT NULL ,
no_of_vacancies int ,
working_hours int NOT NULL ,


PRIMARY KEY ( title , department , company ) ,
FOREIGN KEY ( department , company ) REFERENCES Departments( code , company ) ON DELETE CASCADE ON UPDATE CASCADE

);


CREATE TABLE Questions (

number int identity  NOT NULL PRIMARY KEY ,
question varchar(100) NOT NULL,
answer varchar(100) NOT NULL

);



CREATE TABLE Job_Has_Question(

job varchar (20) NOT NULL, 
department int NOT NULL , 
company varchar ( 100 ) NOT NULL , 
question int,
PRIMARY KEY ( job, department, company, question ) ,
FOREIGN KEY (job, department, company  ) REFERENCES Jobs( title , department , company ) ,
FOREIGN KEY (question) REFERENCES Questions ( number )

);




CREATE TABLE Users(

username varchar(20) PRIMARY KEY NOT NULL , 
password varchar(30) NOT NULL , 
personal_email varchar(100) NOT NULL , 
birth_date datetime NOT NULL , 
years_of_experience int  NOT NULL , 
first_name varchar (30) NOT NULL , 
middle_name varchar (30)  ,
last_name varchar(30) NOT NULL , 

age AS ( YEAR(CURRENT_TIMESTAMP) - YEAR(birth_date) )

);



CREATE TABLE  User_Job (

job varchar(20) NOT NULL ,
username varchar(20) NOT NULL FOREIGN KEY ( username ) REFERENCES Users(username)

PRIMARY KEY ( job , username )

);



CREATE TABLE Job_Seekers(

username varchar(20) PRIMARY KEY FOREIGN KEY REFERENCES Users(username)

);


CREATE Table Staff_Members
(
username VarCHAR(20) PRIMARY KEY ,
company_email VARCHAR(50) Not NULL,
day_off datetime Not NULL,
salary INT Not NULL,
job VARCHAR(20) Not NULL,
department int Not NULL,
company  VARCHAR(100) Not NULL,
CHECK(salary>=0),
FOREIGN KEY(username) REFERENCES Users ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(job,department,company) REFERENCES Jobs ON DELETE CASCADE ON UPDATE CASCADE,
)
;

CREATE Table Job_Seekers_apply_Jobs
(
job VarCHAR(20) ,
department int  ,
company VarCHAR(100)   ,
job_seeker VarCHAR(20) ,
hr_response VarCHAR(10) Not NULL, 
manager_response VarCHAR(10) Not NULL,
score INT Not NULL,
CHECK (hr_response= 'Accepted' or hr_response='Rejected' or hr_response='Waiting' ),-- as it can be only rejected accepted or waiting
CHECK (manager_response= 'Accepted' or manager_response='Rejected' or manager_response='Waiting' ), -- as it can be only rejected, accepted  or waiting
CHECK(score>=0),
PRIMARY KEY(job,department,company,job_seeker),
FOREIGN KEY(job,department,company) REFERENCES Jobs ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(job_seeker) REFERENCES Job_Seekers ON DELETE CASCADE ON UPDATE CASCADE
)
;
CREATE TABLE Attendance_Records(
    attendace_date date PRIMARY KEY ,
    start_time DATETIME Not NULL,
    end_time DATETIME Not NULL,
    staff VARCHAR(20)  Not NULL,
    FOREIGN KEY(staff) REFERENCES Staff_Members ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE Emails(
    serial_number int PRIMARY KEY IDENTITY ,
    email_subject VARCHAR(50),
    email_date DATETIME Not NULL,
    body VARCHAR(3000),
);
DROP TABLE Staff_Members_send_Email_Staff_Members

CREATE TABLE Staff_Members_send_Email_Staff_Members(
    email_number int ,
    recipient VARCHAR(20) ,
    sender VARCHAR(20) Not NULL,
    PRIMARY KEY(email_number,recipient),
    FOREIGN KEY(email_number) REFERENCES Emails ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(recipient) REFERENCES Staff_Members ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(sender) REFERENCES Staff_Members ON DELETE CASCADE  ON UPDATE CASCADE

);

CREATE TABLE HR_Employees( 
    username VARCHAR(20) PRIMARY KEY ,
    FOREIGN KEY(username) REFERENCES Staff_Members ON DELETE CASCADE ON UPDATE CASCADE,
);
CREATE TABLE Regular_Employees( 
    username VARCHAR(20) PRIMARY KEY ,
    FOREIGN KEY(username) REFERENCES Staff_Members ON DELETE CASCADE ON UPDATE CASCADE,
);