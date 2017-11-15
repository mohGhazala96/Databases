INSERT INTO Companies (email, name, address, domain, type, vision, specialization)
VALUES(
    'info@tesla.com',
    'Tesla',
    'Tesla Motors. 3500 Deer Creek Road.Palo Alto, CA 94304.',
    'tesla.com',
    'Manufacturer',
    'Create the most compelling car company of the 21st century by driving the world’s transition to electric vehicles. ',
    'Cars'
);

INSERT INTO Company_Phone_Numbers(company, phone)
VALUES ((select email from Companies where name = 'Tesla'), 8442483752);

INSERT INTO Departments(company, name)
VALUES ((select email from Companies where name = 'Tesla'), 'Manufacturing');

INSERT INTO Departments(company, name)
VALUES ((select email from Companies where name = 'Tesla'), 'R&D');

INSERT INTO Departments(company, name)
VALUES ((select email from Companies where name = 'Tesla'), 'Customer Service');

INSERT INTO Jobs
VALUES('CEO',(select code from Departments where company = 'info@tesla.com' AND name='Manufacturing'),(select TOP 1 company from Departments where company = 'info@tesla.com'),'CEO','Chief Executive Officer',3,2000000,1/7/2017,1,8)

INSERT INTO Users
VALUES ('ElonMusk','tesla4life','self@elonmusk.com', 6/28/1971,20,'Elon','Reeve','Musk');

INSERT INTO Staff_Members
VALUES ((select username from Users where username = 'ElonMusk'), 'ceo@tesla.com','Friday',2000000,'CEO',(select code FROM Departments WHERE name='Manufacturing' and company='info@tesla.com'), 'info@tesla.com');

INSERT INTO Managers
VALUES ('ElonMusk','Head Of Manufacturing')

INSERT INTO Jobs
VALUES('Supervisor',(select TOP 1 code from Departments where company = 'info@tesla.com' AND name='Manufacturing'),(select TOP 1 company from Departments where company = 'info@tesla.com'),'Supervisor','Supervisor of Stuff',3,100000,1/7/2017,1,8)

INSERT INTO Users
VALUES ('BenedictCumberbatch','sherlock','sherlock@bbc.com', 7/19/1976,4,'Benedict','Timothy','Cumberbatch');

INSERT INTO Staff_Members
VALUES ('BenedictCumberbatch', 'bcumber@tesla.com','Friday',100000,'Supervisor',(select code FROM Departments WHERE name='Manufacturing' and company='info@tesla.com'), 'info@tesla.com');

INSERT INTO Managers
VALUES ('BenedictCumberbatch','Head Of Manufacturing')

INSERT INTO Jobs
VALUES('HR Head',(select TOP 1 code from Departments where company = 'info@tesla.com' AND name='Manufacturing'),'info@tesla.com','HR Head','HR Heading',3,50000,3/7/2017,1,8)

INSERT INTO Users
VALUES ('JenniferLaw','jennifer','mockingjay@jlaw.com', 8/15/1990,4,'Jennifer','Shrader','Lawrence');

INSERT INTO Staff_Members
VALUES ('JenniferLaw', 'jlaw@tesla.com','Saturday',50000,'HR Head',(select code FROM Departments WHERE name='Manufacturing' and company='info@tesla.com'), 'info@tesla.com');

INSERT INTO HR_Employees
VALUES ('JenniferLaw')

INSERT INTO Jobs
VALUES('HR Head Assistant',(select TOP 1 code from Departments where company = 'info@tesla.com' AND name='Manufacturing'),'info@tesla.com','HR Head','HR Heading',2,20000,3/7/2017,1,8)

INSERT INTO Users
VALUES ('EmmaStone','emma','self@emmastone.com', 11/7/1988,2,'Emma','Jean','Stone');

INSERT INTO Staff_Members
VALUES ('EmmaStone', 'estone@tesla.com','Sunday',20000,'HR Head Assistant',(select code FROM Departments WHERE name='Manufacturing' and company='info@tesla.com'), 'info@tesla.com');

INSERT INTO HR_Employees
VALUES ('EmmaStone')

INSERT INTO Jobs
VALUES('HR Head',(select TOP 1 code from Departments where company = 'info@tesla.com' AND name='Customer Service'),'info@tesla.com','HR Head','HR Heading',2,50000,3/7/2017,1,8)

INSERT INTO Users
VALUES ('MoxieMarlinspike','moxie','moxie@marlinspike.com', 11/7/1988,2,'Moxie','','Marlinspike');

INSERT INTO Staff_Members
VALUES ('MoxieMarlinspike', 'moxie@tesla.com','Sunday',54321,'HR Head',(select code FROM Departments WHERE name='Customer Service' and company='info@tesla.com'), 'info@tesla.com');

INSERT INTO HR_Employees
VALUES ('MoxieMarlinspike')

INSERT INTO Jobs
VALUES('HR Head Assistant',(select TOP 1 code from Departments where company = 'info@tesla.com' AND name='Customer Service'),'info@tesla.com','HR Head','HR Heading',2,20000,3/7/2017,1,8)

INSERT INTO Users
VALUES ('AaronSwartz','aaron','aaron@swartz.com', 11/8/1986,2,'Aaron','Hillel','Swartz');

INSERT INTO Staff_Members
VALUES ('AaronSwartz', 'aswartz@tesla.com','Sunday',20000,'HR Head Assistant',(select code FROM Departments WHERE name='Customer Service' and company='info@tesla.com'), 'info@tesla.com');

INSERT INTO HR_Employees
VALUES ('AaronSwartz')

INSERT INTO Jobs
VALUES('HR Head',(select TOP 1 code from Departments where company = 'info@tesla.com' AND name='R&D'),'info@tesla.com','HR Head','HR Heading',2,50000,3/7/2017,1,8)

INSERT INTO Users
VALUES ('PeterEckersley','pde','pde@eckersley.org', 11/7/1988,2,'Peter','','Eckersley');

INSERT INTO Staff_Members
VALUES ('PeterEckersley', 'moxie@tesla.com','Sunday',54321,'HR Head',(select code FROM Departments WHERE name='R&D' and company='info@tesla.com'), 'info@tesla.com');

INSERT INTO HR_Employees
VALUES ('PeterEckersley')

INSERT INTO Jobs
VALUES('HR Head Assistant',(select TOP 1 code from Departments where company = 'info@tesla.com' AND name='R&D'),'info@tesla.com','HR Head','HR Heading',2,20000,3/7/2017,1,8)

INSERT INTO Users
VALUES ('PewDiePie','pdp','pdp@personal.com', 11/8/1986,2,'Pew','Die','Pie');

INSERT INTO Staff_Members
VALUES ('PewDiePie', 'pdp@tesla.com','Sunday',20000,'HR Head Assistant',(select code FROM Departments WHERE name='R&D' and company='info@tesla.com'), 'info@tesla.com');

INSERT INTO HR_Employees
VALUES ('PewDiePie')

INSERT INTO Jobs
VALUES('Chief Supervisor',(select TOP 1 code from Departments where company = 'info@tesla.com' AND name='Customer Service'),'info@tesla.com','Supervisor','Supervisor of CS',2,100000,4/12/2017,1,8)

INSERT INTO Users
VALUES ('MartinFreeman','theHobbit','self@martinfreeman.com', 11/7/1988,2,'Martin','John','Freeman');

INSERT INTO Staff_Members
VALUES ('MartinFreeman', 'mfreeman@tesla.com','Tuesday',100000,'Chief Supervisor',(select code FROM Departments WHERE name='Customer Service' and company='info@tesla.com'), 'info@tesla.com');

INSERT INTO Managers
VALUES ('MartinFreeman','Chief')

INSERT INTO Jobs
VALUES('Head Calls',(select TOP 1 code from Departments where company = 'info@tesla.com' AND name='Customer Service'),'info@tesla.com','Head Calls','Supervisor of Calls',2,50000,7/20/2017,3,8)

INSERT INTO Users
VALUES ('AhmedMalek','actorguy','self@amalek.com', 1/7/1992,2,'Ahmed','Hesham','Malek');

INSERT INTO Staff_Members
VALUES ('AhmedMalek', 'amalek@tesla.com','Tuesday',50000,'Head Calls',(select department FROM jobs WHERE title='Head Calls' and company='info@tesla.com'), 'info@tesla.com');

INSERT INTO Managers
VALUES ('AhmedMalek','Head')

INSERT INTO Jobs
VALUES('R&D Manager',(select TOP 1 code from Departments where company = 'info@tesla.com' AND name='R&D'),'info@tesla.com','R&D Manager','Manages R&D',2,100000,7/20/2017,3,8)

INSERT INTO Users
VALUES ('RamiMalek','hackerman','self@ramimalek.com', 2/20/1989,2,'Rami','Youssef','Malek');

INSERT INTO Staff_Members
VALUES ('RamiMalek', 'rmalek@tesla.com','Friday',100000,'R&D Manager' ,(select department FROM jobs WHERE title='R&D Manager' and company='info@tesla.com'), 'info@tesla.com');

INSERT INTO Managers
VALUES ('RamiMalek','Main Manager')

INSERT INTO Jobs
VALUES('R&D CoManager',(select TOP 1 code from Departments where company = 'info@tesla.com' AND name='R&D'),'info@tesla.com','R&D CoManager','CoManages R&D',2,100000,8/31/2017,3,8)

INSERT INTO Users
VALUES ('TonyStark','ironman','self@ironman.com', 5/10/1982,2,'Tony','Jr','Stark');

INSERT INTO Staff_Members
VALUES ('TonyStark', 'tstark@tesla.com','Friday',100000,'R&D CoManager' ,(select department FROM jobs WHERE title='R&D CoManager' and company='info@tesla.com'), 'info@tesla.com');

INSERT INTO Managers
VALUES ('TonyStark','Helper Manager')







