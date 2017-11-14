use Company 



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

phone char(11)  NOT NULL ,
company varchar(100) NOT NULL
PRIMARY KEY (phone , company),
FOREIGN KEY (company) REFERENCES Companies (email)  ON DELETE CASCADE ON UPDATE CASCADE
)



CREATE TABLE Departments (
code int IDENTITY NOT NULL ,
name varchar ( 20 ) NOT NULL ,
company varchar(100) NOT NULL 

PRIMARY KEY (code ,company),
FOREIGN KEY (company) REFERENCES Companies (email)  ON DELETE CASCADE ON UPDATE CASCADE

);



CREATE TABLE Jobs ( 

title varchar(20) NOT NULL ,
short_description varchar(100) NOT NULL,
detailed_description varchar(200) NOT NULL,
min_experience int NOT NULL , 
salary int , 
deadline datetime NOT NULL ,
no_of_vacancies int ,
working_hours int NOT NULL ,
department int NOT NULL ,
company varchar(100) NOT NULL

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
question int

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
user_ varchar(20) NOT NULL FOREIGN KEY ( user_ ) REFERENCES Users(username)

);