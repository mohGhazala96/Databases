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