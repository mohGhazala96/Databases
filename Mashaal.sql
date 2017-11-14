# This file has not been tested, I'm waiting for other table creation scripts to be finished

CREATE TABLE Regular_Employees_apply_replace_Requests( # Change in Schema
  start_date datetime FOREIGN KEY REFERENCES Requests.start_date NOT NULL ON DELETE CASCADE,
  applicant VARCHAR(20) FOREIGN KEY REFERENCES Requests.applicant NOT NULL ON DELETE CASCADE,
  reg_employee VARCHAR(20) FOREIGN KEY REFERENCES Regular_Employees NOT NULL ON DELETE CASCADE,
  replacement int FOREIGN KEY REFERENCES Regular_Employees NOT NULL ON DELETE CASCADE,
  PRIMARY KEY(start_date, applicant)
)

CREATE TABLE Managers_apply_replace_Requests( # Change in Schema
  start_date datetime FOREIGN KEY REFERENCES Requests.start_date NOT NULL ON DELETE CASCADE,
  applicant int FOREIGN KEY REFERENCES Requests.applicant NOT NULL ON DELETE CASCADE,
  manager int FOREIGN KEY REFERENCES Manager NOT NULL ON DELETE CASCADE,
  replacement int FOREIGN KEY REFERENCES Manager NOT NULL ON DELETE CASCADE,
  PRIMARY KEY(start_date, applicant)
)

CREATE TABLE Projects( # Change in Schema
  name VARCHAR(20) NOT NULL,
  company VARCHAR(20) FOREIGN KEY REFERENCES Companies NOT NULL ON DELETE CASCADE,
  start_date datetime,
  end_date datetime,
  manager VARCHAR(20) FOREIGN KEY REFERENCES Managers NOT NULL ON DELETE CASCADE,
  PRIMARY KEY(name, company)
)

CREATE TABLE Managers_assign_Regular_Employees_Projects( # Change in Schema
  project_name VARCHAR(20) FOREIGN KEY REFERENCES Projects.name NOT NULL ON DELETE CASCADE,
  company VARCHAR(20) FOREIGN KEY REFERENCES Projects.company NOT NULL ON DELETE CASCADE,
  regular_employee int FOREIGN KEY REFERENCES Regular_Employees NOT NULL ON DELETE CASCADE,
  manager VARCHAR(20) FOREIGN KEY REFERENCES Managers NOT NULL ON DELETE CASCADE,
  PRIMARY KEY(project_name, company, regular_employee)
)

CREATE TABLE Tasks( # Change in Schema
  name VARCHAR(20) NOT NULL,
  project VARCHAR(20) FOREIGN KEY REFERENCES Projects.name NOT NULL ON DELETE CASCADE,
  company VARCHAR(20) FOREIGN KEY REFERENCES Projects.company NOT NULL ON DELETE CASCADE,
  deadline datetime,
  status VARCHAR(10) NOT NULL,
  description VARCHAR(MAX) NOT NULL,
  regular_employee int FOREIGN KEY REFERENCES Regular_Employees NOT NULL ON DELETE CASCADE,
  manager VARCHAR(20) FOREIGN KEY REFERENCES Managers NOT NULL ON DELETE CASCADE,
  PRIMARY KEY(name, project, company)
)

CREATE TABLE Task_Comments( # Change in Schema
  task_name VARCHAR(20) FOREIGN KEY REFERENCES Tasks.name NOT NULL,
  project VARCHAR(20) FOREIGN KEY REFERENCES Tasks.name NOT NULL ON DELETE CASCADE,
  company VARCHAR(20) FOREIGN KEY REFERENCES Tasks.company NOT NULL ON DELETE CASCADE,
  comment VARCHAR(MAX) NOT NULL,
  PRIMARY KEY(task_name, project, company, comment)
)
