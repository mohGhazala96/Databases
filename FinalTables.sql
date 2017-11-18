

CREATE TABLE Companies (
email  varchar(100) NOT NULL PRIMARY KEY ,
name varchar(40) NOT NULL ,
address  varchar(300) NOT NULL ,
domain varchar(50) NOT NULL ,
type   varchar(20) ,
vision  varchar(300) ,
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
name varchar ( 40 ) NOT NULL ,
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
annual_leaves int Not NULL,
company_email VARCHAR(50) Not NULL,
day_off VARCHAR(10) Not NULL,
salary INT Not NULL,
job VARCHAR(20) Not NULL,
department int Not NULL,
company  VARCHAR(100) Not NULL,
CHECK(salary>=0),
CHECK(day_off='Friday' or day_off='Saturday' or day_off='Sunday' or day_off='Monday' or day_off='Tuesday' or day_off='Wednesday' or day_off='Thursday' ),
FOREIGN KEY(username) REFERENCES Users ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(job,department,company) REFERENCES Jobs ON DELETE CASCADE ON UPDATE CASCADE,
)
;

CREATE Table Job_Seekers_apply_Jobs
(
job VarCHAR(20),
department int ,
company VarCHAR(100)   ,
job_seeker VarCHAR(20) ,
hr_response VarCHAR(10) Not NULL DEFAULT 'Pending', 
manager_response VarCHAR(10) Not NULL DEFAULT 'Pending',
score INT Not NULL,
CHECK(hr_response= 'Approved' or hr_response='Rejected' or hr_response='Pending'),
CHECK(manager_response= 'Approved' or manager_response='Rejected' or manager_response='Pending'),
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


CREATE TABLE Staff_Members_send_Email_Staff_Members(
    email_number int ,
    recipient VARCHAR(20) ,
    sender VARCHAR(20) Not NULL,
    PRIMARY KEY(email_number,recipient),
    FOREIGN KEY(email_number) REFERENCES Emails ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(recipient) REFERENCES Staff_Members(username) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(sender) REFERENCES Staff_Members(username)  ON DELETE No Action  ON UPDATE No Action ,

);

CREATE TABLE HR_Employees( 
    username VARCHAR(20) PRIMARY KEY ,
    FOREIGN KEY(username) REFERENCES Staff_Members ON DELETE CASCADE ON UPDATE CASCADE,
);
CREATE TABLE Regular_Employees( 
    username VARCHAR(20) PRIMARY KEY ,
    FOREIGN KEY(username) REFERENCES Staff_Members ON DELETE CASCADE ON UPDATE CASCADE,
);
CREATE TABLE Managers(
    username VARCHAR (20),
    type VARCHAR (50) NOT NULL,

    PRIMARY KEY (username),
    FOREIGN KEY (username) REFERENCES Staff_Members (username) ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE Announcements(
    date DATETIME,
    title VARCHAR(50),
    hr_employee VARCHAR (20),
    type VARCHAR (50) NOT NULL,
    description VARCHAR(MAX) NOT NULL, 

    PRIMARY KEY (date, title, hr_employee),
    FOREIGN KEY (hr_employee) REFERENCES HR_Employees (username) ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE Requests(
    start_date DATETIME,
    applicant VARCHAR(20),
    end_date DATETIME NOT NULL,
    request_date DATETIME NOT NULL,
    total_days AS end_date - start_date,
    hr_employee VARCHAR(20),
    hr_response VARCHAR(50) DEFAULT 'Pending' ,
    manager VARCHAR (20),
    manager_response VARCHAR(50) DEFAULT 'Pending' ,
    manager_reason VARCHAR(MAX),

    CHECK(hr_response= 'Approved' or hr_response='Rejected' or hr_response='Pending'),
    CHECK(manager_response= 'Approved' or manager_response='Rejected' or manager_response='Pending'),

    PRIMARY KEY (start_date, applicant),
    FOREIGN KEY (applicant) REFERENCES Staff_Members (username) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (hr_employee) REFERENCES HR_Employees (username) ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (manager) REFERENCES Managers (username) ON DELETE NO ACTION ON UPDATE NO ACTION
)

CREATE TABLE Leave_Requests(
    start_date DATETIME,
    applicant VARCHAR(20),
    type VARCHAR(20),
    PRIMARY KEY (start_date, applicant),
    FOREIGN KEY (start_date, applicant) REFERENCES Requests (start_date, applicant) ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE Business_Trip_Requests(
    start_date DATETIME,
    applicant VARCHAR(20),
    destination VARCHAR(50) NOT NULL,
    purpose VARCHAR(1000) NOT NULL,

    PRIMARY KEY (start_date, applicant),
    FOREIGN KEY (start_date, applicant) REFERENCES  Requests (start_date, applicant) ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE HR_Employee_apply_replace_Requests(
    start_date DATETIME,
    applicant VARCHAR(20),
    hr_employee VARCHAR(20),
    replacement VARCHAR(20) NOT NULL,

    PRIMARY KEY (start_date, applicant),
    FOREIGN KEY (start_date, applicant) REFERENCES  Requests (start_date, applicant) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (hr_employee) REFERENCES  HR_Employees (username) ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (replacement) REFERENCES  HR_Employees (username) ON DELETE NO ACTION ON UPDATE NO ACTION
) 

CREATE TABLE Regular_Employees_apply_replace_Requests( 
  start_date datetime NOT NULL,
  applicant VARCHAR(20) NOT NULL,
  reg_employee VARCHAR(20) NOT NULL,
  replacement VARCHAR(20) NOT NULL,
  FOREIGN KEY(start_date, applicant) REFERENCES Requests ON DELETE CASCADE On UPDATE CASCADE,
  FOREIGN KEY(reg_employee) REFERENCES Regular_Employees ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY(replacement) REFERENCES Regular_Employees ON DELETE NO ACTION ON UPDATE NO ACTION,
  PRIMARY KEY(start_date, applicant)
)

CREATE TABLE Managers_apply_replace_Requests(
  start_date datetime NOT NULL,
  applicant VARCHAR(20) NOT NULL,
  manager VARCHAR(20) NOT NULL FOREIGN KEY REFERENCES Managers ON DELETE NO ACTION ON UPDATE NO ACTION,
  replacement VARCHAR(20) NOT NULL FOREIGN KEY REFERENCES Managers ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY(start_date, applicant) REFERENCES Requests ON DELETE CASCADE On UPDATE CASCADE,
  PRIMARY KEY(start_date, applicant)
)

CREATE TABLE Projects(
  name VARCHAR(20) NOT NULL,
  company VARCHAR(100) NOT NULL FOREIGN KEY REFERENCES Companies ON DELETE CASCADE  On UPDATE CASCADE,
  start_date datetime,
  end_date datetime,
  manager VARCHAR(20) FOREIGN KEY REFERENCES Managers ON DELETE NO ACTION ON UPDATE No ACTION,
  PRIMARY KEY(name, company)
)

CREATE TABLE Managers_assign_Regular_Employees_Projects( 
  project_name VARCHAR(20) NOT NULL,
  company VARCHAR(100) NOT NULL,
  regular_employee VARCHAR(20) NOT NULL FOREIGN KEY REFERENCES Regular_Employees ON DELETE NO ACTION ON UPDATE No ACTION,
  manager VARCHAR(20) NOT NULL FOREIGN KEY REFERENCES Managers ON DELETE NO ACTION ON UPDATE No ACTION,
  FOREIGN KEY(project_name, company) REFERENCES Projects ON DELETE CASCADE On UPDATE CASCADE,
  PRIMARY KEY(project_name, company, regular_employee)
)

CREATE TABLE Tasks( 
  name VARCHAR(20) NOT NULL,
  project VARCHAR(20) NOT NULL,
  company VARCHAR(100) NOT NULL,
  deadline datetime,
  status VARCHAR(10) DEFAULT 'Open' NOT NULL,
  description VARCHAR(MAX) NOT NULL,
  regular_employee VARCHAR(20)  FOREIGN KEY REFERENCES Regular_Employees ON DELETE NO ACTION ON UPDATE No ACTION, --can be null as the manager can define the task first
  manager VARCHAR(20) NOT NULL FOREIGN KEY REFERENCES Managers ON DELETE NO ACTION ON UPDATE No ACTION,
  CHECK(status = 'Fixed' or status = 'Assigned' or status='Open' or status ='Closed'),
  FOREIGN KEY(project, company) REFERENCES Projects ON DELETE CASCADE On UPDATE CASCADE,
  PRIMARY KEY(name, project, company)
)

CREATE TABLE Task_Comments(
  task_name VARCHAR(20) NOT NULL,
  project VARCHAR(20) NOT NULL,
  company VARCHAR(100) NOT NULL,
  comment VARCHAR(700) NOT NULL,
  FOREIGN KEY(task_name, project, company) REFERENCES Tasks ON DELETE CASCADE On UPDATE CASCADE,
  PRIMARY KEY(task_name, project, company, comment)
)
