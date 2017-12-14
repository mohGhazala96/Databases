
INSERT INTO Companies
VALUES ( 'hr@Microsoft.com' , 'Microsoft' , 'Seattle' , 'microsoft.com' , 'International' , 'empower every person on the planet to achieve more' , 'Software'  );

INSERT INTO Company_Phone_Numbers
VALUES ('hr@Microsoft.com' , '01111111111' )  ;
INSERT INTO Company_Phone_Numbers
VALUES ('hr@Microsoft.com' , '01122222222' )  ;


INSERT INTO Departments
VALUES (   'hr@Microsoft.com'  , 'Innovation' )  ;
INSERT INTO Departments
VALUES (   'hr@Microsoft.com'  , 'Devlopment' )  ;
INSERT INTO Departments
VALUES (   'hr@Microsoft.com'  , 'Teaching' )  ;





INSERT INTO Jobs 
VALUES ( 'Teacher' , 3  , 'hr@Microsoft.com' , 'Teach people in the company' , 'Teach Developpers and engineers the new updated features in Java' , 10000 , 1 , '1/12/2017' , 4 , 9   );
INSERT INTO Jobs 
VALUES ( 'Engineer' , 1  , 'hr@Microsoft.com' , 'Invent new machines' , 'Working on Research projects to invent machines' , 20000 , 2 , '3/1/2017' , 1 , 8   );
INSERT INTO Jobs 
VALUES ( 'Engineer'  , 2 , 'hr@Microsoft.com' , 'Innovate and Invent' , 'Work with a team od developers to find solutions to challenging problems' , 30000  , 3 , '5/11/2017' , 7 , 9   );
INSERT INTO Jobs  
VALUES ( 'Devloper' , 2  , 'hr@Microsoft.com' , 'Coding and innovating' , 'Writing organized code that solves realtime problems' , 50000 , 1 , '10/11/2017' , 1 , 10   );
INSERT INTO Jobs 
VALUES ( 'Teacher' , 1  , 'hr@Microsoft.com' , 'Teach people in the company' , 'Teach Developpers and engineers the new updated features in Java' , 10500 , 1 , '1/12/2017', 4 , 9   );
INSERT INTO Jobs  
VALUES ( 'Devloper' , 1  , 'hr@Microsoft.com' , 'Coding and innovating' , 'Writing organized code that solves realtime problems' , 5000 , 1 , '10/11/2017' , 1 , 19   );
INSERT INTO Jobs
VALUES ( 'Engineer'  , 3 , 'hr@Microsoft.com' , 'Teach people in the company' , 'Teach Developpers and engineers the new updated features in Java' , 10000 , 1 , '1/12/2017' , 5 , 9   );
INSERT INTO Jobs  
VALUES ( 'Devloper' , 3  , 'hr@Microsoft.com' , 'Teach people in the company' , 'Teach Developpers and engineers the new updated features in Java' , 30000 , 1 , '1/12/2017' , 4 , 9   );



INSERT INTO Users
VALUES ( 'Mostafa.Mamdouh' , 'abcdef' , 'Mostafa.Mamdouh@gmail.com' , '03/12/1990'  , 15 , 'Mostafa' , 'Ahmed' , 'Mamdouh'   );
INSERT INTO Users
VALUES ( 'Mohamed.Rami' , '12345' , 'Mohamed.Rami@gmail.com' , '06/11/1990'  , 12 , 'Mohamed' , 'Ahmed' , 'Rami'   );
INSERT INTO Users
VALUES ( 'Ahmed.Mohamed' , 'ab123' , 'Ahmed.Mohamed@yahoo.com' , '05/07/1991' , 1 , 'Ahmed' , 'Mohamed' , 'Mohamed'   );
INSERT INTO Users
VALUES ( 'Sami.Ahmed' , 'a12be' , 'Sami.Ahmed@outlook.com' , '04/07/1992'  , 10 , 'Sami' , 'Momdouh' , 'Ahmed'   );

INSERT INTO Staff_Members
VALUES (   'Mostafa.Mamdouh'  ,30 , 'Mostafa.Mamdouh@microsoft.com' , 'Thursday' , 2000 , 'Devloper' , 1 , 'hr@Microsoft.com' )  ;
INSERT INTO Staff_Members
VALUES (   'Mohamed.Rami'  ,11, 'Mohamed.Rami@microsoft.com' , 'Wednesday' , 1000 , 'Engineer' , 1 , 'hr@Microsoft.com' )  ;
INSERT INTO Staff_Members
VALUES (   'Ahmed.Mohamed' ,20  , 'Ahmed.Mohamed@microsoft.com' , 'Wednesday' , 5000 , 'Teacher' , 1 , 'hr@Microsoft.com' )  ;
INSERT INTO Staff_Members
VALUES (   'Sami.Ahmed'  ,18, 'Sami.Ahmed@microsoft.com' , 'Friday' , 20000  , 'Engineer' , 1 , 'hr@Microsoft.com'  )  ;

INSERT INTO HR_Employees
VALUES ('Mostafa.Mamdouh' )  ;
INSERT INTO HR_Employees
VALUES ('Mohamed.Rami' )  ;


INSERT INTO Managers
VALUES ('Ahmed.Mohamed' , 'HR' )  ;
INSERT INTO Managers
VALUES ('Sami.Ahmed' , 'HR' )  ;



INSERT INTO Users
VALUES ( 'Khalid.Mamdouh' , 'abcdef' , 'Mamdouh@gmail.com' , '03/12/1990'  , 15 , 'Khalid' , 'Mohamed' , 'Mamdouh'   );
INSERT INTO Users
VALUES ( 'Salem.Masoud' , '12345' , 'Rami@gmail.com' , '06/11/1990' , 12 , 'Salem' , 'Ahmed' , 'Masoud'   );
INSERT INTO Users
VALUES ( 'John.Steve' , 'ab123' , 'Mohamed@yahoo.com' , '05/07/1991'  , 1 , 'John' , 'Severance' , 'Setve'   );
INSERT INTO Users
VALUES ( 'Salman.Ahmed' , 'a12be' , 'Ahmed@outlook.com' , '04/07/1992'  , 10 , 'Salman' , 'Morad' , 'Ahmed'   );

INSERT INTO Staff_Members
VALUES (   'Khalid.Mamdouh'  ,6, 'Khalid.Mamdouh@microsoft.com' , 'Friday' , 2500  , 'Engineer' , 2 , 'hr@Microsoft.com'  )  ;
INSERT INTO Staff_Members
VALUES (   'Salem.Masoud'  ,7, 'Salem.Masoud@microsoft.com' , 'Wednesday' , 2000  , 'Engineer' , 2 , 'hr@Microsoft.com'  )  ;
INSERT INTO Staff_Members
VALUES (   'John.Steve'   , 12,'John.Steve@microsoft.com' , 'Thursday' , 3000 , 'Devloper' , 2 , 'hr@Microsoft.com' )  ;
INSERT INTO Staff_Members
VALUES (   'Salman.Ahmed'   , 12,'Salman.Ahmed@microsoft.com' , 'Friday' , 5000 , 'Devloper' , 2 , 'hr@Microsoft.com' )  ;

INSERT INTO HR_Employees
VALUES ('Khalid.Mamdouh' )  ;
INSERT INTO HR_Employees
VALUES ('Salem.Masoud' )  ;


INSERT INTO Managers
VALUES ('Salman.Ahmed' , 'HR' )  ;
INSERT INTO Managers
VALUES ('John.Steve' , 'HR' )  ;




INSERT INTO Users
VALUES ( 'Raouf.Salem' , 'abcdef' , 'Mamdouh@gmail.com' , '03/12/1990'   , 15 , 'Raouf' , 'Ahmed' , 'Salem'   );
INSERT INTO Users
VALUES ( 'Kamel.Mohamed' , '12345' , 'Rami@gmail.com' , '06/11/1990'  , 12 , 'Kamel' , 'Mourad' , 'Mohamed'   );
INSERT INTO Users
VALUES ( 'Ahmed.Massoud' , 'ab123' , 'Mohamed@yahoo.com' , '05/07/1991'  , 1 , 'Ahmed' , 'Mohamed' , 'Massoud'   );
INSERT INTO Users
VALUES ( 'Kamal.Salman' , 'a12be' , 'Ahmed@outlook.com' , '04/07/1992'  , 10 , 'Kamal' , 'Momdouh' , 'Salman'   );

INSERT INTO Staff_Members
VALUES (   'Raouf.Salem'  ,30, 'Raouf.Salem@microsoft.com' , 'Monday' , 20000  , 'Teacher' , 3 , 'hr@Microsoft.com'  )  ;
INSERT INTO Staff_Members
VALUES (   'Kamel.Mohamed'  ,30, 'Kamel.Mohamed@microsoft.com' , 'Saturday' , 20000  , 'Teacher' , 3 , 'hr@Microsoft.com'  )  ;
INSERT INTO Staff_Members
VALUES (   'Ahmed.Massoud'  , 40,'Ahmed.Massoud@microsoft.com' , 'Wednesday' , 20000  , 'Devloper' , 3 , 'hr@Microsoft.com'  )  ;
INSERT INTO Staff_Members
VALUES (   'Kamal.Salman'  , 45,'Kamal.Salman@microsoft.com' , 'Wednesday' , 20000  , 'Engineer' , 3 , 'hr@Microsoft.com'  )  ;

INSERT INTO HR_Employees
VALUES ('Raouf.Salem' )  ;
INSERT INTO HR_Employees
VALUES ('Kamel.Mohamed' )  ;


INSERT INTO Managers
VALUES ('Ahmed.Massoud' , 'HR' )  ;
INSERT INTO Managers
VALUES ('Kamal.Salman' , 'HR' )  ;


INSERT INTO Companies VALUES(
    'info@facebook.com',
    'Facebook',
    '1 Hacker Way ,Menlo Park, CA 94025',
    'www.Facebook.com',
    'international',
    'People use Facebook to stay connected with friends and family, to discover what’s going on in the world, and to share and express what matters to them',
    'Technology'
);
INSERT INTO Company_Phone_Numbers VALUES(
    'info@facebook.com',
    '6505434800'
 
);
INSERT INTO Company_Phone_Numbers VALUES(
    'info@facebook.com',
    '6504834800'
 
);
INSERT INTO Company_Phone_Numbers VALUES(
    'info@facebook.com',
    '6505276600'
 
);
  INSERT INTO Departments VALUES(
    'info@facebook.com',
    'Marekting and Sales'
 
);

INSERT INTO Departments VALUES(
    'info@facebook.com',
    'Public Relations'
 
);
INSERT INTO Departments VALUES(
    'info@facebook.com',
    'Online Operations'
 
);
INSERT INTO Departments VALUES(
    'info@facebook.com',
    'Data & Analytics'
 
);
INSERT INTO Departments  VALUES(
    'info@facebook.com',
    'Creative'
 
);

INSERT INTO Users VALUES(
    'tarek.osman',
    '909090flag',
    'tarek.osman@yahoo.com',
    '12/10/1982',
    7,
    'tarek',
    'sherif',
    'osman'
);

INSERT INTO Users VALUES(
    'osama.rady',
    'getReady7171',
    'osama.rady@hotmail.com',
    '9/1/1976',
    9,
    'osama',
    'sherif',
    'rady'
 
);

INSERT INTO Users VALUES(
    'shady.ahmed',
    'verytopsecret99',
    'shady.ahmed@hotmail.com',
    '7/22/1986',
    5,
    'shady',
    'mohamed',
    'ahmed'
 
);
INSERT INTO Users VALUES(
    'bakr.mostafa',
    'breakingBadForLife82',
    'bakr.mostafa@outlook.com',
    '12/9/1970',
    12,
    'bakr',
    'ahmed',
    'mostafa'
 
);
INSERT INTO Users VALUES(
    'karim.medhat',
    'bettergetmymoney',
    'karim.medhat@yahoo.com',
    '1/7/1977',
    11,
    'karim',
    'ahmed',
    'medhat'
 
);
 
INSERT INTO Users VALUES(
    'emad.sherif',
    'verygoodpassword',
    'emad.sherif@outlook.com',
    '6/6/1972',
    3,
    'emad',
    'mohamed',
    'sherif'
 
);


INSERT INTO Users VALUES(
    'hend.mohamed',
    'anazeh2tgedan',
    'hend.mohamed@aol.com',
    '12/24/1978',
    7,
    'hend',
    'yousef',
    'mohamed'
 
);
INSERT INTO Users VALUES(
    'lara.shawky',
    'hellotheregoes',
    'lara.shawky@gmail.com',
    '11/23/1980',
    8,
    'lara',
    'ahmed',
    'shawky'
 
);

INSERT INTO Users VALUES(
    'omar.sami',
    'project_Zareef',
    'omar.sami@gmail.com',
    '9/7/1989',
    8,
    'omar',
    'gates',
    'sami'
 
);
INSERT INTO Users VALUES(
   'hala.shoaib',
    'nopassword_am_bored',
    'hala.shoaib@yahoo.com',
    '4/21/1970',
    12,
    'hala',
    'mostafa',
    'shoaib'
 
);
INSERT INTO Users VALUES(
    'yara.gomez',
    'kokofofololo',
    'lara.shawky@hotmail.com',
    '9/2/1988',
    8,
    'lara',
    'ahmed',
    'shawky'
 
);
INSERT INTO Users VALUES(
    'sara.shehab',
    'kolo_fel_keltsh',
    'sara.shehab@aol.com',
    '1/25/1978',
    9,
    'sara',
    'mohamed',
    'shehab'
 
);
INSERT INTO Jobs VALUES(
    'SalesMan',
    (select TOP 1 code from Departments where company = 'info@facebook.com' and name='Marekting and Sales'),
    'info@facebook.com',
    '',
    '',
    2,
    30000,
    '12/10/2018',
    12,
    8

);
INSERT INTO Jobs VALUES(
    'Data Analyst',
    (select TOP 1 code from Departments where company = 'info@facebook.com' and name='Data & Analytics'),
    'info@facebook.com',
    '',
    '',
    8,
    60000,
    '7/7/2018',
    4,
    7
);
INSERT INTO Jobs VALUES(
    'Engineer',
    (select TOP 1 code from Departments where company = 'info@facebook.com' and name='Online Operations'),
    'info@facebook.com',
    '',
    '',
    5,
    50000,
    '8/8/2018',
    10,
    8
);
INSERT INTO Jobs VALUES(
    'Graphics Designer',
    (select TOP 1 code from Departments where company = 'info@facebook.com' and name='Creative'),
    'info@facebook.com',
    '',
    '',
    2,
    40000,
    '1/3/2018',
    3,
    8
);


INSERT INTO Staff_Members VALUES(
'tarek.osman',12,
'tarek.osman@facebook.com',
'Saturday',
40000,
'Engineer',
(select TOP 1 code from Departments where company = 'info@facebook.com' and name='Online Operations'),
'info@facebook.com'
)
INSERT INTO Staff_Members VALUES(
'bakr.mostafa',14,
'bakr.mostafa@facebook.com',
'Monday',
60000,
'Engineer',
(select TOP 1 code from Departments where company = 'info@facebook.com' and name='Online Operations'),
'info@facebook.com'
)

INSERT INTO Staff_Members VALUES(
'shady.ahmed',34,
'shady.ahmed@facebook.com',
'Monday',
70000,
'Engineer',
(select TOP 1 code from Departments where company = 'info@facebook.com' and name='Online Operations'),
'info@facebook.com'
)

INSERT INTO Staff_Members VALUES(
'osama.rady',33,
'osama.rady@facebook.com',
'Monday',
80000,
'Engineer',
(select TOP 1 code from Departments where company = 'info@facebook.com' and name='Online Operations'),
'info@facebook.com'
)
  
INSERT INTO Staff_Members VALUES(
'lara.shawky',28,
'lara.shawky@facebook.com',
'Tuesday',
80000,
'Graphics Designer',
(select TOP 1 code from Departments where company = 'info@facebook.com' and name='Creative'),
'info@facebook.com'
)
INSERT INTO Staff_Members VALUES(
'hend.mohamed',29,
'hend.mohamed@facebook.com',
'Monday',
60000,
'Graphics Designer',
(select TOP 1 code from Departments where company = 'info@facebook.com' and name='Creative'),
'info@facebook.com'
)
INSERT INTO Staff_Members VALUES(
 'emad.sherif',22,
'emad.sherif@facebook.com',
'Saturday',
100000,
'Graphics Designer',
(select TOP 1 code from Departments where company = 'info@facebook.com' and name='Creative'),
'info@facebook.com'
)
INSERT INTO Staff_Members VALUES(
'karim.medhat',30,
'karim.medhat@facebook.com',
'Friday',
90000,
'Graphics Designer',
(select TOP 1 code from Departments where company = 'info@facebook.com' and name='Creative'),
'info@facebook.com'
)

INSERT INTO Staff_Members VALUES(
'sara.shehab',27,
'sara.shehab@facebook.com',
'Friday',
60000,
'Data Analyst',
(select TOP 1 code from Departments where company = 'info@facebook.com' and name='Data & Analytics'),
'info@facebook.com'
)

INSERT INTO Staff_Members VALUES(
'omar.sami',38,
'omar.sami@facebook.com',
'Sunday',
80000,
'Data Analyst',
(select TOP 1 code from Departments where company = 'info@facebook.com' and name='Data & Analytics'),
'info@facebook.com'
)

INSERT INTO Staff_Members VALUES(
'hala.shoaib',22,
'hala.shoaib@facebook.com',
'Friday',
110000,
'Data Analyst',
(select TOP 1 code from Departments where company = 'info@facebook.com' and name='Data & Analytics'),
'info@facebook.com'
)

INSERT INTO Staff_Members VALUES(
'yara.gomez',40,
'yara.gomez@facebook.com',
'Tuesday',
60000,
'Data Analyst',
(select TOP 1 code from Departments where company = 'info@facebook.com' and name='Data & Analytics'),
'info@facebook.com'
)


INSERT INTO Managers VALUES(
'osama.rady',
'Head'
)
INSERT INTO Managers VALUES(
'bakr.mostafa',
'HR'
)
INSERT INTO HR_Employees VALUES(
'shady.ahmed'
)
INSERT INTO HR_Employees VALUES(
'tarek.osman'
)

INSERT INTO Managers VALUES(
'hala.shoaib',
'Head'
)
INSERT INTO Managers VALUES(
'omar.sami',
'Vice Head'
)
INSERT INTO HR_Employees VALUES(
'yara.gomez'
)
INSERT INTO HR_Employees VALUES(
'sara.shehab'
)

INSERT INTO Managers VALUES(
'lara.shawky',
'Head'
)
INSERT INTO Managers VALUES(
'emad.sherif',
'HR'
)
INSERT INTO HR_Employees VALUES(
'karim.medhat'
)
INSERT INTO HR_Employees VALUES(
'hend.mohamed'
)
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
VALUES('CEO',(select code from Departments where company = 'info@tesla.com' AND name='Manufacturing'),(select TOP 1 company from Departments where company = 'info@tesla.com'),'CEO','Chief Executive Officer',3,2000000,'1/7/2017',1,8)

INSERT INTO Users
VALUES ('ElonMusk','tesla4life','self@elonmusk.com', '6/28/1971',20,'Elon','Reeve','Musk');

INSERT INTO Staff_Members
VALUES ((select username from Users where username = 'ElonMusk'), 12,'ceo@tesla.com','Friday',2000000,'CEO',(select code FROM Departments WHERE name='Manufacturing' and company='info@tesla.com'), 'info@tesla.com');

INSERT INTO Managers
VALUES ('ElonMusk','Head Of Manufacturing')

INSERT INTO Jobs
VALUES('Supervisor',(select TOP 1 code from Departments where company = 'info@tesla.com' AND name='Manufacturing'),(select TOP 1 company from Departments where company = 'info@tesla.com'),'Supervisor','Supervisor of Stuff',3,100000,'1/7/2017',1,8)

INSERT INTO Users
VALUES ('BenedictCumberbatch','sherlock','sherlock@bbc.com', '7/19/1976',4,'Benedict','Timothy','Cumberbatch');

INSERT INTO Staff_Members
VALUES ('BenedictCumberbatch',23, 'bcumber@tesla.com','Friday',100000,'Supervisor',(select code FROM Departments WHERE name='Manufacturing' and company='info@tesla.com'), 'info@tesla.com');

INSERT INTO Managers
VALUES ('BenedictCumberbatch','Head Of Manufacturing')

INSERT INTO Jobs
VALUES('HR Head',(select TOP 1 code from Departments where company = 'info@tesla.com' AND name='Manufacturing'),'info@tesla.com','HR Head','HR Heading',3,50000,'3/7/2017',1,8)

INSERT INTO Users
VALUES ('JenniferLaw','jennifer','mockingjay@jlaw.com', '8/15/1990',4,'Jennifer','Shrader','Lawrence');

INSERT INTO Staff_Members
VALUES ('JenniferLaw',28, 'jlaw@tesla.com','Saturday',50000,'HR Head',(select code FROM Departments WHERE name='Manufacturing' and company='info@tesla.com'), 'info@tesla.com');

INSERT INTO HR_Employees
VALUES ('JenniferLaw')

INSERT INTO Jobs
VALUES('HR Head Assistant',(select TOP 1 code from Departments where company = 'info@tesla.com' AND name='Manufacturing'),'info@tesla.com','HR Head','HR Heading',2,20000,'3/7/2017',1,8)

INSERT INTO Users
VALUES ('EmmaStone','emma','self@emmastone.com', '11/7/1988',2,'Emma','Jean','Stone');

INSERT INTO Staff_Members
VALUES ('EmmaStone', 29,'estone@tesla.com','Sunday',20000,'HR Head Assistant',(select code FROM Departments WHERE name='Manufacturing' and company='info@tesla.com'), 'info@tesla.com');

INSERT INTO HR_Employees
VALUES ('EmmaStone')

INSERT INTO Jobs
VALUES('HR Head',(select TOP 1 code from Departments where company = 'info@tesla.com' AND name='Customer Service'),'info@tesla.com','HR Head','HR Heading',2,50000,'3/7/2017',1,8)

INSERT INTO Users
VALUES ('MoxieMarlinspike','moxie','moxie@marlinspike.com', '11/7/1988',2,'Moxie','','Marlinspike');

INSERT INTO Staff_Members
VALUES ('MoxieMarlinspike', 30,'moxie@tesla.com','Sunday',54321,'HR Head',(select code FROM Departments WHERE name='Customer Service' and company='info@tesla.com'), 'info@tesla.com');

INSERT INTO HR_Employees
VALUES ('MoxieMarlinspike')

INSERT INTO Jobs
VALUES('HR Head Assistant',(select TOP 1 code from Departments where company = 'info@tesla.com' AND name='Customer Service'),'info@tesla.com','HR Head','HR Heading',2,20000,'3/7/2017',1,8)

INSERT INTO Users
VALUES ('AaronSwartz','aaron','aaron@swartz.com', '11/8/1986',2,'Aaron','Hillel','Swartz');

INSERT INTO Staff_Members
VALUES ('AaronSwartz',22, 'aswartz@tesla.com','Sunday',20000,'HR Head Assistant',(select code FROM Departments WHERE name='Customer Service' and company='info@tesla.com'), 'info@tesla.com');

INSERT INTO HR_Employees
VALUES ('AaronSwartz')

INSERT INTO Jobs
VALUES('HR Head',(select TOP 1 code from Departments where company = 'info@tesla.com' AND name='R&D'),'info@tesla.com','HR Head','HR Heading',2,50000,'3/7/2017',1,8)

INSERT INTO Users
VALUES ('PeterEckersley','pde','pde@eckersley.org', '11/7/1988',2,'Peter','','Eckersley');

INSERT INTO Staff_Members
VALUES ('PeterEckersley', 35,'moxie@tesla.com','Sunday',54321,'HR Head',(select code FROM Departments WHERE name='R&D' and company='info@tesla.com'), 'info@tesla.com');

INSERT INTO HR_Employees
VALUES ('PeterEckersley')

INSERT INTO Jobs
VALUES('HR Head Assistant',(select TOP 1 code from Departments where company = 'info@tesla.com' AND name='R&D'),'info@tesla.com','HR Head','HR Heading',2,20000,'3/7/2017',1,8)

INSERT INTO Users
VALUES ('PewDiePie','pdp','pdp@personal.com', '11/8/1986',2,'Pew','Die','Pie');

INSERT INTO Staff_Members
VALUES ('PewDiePie', 38,'pdp@tesla.com','Sunday',20000,'HR Head Assistant',(select code FROM Departments WHERE name='R&D' and company='info@tesla.com'), 'info@tesla.com');

INSERT INTO HR_Employees
VALUES ('PewDiePie')

INSERT INTO Jobs
VALUES('Chief Supervisor',(select TOP 1 code from Departments where company = 'info@tesla.com' AND name='Customer Service'),'info@tesla.com','Supervisor','Supervisor of CS',2,100000,'4/12/2017',1,8)

INSERT INTO Users
VALUES ('MartinFreeman','theHobbit','self@martinfreeman.com', '11/7/1988',2,'Martin','John','Freeman');

INSERT INTO Staff_Members
VALUES ('MartinFreeman', 25,'mfreeman@tesla.com','Tuesday',100000,'Chief Supervisor',(select code FROM Departments WHERE name='Customer Service' and company='info@tesla.com'), 'info@tesla.com');

INSERT INTO Managers
VALUES ('MartinFreeman','Chief')

INSERT INTO Jobs
VALUES('Head Calls',(select TOP 1 code from Departments where company = 'info@tesla.com' AND name='Customer Service'),'info@tesla.com','Head Calls','Supervisor of Calls',2,50000,'7/20/2017',3,8)

INSERT INTO Users
VALUES ('AhmedMalek','actorguy','self@amalek.com', '1/7/1992',2,'Ahmed','Hesham','Malek');

INSERT INTO Staff_Members
VALUES ('AhmedMalek', 45,'amalek@tesla.com','Tuesday',50000,'Head Calls',(select department FROM jobs WHERE title='Head Calls' and company='info@tesla.com'), 'info@tesla.com');

INSERT INTO Managers
VALUES ('AhmedMalek','Head')

INSERT INTO Jobs
VALUES('R&D Manager',(select TOP 1 code from Departments where company = 'info@tesla.com' AND name='R&D'),'info@tesla.com','R&D Manager','Manages R&D',2,100000,'7/20/2017',3,8)

INSERT INTO Users
VALUES ('RamiMalek','hackerman','self@ramimalek.com', '2/20/1989',2,'Rami','Youssef','Malek');

INSERT INTO Staff_Members
VALUES ('RamiMalek', 16,'rmalek@tesla.com','Friday',100000,'R&D Manager' ,(select department FROM jobs WHERE title='R&D Manager' and company='info@tesla.com'), 'info@tesla.com');

INSERT INTO Managers
VALUES ('RamiMalek','Main Manager')

INSERT INTO Jobs
VALUES('R&D CoManager',(select TOP 1 code from Departments where company = 'info@tesla.com' AND name='R&D'),'info@tesla.com','R&D CoManager','CoManages R&D',2,100000,'8/31/2017',3,8)

INSERT INTO Users
VALUES ('TonyStark','ironman','self@ironman.com', '5/10/1982',2,'Tony','Jr','Stark');

INSERT INTO Staff_Members
VALUES ('TonyStark', 18,'tstark@tesla.com','Friday',100000,'R&D CoManager' ,(select department FROM jobs WHERE title='R&D CoManager' and company='info@tesla.com'), 'info@tesla.com');

INSERT INTO Managers
VALUES ('TonyStark','Helper Manager')

INSERT INTO Announcements
VALUES(
    CURRENT_TIMESTAMP, 'Hello','AaronSwartz','URGENT','Hello'
)


------aboughazala

-- add new 8 users
INSERT INTO Users
VALUES
    ('Doaa.Ahmed', 'tobeornottobe', 'Doaa.Ahmed@Hotmail.com', '7/2/1975', 7, 'Doaa', 'Mohamed', 'Ahmed');
INSERT INTO Users
VALUES
    ('Rowan.Ibrahim', 'hala_beek_hala', 'Rowan.Ibrahim@Yahoo.com', '8/21/1976', 11, 'Rowan', 'Mostafa', 'Ibrahim');
INSERT INTO Users
VALUES
    ('Amina.Abaas', 'hussien_al_jasmi', 'Amina.Abaas@Hotmail.com', '9/18/1970', 9, 'Amina', 'Ashraf', 'Abaas');
INSERT INTO Users
VALUES
    ('Mona.Osman', 'ellonmeshellon', 'Mona.Osman@Gmail.com', '11/3/1979', 5, 'Mona', 'Ali', 'Osman');
INSERT INTO Users
VALUES
    ('Ashraf.Zaki', 'billkoftakormb', 'Ashraf.Zaki@Hotmail.com', '5/7/1974', 3, 'Ashraf', 'Ibrahim', 'Zaki');
INSERT INTO Users
VALUES
    ('Mahmoud.Hassan', 'war2_3nb', 'Mahmoud.Hassan@Gmail.com', '2/9/1978', 10, 'Mahmoud', 'Hamad', 'Hassan');
INSERT INTO Users
VALUES
    ('Khaled.Hanafy', 'keyskeyskeys', 'Khaled.Hanafy@Hotmail.com', '3/12/1982', 6, 'Khaled', 'Mohsen', 'Hanafy');
INSERT INTO Users
VALUES
    ('Hossam.Azzab', 'phonebehoney', 'Hossam.Azzab@Gmail.com', ' 6/24/1984', 4, 'Hossam', 'Shaker', 'Azzab');
-- job seekers
INSERT INTO Job_Seekers
VALUES
    ('Hossam.Azzab')
INSERT INTO Job_Seekers
VALUES
    ('Khaled.Hanafy')
INSERT INTO Job_Seekers
VALUES
    ('Mahmoud.Hassan')
INSERT INTO Job_Seekers
VALUES
    ('Ashraf.Zaki')
-- add 4 staff memebers
--info@facebook.com info@tesla.com Assigned Open Fixed
INSERT INTO Staff_Members
VALUES
    ('Mona.Osman', 10,'Mona.Osman@facebook.com', 'Friday', 70000, 'Engineer', (select code
        FROM Departments
        WHERE name='Online Operations' and company='info@facebook.com'), 'info@facebook.com');
INSERT INTO Staff_Members
VALUES
    ('Amina.Abaas', 12,'Amina.Abaas@facebook.com', 'Monday', 60000, 'Engineer', (select code
        FROM Departments
        WHERE name='Online Operations' and company='info@facebook.com'), 'info@facebook.com');
INSERT INTO Staff_Members
VALUES
    ('Rowan.Ibrahim', 40,'Rowan.Ibrahim@facebook.com', 'Saturday', 100000, 'Graphics Designer', (select code
        FROM Departments
        WHERE name='Creative' and company='info@facebook.com'), 'info@facebook.com');
INSERT INTO Staff_Members
VALUES
    ('Doaa.Ahmed', 40,'Doaa.Ahmed@facebook.com', 'Friday', 88000, 'Graphics Designer', (select code
        FROM Departments
        WHERE name='Creative' and company='info@facebook.com'), 'info@facebook.com');

-- add new 4 regular
INSERT INTO Regular_Employees
VALUES
    ('Mona.Osman')
INSERT INTO Regular_Employees
VALUES
    ('Amina.Abaas')
INSERT INTO Regular_Employees
VALUES
    ('Rowan.Ibrahim')
INSERT INTO Regular_Employees
VALUES
    ('Doaa.Ahmed')
-- add 2 projects
INSERT INTO Projects
VALUES
    ( 'cloudApp', 'info@facebook.com' , '9/2/2017 00:00:00', '10/2/2017 00:00:00', 'bakr.mostafa')
--online operations
INSERT INTO Projects
VALUES
    ( 'soundClound', 'info@facebook.com' , '11/27/2017 12:12:00', '12/12/2017 12:12:00', 'bakr.mostafa')
INSERT INTO Projects
VALUES
    ( 'Logo', 'info@facebook.com' , '1/9/2017 12:00:00', '2/9/2017 12:00:00', 'emad.sherif')
--Creative
INSERT INTO Projects
VALUES
    ( 'Animation Video', 'info@facebook.com' , '9/30/2017 12:00:00', '10/30/2017 12:00:00', 'emad.sherif')--Creative
-- add 4 tasks
--hr@Microsoft.com' info@facebook.com info@tesla.com Assigned Open Fixed
INSERT INTO     Managers_assign_Regular_Employees_Projects VALUES
    ('cloudApp', 'info@facebook.com','Mona.Osman', 'bakr.mostafa')
INSERT INto     Managers_assign_Regular_Employees_Projects VALUES
    ('cloudApp', 'info@facebook.com','Amina.Abaas', 'bakr.mostafa')
INSERT INto     Managers_assign_Regular_Employees_Projects VALUES
    ('Animation Video', 'info@facebook.com','Rowan.Ibrahim', 'emad.sherif')
INSERT INTO Tasks
VALUES
    ('task1', 'cloudApp', 'info@facebook.com', '9/27/2017 00:00:00', 'Fixed', 'description', 'Mona.Osman', 'bakr.mostafa');
INSERT INTO Tasks
VALUES
    ('task2', 'cloudApp', 'info@facebook.com', '12/5/2017 00:00:00', 'Open', 'description', 'Amina.Abaas', 'bakr.mostafa');
INSERT INTO Tasks
VALUES
    ('task3', 'Animation Video', 'info@facebook.com', '12/20/2017 00:00:00', 'Open', 'description', 'Rowan.Ibrahim', 'emad.sherif');
INSERT INTO Tasks
VALUES
    ('task4', 'Animation Video', 'info@facebook.com', '10/20/2017 00:00:00', 'Open', 'description', 'Rowan.Ibrahim', 'emad.sherif');
INSERT INTO Tasks
VALUES
    ('task5', 'Animation Video', 'info@facebook.com', '10/20/2017 00:00:00', 'Fixed', 'description', 'Rowan.Ibrahim', 'emad.sherif');
INSERT INTO Tasks
VALUES
    ('task6', 'Animation Video', 'info@facebook.com', '10/20/2018 00:00:00', 'Fixed', 'description', 'Rowan.Ibrahim', 'emad.sherif');
INSERT INTO Tasks
VALUES
    ('task7', 'Animation Video', 'info@facebook.com', '10/20/2018 00:00:00', 'Assigned', 'description', 'Rowan.Ibrahim', 'emad.sherif');
-- add 4 requests
INSERT INTO  Requests
VALUES
    ( '9/29/2017 12:00:00', 'shady.ahmed' , '10/30/2017 12:00:00', '9/1/2017 00:00:00' , Null, 'Pending', Null, 'Pending', 'reason here')

INSERT INTO  Requests
VALUES
    ( '1/10/2017 11:00:00', 'Mona.Osman' , '2/9/2017 12:00:00', '1/1/2017 00:00:00', null, 'Pending', Null, 'Pending', 'reason here')

INSERT INTO  Requests
VALUES
    ( '9/26/2017 11:00:00', 'Amina.Abaas' , '10/30/2017 12:00:00', '9/1/2017 00:00:00', null, 'Pending', Null, 'Pending', 'reason here')
INSERT INTO  Requests
VALUES
    ( '9/23/2017 11:00:00', 'shady.ahmed' , '10/30/2017 12:00:00', '9/1/2017 00:00:00' , Null, 'Pending', Null, 'Pending', 'reason here')

INSERT INTO  Leave_Requests
VALUES
    ('9/29/2017 12:00:00', 'shady.ahmed' , 'type here')
INSERT INTO  Leave_Requests
VALUES
    ( '1/10/2017 11:00:00', 'Mona.Osman', 'type here')
INSERT INTO  Business_Trip_Requests
VALUES
    ( '9/26/2017 11:00:00', 'Amina.Abaas', 'cairo', 'purpose here')

INSERT INTO  Business_Trip_Requests
VALUES
    ( '9/23/2017 11:00:00', 'shady.ahmed', 'alex', 'purpose here')

INSERT INTO Regular_Employees_apply_replace_Requests
VALUES
    ('9/29/2017 12:00:00', 'shady.ahmed', 'Mona.Osman', 'Amina.Abaas')
INSERT INTO Regular_Employees_apply_replace_Requests
VALUES
    ('1/10/2017 11:00:00', 'Mona.Osman', 'Doaa.Ahmed', 'Rowan.Ibrahim')
INSERT INTO Regular_Employees_apply_replace_Requests
VALUES
    ( '9/26/2017 11:00:00', 'Amina.Abaas' , 'Mona.Osman', 'Amina.Abaas')
INSERT INTO Regular_Employees_apply_replace_Requests
VALUES
    ('9/23/2017 11:00:00', 'shady.ahmed', 'Amina.Abaas', 'Doaa.Ahmed')

-- add 4 Job_Seeker_apply_Job
INSERT INTO Job_Seekers_apply_Jobs
VALUES
    ( 'Graphics Designer', (select code
        FROM Departments
        WHERE name='Creative' and company='info@facebook.com'), 'info@facebook.com', 'Hossam.Azzab' , 'Approved', 'Pending', 80)
INSERT INTO Job_Seekers_apply_Jobs
VALUES
    ( 'Engineer', (select code
        FROM Departments
        WHERE name='Online Operations' and company='info@facebook.com'), 'info@facebook.com', 'Hossam.Azzab' , 'Pending', 'Pending', 60)
INSERT INTO Job_Seekers_apply_Jobs
VALUES
    ( 'Engineer', (select code
        FROM Departments
        WHERE name='Online Operations' and company='info@facebook.com'), 'info@facebook.com', 'Khaled.Hanafy' , 'Approved', 'Pending', 90)
INSERT INTO Job_Seekers_apply_Jobs
VALUES
    ( 'Graphics Designer', (select code
        FROM Departments
        WHERE name='Creative' and company='info@facebook.com'), 'info@facebook.com', 'Mahmoud.Hassan' , 'Approved', 'Pending', 100)
--- amjad's insertions
INSERT INTO Job_Seekers_apply_Jobs VALUES (
    'Engineer', (
        SELECT code FROM Departments WHERE name = 'Online Operations'
                                     AND company='info@facebook.com'
    ),
    'info@facebook.com',
    'Ashraf.Zaki' ,
    'Pending',
    'Pending',
    60
)
INSERT INTO Requests VALUES(
    '9/26/2017 12:00:00',
    'BenedictCumberbatch',
    '10/30/2017 12:00:00',
    '9/1/2017 00:00:00',
    NULL,
    'Pending',
    'BenedictCumberbatch',
    'Approved',
    'reason here'
)

INSERT INTO Requests VALUES(
    '9/26/2017 11:00:00',
    'BenedictCumberbatch',
    '10/30/2017 12:00:00',
    '9/1/2017 00:00:00',
    NULL,
    'Pending',
    'BenedictCumberbatch',
    'Pending',
    'reason here'
)
INSERT INTO Requests VALUES(
    '9/26/2017 15:00:00',
    'BenedictCumberbatch',
    '10/30/2017 12:00:00',
    '9/1/2017 00:00:00',
    NULL,
    'Pending',
    'BenedictCumberbatch',
    'Approved',
    'reason here'
)

INSERT INTO Requests VALUES(
    '9/26/2017 16:00:00',
    'BenedictCumberbatch',
    '10/30/2017 12:00:00',
    '9/1/2017 00:00:00',
    NULL,
    'Pending',
    'BenedictCumberbatch',
    'Approved',
    'reason here'
)

INSERT INTO Requests VALUES(
    '9/27/2017 16:00:00',
    'BenedictCumberbatch',
    '9/30/2017 12:00:00',
    '9/1/2017 00:00:00',
    NULL,
    'Pending',
    'BenedictCumberbatch',
    'Approved',
    'reason here'
)

INSERT INTO Requests VALUES(
    '5/26/2017 16:00:00',
    'BenedictCumberbatch',
    '10/30/2017 12:00:00',
    '9/1/2017 00:00:00',
    NULL,
    'Pending',
    'BenedictCumberbatch',
    'Approved',
    'reason here'
)

INSERT INTO Requests VALUES(
    '2/26/2017 16:00:00',
    'BenedictCumberbatch',
    '10/30/2017 12:00:00',
    '9/1/2017 00:00:00',
    NULL,
    'Pending',
    'BenedictCumberbatch',
    'Approved',
    'reason here'
);

INSERT INTO Leave_Requests VALUES(
    '9/26/2017 16:00:00',
    'BenedictCumberbatch',
    'annual'
);

INSERT INTO Leave_Requests VALUES(
    '9/27/2017 16:00:00',
    'BenedictCumberbatch',
    'annual'
)

INSERT INTO Leave_Requests VALUES(
    '5/26/2017 16:00:00',
    'BenedictCumberbatch',
    'annual'
)

INSERT INTO Leave_Requests VALUES(
    '2/26/2017 16:00:00',
    'BenedictCumberbatch',
    'accidental'
)

INSERT INTO Business_Trip_Requests VALUES(
    '9/26/2017 12:00:00',
    'BenedictCumberbatch',
    'Paris',
    'purpose1'
)

INSERT INTO Business_Trip_Requests VALUES(
    '9/26/2017 11:00:00',
    'BenedictCumberbatch',
    'London',
    'purpose2'
)



INSERT INTO Attendance_Records VALUES(
    '2012-12-12',
    'BenedictCumberbatch',
    '08:00:00',
    '16:00:00'
)

INSERT INTO Attendance_Records VALUES(
    '2012-12-13',
    'BenedictCumberbatch',
    '12:00',
    '16:00'
)

INSERT INTO Attendance_Records VALUES(
    '1/12/2012',
    'BenedictCumberbatch',
    '08:00',
    '22:00'
)

INSERT INTO Attendance_Records VALUES(
    '1/12/2012',
    'ElonMusk',
    '02:00',
    '23:00'
)

INSERT INTO Attendance_Records VALUES(
    '1/13/2012',
    'ElonMusk',
    '02:00',
    '23:00'
)

INSERT INTO Attendance_Records VALUES(
    '1/14/2012',
    'ElonMusk',
    '02:00',
    '23:00'
)

INSERT INTO Attendance_Records VALUES(
    '1/20/2012',
    'ElonMusk',
    '02:00',
    '23:00'
)

INSERT INTO Attendance_Records VALUES(
    '2/12/2012',
    'ElonMusk',
    '02:00',
    '23:00'
)

INSERT INTO Attendance_Records VALUES(
    '2/13/2012',
    'ElonMusk',
    '02:00',
    '23:00'
)

INSERT INTO Users VALUES('FirstGuy', 'war2_3nb', 'Mahmoud.Hassan@Gmail.com', '2/9/1978 00:00:00', 10, 'First', 'Hamad', 'Hassan');
INSERT INTO Users
VALUES
    ('SecondGuy', 'war2_3nb', 'Mahmoud.Hassan@Gmail.com', '2/9/1978 00:00:00', 10, 'Second', 'Hamad', 'Hassan');
INSERT INTO Users
VALUES
    ('ThirdGuy', 'war2_3nb', 'Mahmoud.Hassan@Gmail.com', '2/9/1978 00:00:00', 10, 'Third', 'Hamad', 'Hassan');
INSERT INTO Users
VALUES
    ('FourthGuy', 'war2_3nb', 'Mahmoud.Hassan@Gmail.com', '2/9/1978 00:00:00', 10, 'Fourth', 'Hamad', 'Hassan');
INSERT INTO Users
VALUES
    ('FifthGuy', 'war2_3nb', 'Mahmoud.Hassan@Gmail.com', '2/9/1978 00:00:00', 10, 'Fifth', 'Hamad', 'Hassan');

INSERT INTO Staff_Members
VALUES
    ('FirstGuy', 10,'FirstGuy@facebook.com', 'Friday', 70000, 'Engineer', (select code
        FROM Departments
        WHERE name='Online Operations' and company='info@facebook.com'), 'info@facebook.com');

INSERT INTO Staff_Members
VALUES
    ('SecondGuy', 10,'SecondGuy@facebook.com', 'Friday', 70000, 'Engineer', (select code
        FROM Departments
        WHERE name='Online Operations' and company='info@facebook.com'), 'info@facebook.com');

INSERT INTO Staff_Members
VALUES
    ('ThirdGuy', 10,'ThirdGuy@facebook.com', 'Friday', 70000, 'Engineer', (select code
        FROM Departments
        WHERE name='Online Operations' and company='info@facebook.com'), 'info@facebook.com');

INSERT INTO Staff_Members
VALUES
    ('FourthGuy', 10,'FourthGuy@facebook.com', 'Friday', 70000, 'Engineer', (select code
        FROM Departments
        WHERE name='Online Operations' and company='info@facebook.com'), 'info@facebook.com');

INSERT INTO Staff_Members
VALUES
    ('FifthGuy', 10,'FifthGuy@facebook.com', 'Friday', 70000, 'Engineer', (select code
        FROM Departments
        WHERE name='Online Operations' and company='info@facebook.com'), 'info@facebook.com');

INSERT INTO Regular_Employees
VALUES
    ('FirstGuy')
INSERT INTO Regular_Employees
VALUES
    ('SecondGuy')
INSERT INTO Regular_Employees
VALUES
    ('ThirdGuy')
INSERT INTO Regular_Employees
VALUES
    ('FourthGuy')
INSERT INTO Regular_Employees
VALUES
    ('FifthGuy')

INSERT INTO Managers_assign_Regular_Employees_Projects VALUES(
    'cloudApp', 'info@facebook.com', 'FirstGuy', 'bakr.mostafa'
)
INSERT INTO Managers_assign_Regular_Employees_Projects VALUES(
    'cloudApp', 'info@facebook.com', 'SecondGuy', 'bakr.mostafa'
)
INSERT INTO Managers_assign_Regular_Employees_Projects VALUES(
    'cloudApp', 'info@facebook.com', 'ThirdGuy', 'bakr.mostafa'
)
INSERT INTO Managers_assign_Regular_Employees_Projects VALUES(
    'cloudApp', 'info@facebook.com', 'FifthGuy', 'bakr.mostafa'
)

INSERT INTO Tasks
VALUES
    ('AmjadTask1', 'cloudApp', 'info@facebook.com', '9/27/2017 00:00:00', 'Fixed', 'description', 'FirstGuy', 'bakr.mostafa');
INSERT INTO Tasks
VALUES
    ('AmjadTask2', 'cloudApp', 'info@facebook.com', '9/27/2017 00:00:00', 'Fixed', 'description', 'SecondGuy', 'bakr.mostafa');
INSERT INTO Tasks
VALUES
    ('AmjadTask3', 'cloudApp', 'info@facebook.com', '9/27/2017 00:00:00', 'Fixed', 'description', 'ThirdGuy', 'bakr.mostafa');
INSERT INTO Tasks
VALUES
    ('AmjadTask5', 'cloudApp', 'info@facebook.com', '9/27/2017 00:00:00', 'Assigned', 'description', 'FifthGuy', 'bakr.mostafa');

INSERT INTO Attendance_Records VALUES(
    '2012-12-12',
    'FirstGuy',
    '08:00:00',
    '16:00:00'
)

INSERT INTO Attendance_Records VALUES(
    '2012-12-13',
    'FirstGuy',
    '12:00',
    '16:00'
)

INSERT INTO Attendance_Records VALUES(
    '2012-12-12',
    'SecondGuy',
    '08:00:00',
    '16:00:00'
)

INSERT INTO Attendance_Records VALUES(
    '2012-12-13',
    'SecondGuy',
    '12:00',
    '16:00'
)

INSERT INTO Attendance_Records VALUES(
    '2012-12-12',
    'ThirdGuy',
    '08:00:00',
    '16:00:00'
)

INSERT INTO Attendance_Records VALUES(
    '2012-12-13',
    'ThirdGuy',
    '12:00',
    '16:00'
)

INSERT INTO Attendance_Records VALUES(
    '2012-12-12',
    'FourthGuy',
    '08:00:00',
    '16:00:00'
)

INSERT INTO Attendance_Records VALUES(
    '2012-12-13',
    'FourthGuy',
    '12:00',
    '16:00'
)

INSERT INTO Attendance_Records VALUES(
    '2012-12-14',
    'FourthGuy',
    '12:00',
    '16:00'
)

INSERT INTO Attendance_Records VALUES(
    '2012-12-12',
    'FifthGuy',
    '08:00:00',
    '16:00:00'
)

INSERT INTO Attendance_Records VALUES(
    '2012-12-13',
    'FifthGuy',
    '12:00',
    '16:00'
)

INSERT INTO Attendance_Records VALUES(
    '2012-12-14',
    'FifthGuy',
    '12:00',
    '16:00'
)

INSERT INTO Attendance_Records VALUES(
    '2012-12-15',
    'FifthGuy',
    '12:00',
    '16:00'
)
INSERT INTO Managers_assign_Regular_Employees_Projects VALUES(
    'Logo', 'info@facebook.com', 'Mona.Osman', 'emad.sherif'
)

INSERT INTO Managers_assign_Regular_Employees_Projects VALUES(
    'Animation Video', 'info@facebook.com', 'Mona.Osman', 'emad.sherif'
)


INSERT INTO Users
VALUES ( 'Albert.enstein' , 'abcdef' , 'Albert.enstein@gmail.com' , '03/12/1990'  , 15 , 'Albert' , 'Steve' , 'enstein'   );
INSERT INTO Users
VALUES ( 'John.Harris' , '12345' , 'John.Harris@gmail.com' , '06/11/1990' , 1 , 'John' , 'Albert' , 'Harris'   );
INSERT INTO Users
VALUES ( 'Steve.Sipser' , 'ab123' , 'Steve.Sipser@yahoo.com' , '05/07/1991' , 1 , 'Steve' , 'Michael' , 'Sipser'   );
INSERT INTO Users
VALUES ( 'Rami.Kamal' , 'a12be' , 'Rami.Kamal@outlook.com' , '04/07/1992'  , 10 , 'Rami' , 'Momdouh' , 'Kamal'   );
INSERT INTO Job_Seekers
VALUES ( 'Albert.enstein' )
INSERT INTO Job_Seekers
VALUES ( 'John.Harris' )

INSERT INTO Job_Seekers
VALUES ( 'John.Steve' )

INSERT INTO Questions ( question , answer  )
VALUES ('What is the Programming language you know best' , 'Python'    );
INSERT INTO Questions ( question , answer  )
VALUES ('What is the String in C++' , 'Array of chars'    );
INSERT INTO Questions ( question , answer  )
VALUES ('How to implement merge sort' , 'divide and conquer'    );
INSERT INTO Job_Has_Question
VALUES ( 'CEO' , 9 , 'info@tesla.com' , 3 );
INSERT INTO Job_Has_Question
VALUES ( 'CEO' , 9 , 'info@tesla.com' , 1);
INSERT INTO Job_Has_Question
VALUES ( 'Engineer' , 2 , 'hr@Microsoft.com' , 2 );

INSERT INTO Job_Seekers_apply_Jobs ( job ,     department  , company  , job_seeker , score )
VALUES ( 'CEO' , 9 , 'info@tesla.com' , 'John.Steve' , 100  );

INSERT INTO Managers_assign_Regular_Employees_Projects VALUES(
    'Logo', 'info@facebook.com', 'Doaa.Ahmed', 'emad.sherif'
)

INSERT INTO Tasks
VALUES
    ('task_Logo', 'Logo', 'info@facebook.com', '10/20/2018 00:00:00', 'Assigned', 'description', null, 'emad.sherif');