EXEC HR_Employees_add_job "JenniferLaw",
                          "Rocket Scientist",
                          "Mad scientists",
                          "It's not rocket science? Surprise, it is.",
                          2,
                          250000,
                          "12/12/2020",
                          5,
                          8;

EXEC HR_Employees_view_job "JenniferLaw", "Rocket Scientist"

EXEC HR_Employees_update_job "JenniferLaw",
                             "Rocket Scientist",
                             "Rocket Scientistaaaa",
                             "Scienziati pazzi",
                             "Non è scienza missilistica? Sorpresa, lo è.",
                             20,
                             25000,
                             "12/12/2021",
                             4,
                             10;


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

EXEC HR_Employees_view_applications "tarek.osman", "Engineer"

EXEC HR_Employees_accept_reject_applications "tarek.osman", "Ashraf.Zaki", "Engineer", "Approved"

EXEC HR_Employees_create_announcement "tarek.osman",
                                      "Deadline extension",
                                      "type",
                                      "The databases milestone deadline has been extended to 12/12/2021"

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

EXEC HR_Employees_view_requests "JenniferLaw"

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
)

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

EXEC HR_Employees_update_requests 'JenniferLaw', /* Accept non-leave request */
                                  'BenedictCumberbatch',
                                  '9/26/2017 15:00:00',
                                  'Approved'

EXEC HR_Employees_update_requests 'JenniferLaw', /* Reject non-leave request */
                                  'BenedictCumberbatch',
                                  '9/26/2017 16:00:00',
                                  'Rejected'

-- EXEC HR_Employees_update_requests 'JenniferLaw', /* Accept annual leave request */
--                                   'BenedictCumberbatch',
--                                   '9/27/2017 16:00:00',
--                                   'Rejected'

-- EXEC HR_Employees_update_requests 'JenniferLaw', /* Accept annual leave request with not enough annual leaves */
--                                   'BenedictCumberbatch',
--                                   '9/26/2017 16:00:00',
--                                   'Rejected'

-- EXEC HR_Employees_update_requests 'JenniferLaw', /* Accept accidental leave request */
--                                   'BenedictCumberbatch',
--                                   '9/26/2017 16:00:00',
--                                   'Rejected'

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

SELECT * FROM Attendance_Records

EXEC HR_Employees_view_attendance 'JenniferLaw', 'BenedictCumberbatch', '2012-01-01 08:00:00', '2022-12-12 09:00:00'

EXEC HR_Employees_total_hours 'JenniferLaw', 2012

INSERT INTO Users VALUES('FirstGuy', 'war2_3nb', 'Mahmoud.Hassan@Gmail.com', '2/9/1978 00:00:00', 10, 'Mahmoud', 'Hamad', 'Hassan');
INSERT INTO Users
VALUES
    ('SecondGuy', 'war2_3nb', 'Mahmoud.Hassan@Gmail.com', '2/9/1978 00:00:00', 10, 'Mahmoud', 'Hamad', 'Hassan');
INSERT INTO Users
VALUES
    ('ThirdGuy', 'war2_3nb', 'Mahmoud.Hassan@Gmail.com', '2/9/1978 00:00:00', 10, 'Mahmoud', 'Hamad', 'Hassan');
INSERT INTO Users
VALUES
    ('FourthGuy', 'war2_3nb', 'Mahmoud.Hassan@Gmail.com', '2/9/1978 00:00:00', 10, 'Mahmoud', 'Hamad', 'Hassan');
INSERT INTO Users
VALUES
    ('FifthGuy', 'war2_3nb', 'Mahmoud.Hassan@Gmail.com', '2/9/1978 00:00:00', 10, 'Mahmoud', 'Hamad', 'Hassan');

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

EXEC HR_Employees_view_high_achievers "tarek.osman"

INSERT INTO Managers_assign_Regular_Employees_Projects VALUES(
    'Logo', 'info@facebook.com', 'Mona.Osman', 'emad.sherif'
)

INSERT INTO Managers_assign_Regular_Employees_Projects VALUES(
    'Animation Video', 'info@facebook.com', 'Mona.Osman', 'emad.sherif'
)

EXEC Regular_Employees_view_projects "Mona.Osman"

EXEC Regular_Employees_view_tasks "Rowan.Ibrahim", "Animation Video"

EXEC Regular_Employee_finalize_task "Rowan.Ibrahim", "Animation Video", "task7"