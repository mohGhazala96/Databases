CREATE TABLE Managers(
    username VARCHAR (50),
    type VARCHAR (50) NOT NULL,

    PRIMARY KEY (username),
    FOREIGN KEY (username) REFERENCES Staff_Members (username) ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE Announcements(
    date DATETIME,
    title VARCHAR(50),
    hr_employee VARCHAR (50),
    type VARCHAR (50) NOT NULL,
    description VARCHAR(MAX) NOT NULL, 

    PRIMARY KEY (date, title, hr_employee),
    FOREIGN KEY (hr_employee) REFERENCES HR_Employees (username) ON DELETE SET NULL ON UPDATE CASCADE
)

CREATE TABLE Requests(
    start_date DATETIME,
    applicant VARCHAR(50),
    end_date DATETIME NOT NULL,
    request_date DATETIME NOT NULL,
    total_days AS end_date - start_date,
    hr_employee VARCHAR(50),
    hr_response VARCHAR(50) NOT NULL,
    manager VARCHAR (50),
    manager_response VARCHAR(50) NOT NULL,
    manager_reason VARCHAR(MAX),

    CHECK(hr_response= 'Approved' or hr_response='Rejected' or hr_response='Pending'),
    CHECK(manager_response= 'Approved' or manager_response='Rejected' or manager_response='Pending'),

    PRIMARY KEY (start_date, applicant),
    FOREIGN KEY (applicant) REFERENCES Staff_Members (username) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (hr_employee) REFERENCES HR_Employees (username) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (manager)   REFERENCES Managers (username) ON DELETE SET NULL ON UPDATE CASCADE
)

CREATE TABLE Leave_Requests(
    start_date DATETIME,
    applicant VARCHAR(50),

    PRIMARY KEY (start_date, applicant),
    FOREIGN KEY (start_date, applicant) REFERENCES Requests (start_date, applicant) ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE Business_Trip_Requests(
    start_date DATETIME,
    applicant VARCHAR(50),
    destination VARCHAR(50) NOT NULL,
    purpose VARCHAR(1000) NOT NULL,

    PRIMARY KEY (start_date, applicant),
    FOREIGN KEY (start_date, applicant) REFERENCES  Requests (start_date, applicant) ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE HR_Employee_apply_replace_Requests(
    start_date DATETIME,
    applicant VARCHAR(50),
    hr_employee VARCHAR(50),
    replacement VARCHAR(50) NOT NULL,

    PRIMARY KEY (start_date, applicant),
    FOREIGN KEY (start_date, applicant) REFERENCES  Requests (start_date, applicant) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (hr_employee) REFERENCES  HR_Employees (username) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (replacement) REFERENCES  HR_Employees (username) ON DELETE SET NULL ON UPDATE CASCADE
) 