CREATE Table Staff_Members
(
username VarCHAR(50) PRIMARY KEY ,
company_email VARCHAR(50) Not NULL,
day_off datetime Not NULL,
salary INT Not NULL,
job VARCHAR(50) Not NULL,
department DECIMAL(10,2) Not NULL,
company  VARCHAR(50) Not NULL,
CHECK(salary>=0),
FOREIGN KEY(username) REFERENCES Users ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(job,department,company) REFERENCES Jobs ON DELETE CASCADE ON UPDATE CASCADE,
)
;

CREATE Table Job_Seekers_apply_Jobs
(
job VarCHAR(50) ,
department VarCHAR(50)   ,
company VarCHAR(50)   ,
job_seeker VarCHAR(50) ,
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
    staff VARCHAR(50)  Not NULL,
    FOREIGN KEY(staff) REFERENCES Staff_Members ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE Emails(
    serial_number int PRIMARY KEY IDENTITY ,
    email_subject VARCHAR(50),
    email_date DATETIME Not NULL,
    body VARCHAR(1000),
);

CREATE TABLE Staff_Members_send_Email_Staff_Members(
    email_number int IDENTITY,
    recipient VARCHAR(50) ,
    sender VARCHAR(50) Not NULL,
    PRIMARY KEY(email_number,recipient),
    FOREIGN KEY(email_number) REFERENCES Emails ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(recipient) REFERENCES Staff_Members ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(sender) REFERENCES Staff_Members ON DELETE Set NUll  ON UPDATE CASCADE

);

CREATE TABLE HR_Employees( 
    username VARCHAR(50) PRIMARY KEY ,
    FOREIGN KEY(username) REFERENCES Staff_Members ON DELETE CASCADE ON UPDATE CASCADE,
);
CREATE TABLE Regular_Employees( 
    username VARCHAR(50) PRIMARY KEY ,
    FOREIGN KEY(username) REFERENCES Staff_Members ON DELETE CASCADE ON UPDATE CASCADE,
);