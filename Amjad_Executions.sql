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




EXEC HR_Employees_view_applications "tarek.osman", "Engineer"

EXEC HR_Employees_accept_reject_applications "tarek.osman", "Ashraf.Zaki", "Engineer", "Approved"

EXEC HR_Employees_create_announcement "tarek.osman",
                                      "Deadline extension",
                                      "type",
                                      "The databases milestone deadline has been extended to 12/12/2021"



EXEC HR_Employees_view_requests "JenniferLaw"



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

SELECT * FROM Attendance_Records

EXEC HR_Employees_view_attendance 'JenniferLaw', 'BenedictCumberbatch', '2012-01-01 08:00:00', '2022-12-12 09:00:00'

EXEC HR_Employees_total_hours 'JenniferLaw', 2012

EXEC HR_Employees_view_high_achievers "tarek.osman"

EXEC Regular_Employees_view_projects "Mona.Osman"

EXEC Regular_Employees_view_tasks "Rowan.Ibrahim", "Animation Video"

EXEC Regular_Employee_finalize_task "Rowan.Ibrahim", "Animation Video", "task7"