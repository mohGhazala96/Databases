
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
    '12/10/1982 00:00:00',
    7,
    'tarek',
    'sherif',
    'osman'
 
);

INSERT INTO Users VALUES(
    'osama.rady',
    'getReady7171',
    'osama.rady@hotmail.com',
    '9/1/1976 00:00:00',
    9,
    'osama',
    'sherif',
    'rady'
 
);

INSERT INTO Users VALUES(
    'shady.ahmed',
    'verytopsecret99',
    'shady.ahmed@hotmail.com',
    '7/22/1986 00:00:00',
    5,
    'shady',
    'mohamed',
    'ahmed'
 
);
INSERT INTO Users VALUES(
    'bakr.mostafa',
    'breakingBadForLife82',
    'bakr.mostafa@outlook.com',
    '12/9/1970 00:00:00',
    12,
    'bakr',
    'ahmed',
    'mostafa'
 
);
INSERT INTO Users VALUES(
    'karim.medhat',
    'bettergetmymoney',
    'karim.medhat@yahoo.com',
    '1/7/1977 00:00:00',
    11,
    'karim',
    'ahmed',
    'medhat'
 
);
 
INSERT INTO Users VALUES(
    'emad.sherif',
    'verygoodpassword',
    'emad.sherif@outlook.com',
    '6/6/1972 00:00:00',
    3,
    'emad',
    'mohamed',
    'sherif'
 
);


INSERT INTO Users VALUES(
    'hend.mohamed',
    'anazeh2tgedan',
    'hend.mohamed@aol.com',
    '12/24/1978 00:00:00',
    7,
    'hend',
    'yousef',
    'mohamed'
 
);
INSERT INTO Users VALUES(
    'lara.shawky',
    'hellotheregoes',
    'lara.shawky@gmail.com',
    '11/23/1980 00:00:00',
    8,
    'lara',
    'ahmed',
    'shawky'
 
);
INSERT INTO Jobs VALUES(
    'SalesMan',
    (select TOP 1 code from Departments where company = 'info@facebook.com' and name='Marekting and Sales'),
    'info@facebook.com',
    '',
    '',
    2,
    30000,
    '12/10/2018 00:00:00',
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
    '7/7/2018 00:00:00',
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
    '8/8/2018 00:00:00',
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
    '1/3/2018 00:00:00',
    3,
    8
);


INSERT INTO Staff_Members VALUES(
'tarek.osman',
'tarek.osman@facebook.com',
'Saturday',
40000,
'Engineer',
(select TOP 1 code from Departments where company = 'info@facebook.com' and name='Online Operations'),
'info@facebook.com'
)
INSERT INTO Staff_Members VALUES(
'bakr.mostafa',
'bakr.mostafa@facebook.com',
'Monday',
60000,
'Engineer',
(select TOP 1 code from Departments where company = 'info@facebook.com' and name='Online Operations'),
'info@facebook.com'
)

INSERT INTO Staff_Members VALUES(
'shady.ahmed',
'shady.ahmed@facebook.com',
'Monday',
70000,
'Engineer',
(select TOP 1 code from Departments where company = 'info@facebook.com' and name='Online Operations'),
'info@facebook.com'
)

INSERT INTO Staff_Members VALUES(
'osama.rady',
'osama.rady@facebook.com',
'Monday',
80000,
'Engineer',
(select TOP 1 code from Departments where company = 'info@facebook.com' and name='Online Operations'),
'info@facebook.com'
)
  
INSERT INTO Staff_Members VALUES(
'lara.shawky',
'lara.shawky@facebook.com',
'Tuesday',
80000,
'Graphics Designer',
(select TOP 1 code from Departments where company = 'info@facebook.com' and name='Creative'),
'info@facebook.com'
)
INSERT INTO Staff_Members VALUES(
'hend.mohamed',
'hend.mohamed@facebook.com',
'Monday',
60000,
'Graphics Designer',
(select TOP 1 code from Departments where company = 'info@facebook.com' and name='Creative'),
'info@facebook.com'
)
INSERT INTO Staff_Members VALUES(
 'emad.sherif',
'emad.sherif@facebook.com',
'Saturday',
100000,
'Graphics Designer',
(select TOP 1 code from Departments where company = 'info@facebook.com' and name='Creative'),
'info@facebook.com'
)
INSERT INTO Staff_Members VALUES(
'karim.medhat',
'karim.medhat@facebook.com',
'Friday',
90000,
'Graphics Designer',
(select TOP 1 code from Departments where company = 'info@facebook.com' and name='Creative'),
'info@facebook.com'
)

INSERT INTO Managers VALUES(
'osama.rady',
'Head'
)
INSERT INTO Managers VALUES(
'bakr.mostafa',
'Vice Head'
)
INSERT INTO HR_Employees VALUES(
'shady.ahmed'
)
INSERT INTO HR_Employees VALUES(
'tarek.osman'
)

INSERT INTO Managers VALUES(
'lara.shawky',
'Head'
)
INSERT INTO Managers VALUES(
'emad.sherif',
'Vice Head'
)
INSERT INTO HR_Employees VALUES(
'karim.medhat'
)
INSERT INTO HR_Employees VALUES(
'hend.mohamed'
)



