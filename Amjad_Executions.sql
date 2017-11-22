--hr 1
declare @q_list q_list
INSERT INTO @q_list VALUES('Is this true?', 'True'), ('Really?', 'False')
SELECT * FROM @q_list

EXEC HR_Employees_add_job "JenniferLaw",
                          "Rocket Scientist",
                          "Mad scientists",
                          "It's not rocket science? Surprise, it is.",
                          2,
                          250000,
                          "12/12/2020",
                          5,
                          8,
                          @q_list;
--hr 2
EXEC HR_Employees_view_job "JenniferLaw", "Rocket Scientist"
--hr 3
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
--hr 4
EXEC HR_Employees_view_applications "tarek.osman", "Engineer"
--hr 5
EXEC HR_Employees_accept_reject_applications "tarek.osman", "Ashraf.Zaki", "Engineer", "Approved"
--hr 6
EXEC HR_Employees_create_announcement "tarek.osman",
                                      "Deadline extension",
                                      "type",
                                      "The databases milestone deadline has been extended to 12/12/2021"
--hr 7
EXEC HR_Employees_view_requests "JenniferLaw"
--hr 8
EXEC HR_Employees_update_requests 'JenniferLaw', /* Accept non-leave request */
                                  'BenedictCumberbatch',
                                  '9/26/2017 15:00:00',
                                  'Approved'

EXEC HR_Employees_update_requests 'JenniferLaw', /* Reject non-leave request */
                                  'BenedictCumberbatch',
                                  '9/26/2017 16:00:00',
                                  'Rejected'

EXEC HR_Employees_update_requests 'JenniferLaw', /* Accept annual leave request */
                                  'BenedictCumberbatch',
                                  '9/27/2017 16:00:00',
                                  'Rejected'

EXEC HR_Employees_update_requests 'JenniferLaw', /* Accept annual leave request with not enough annual leaves */
                                  'BenedictCumberbatch',
                                  '9/26/2017 16:00:00',
                                  'Rejected'

EXEC HR_Employees_update_requests 'JenniferLaw', /* Accept accidental leave request */
                                  'BenedictCumberbatch',
                                  '9/26/2017 16:00:00',
                                  'Rejected'
--hr 9
EXEC HR_Employees_view_attendance 'JenniferLaw', '2012-01-01 08:00:00', '2022-12-12 09:00:00'
--hr 10
EXEC HR_Employees_total_hours 'JenniferLaw', 2012
-- hr11
EXEC HR_Employees_view_high_achievers "tarek.osman"
--regular 1
EXEC Regular_Employees_view_projects "Mona.Osman"
--regular 2
EXEC Regular_Employees_view_tasks "Rowan.Ibrahim", "Animation Video"
--regular 3
EXEC Regular_Employee_finalize_task "Rowan.Ibrahim", "Animation Video", "task7"