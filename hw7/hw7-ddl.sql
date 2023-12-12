# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS peopleroles;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS skills;
SET FOREIGN_KEY_CHECKS=1;

# Section 2
CREATE TABLE skills (
    id int,
    name varchar(255) NOT NULL,
    description varchar(4096),
    tag varchar(255) NOT NULL,
    url varchar(4096),
    time_commitment varchar(255),
    PRIMARY KEY (id)
);


# Section 3
INSERT INTO skills (id, name, description, tag, url, time_commitment) 
VALUES
    (1, 'Skill 1', 'Description for Skill 1', 'Skill 1', 'https://url1.com', 'Medium'),
    (2, 'Skill 2', 'Description for Skill 2', 'Skill 2', 'https://url2.com', 'Low'),
    -- ... Repeat for Skills 3 to 8


# Section 4
CREATE TABLE people (
    people_id int,
    people_first_name varchar(256),
    people_last_name varchar(256) NOT NULL,
    email varchar(4096),
    linkedin_url varchar(4096),
    headshot_url varchar(4096),
    discord_handle varchar(4096),
    brief_bio varchar(4096),
    date_joined date NOT NULL,
    PRIMARY KEY (people_id)
);


# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

INSERT INTO people (people_id, people_last_name, date_joined) 
VALUES 
    (1, 'Person 1', '2023-01-01'),
    -- ... Repeat for People 2 to 6


# Section 6
CREATE TABLE peopleskills (
    id int AUTO_INCREMENT,
    skills_id int NOT NULL,
    people_id int NOT NULL,
    date_acquired date NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (skills_id) REFERENCES skills(id),
    FOREIGN KEY (people_id) REFERENCES people(people_id)
);


# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.
INSERT INTO peopleskills (skills_id, people_id, date_acquired) 
VALUES
    (1, 1, '2023-01-02'),  
    (3, 1, '2023-01-02'),  
    (6, 1, '2023-01-02'),  

    (3, 2, '2023-01-03'),  
    (4, 2, '2023-01-03'), 
    (5, 2, '2023-01-03'),  

    (1, 3, '2023-01-04'),  
    (5, 3, '2023-01-04'),  

    (3, 5, '2023-01-05'),  
    (6, 5, '2023-01-05'),  

    (2, 6, '2023-01-06'),  
    (3, 6, '2023-01-06'),  
    (4, 6, '2023-01-06'),  

    (3, 7, '2023-01-07'),  
    (5, 7, '2023-01-07'),  
    (6, 7, '2023-01-07'),  

    (1, 8, '2023-01-08'),  
    (3, 8, '2023-01-08'),  
    (5, 8, '2023-01-08'),  
    (6, 8, '2023-01-08'),  

    (2, 9, '2023-01-09'),  
    (5, 9, '2023-01-09'),  
    (6, 9, '2023-01-09'),  

    (1, 10, '2023-01-10'), 
    (4, 10, '2023-01-10'), 
    (5, 10, '2023-01-10'); 


# Section 8
CREATE TABLE roles (
    id int,
    name varchar(255),
    sort_priority int,
    PRIMARY KEY (id)
);


# Section 9
INSERT INTO roles (id, name, sort_priority) 
VALUES
    (1, 'Designer', 10),
    (2, 'Developer', 20),
    (3, 'Recruit', 30),
    (4, 'Team Lead', 40),
    (5, 'Boss', 50),
    (6, 'Mentor', 60);


# Section 10
CREATE TABLE peopleroles (
    id int AUTO_INCREMENT,
    people_id int NOT NULL,
    role_id int NOT NULL,
    date_assigned date NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (people_id) REFERENCES people(people_id),
    FOREIGN KEY (role_id) REFERENCES roles(id)
);
# Section 11
INSERT INTO peopleroles (people_id, role_id, date_assigned) 
VALUES
    (1, 2, '2023-01-03'),
    (2, 5, '2023-01-04'),
    (2, 6, '2023-01-04'),
    (3, 2, '2023-01-05'),
    (3, 4, '2023-01-05'),
    (4, 3, '2023-01-06'),
    (5, 3, '2023-01-07'),
    (6, 2, '2023-01-08'),
    (6, 1, '2023-01-08'),
    (7, 1, '2023-01-09'),
    (8, 1, '2023-01-10'),
    (8, 4, '2023-01-10'),
    (9, 2, '2023-01-11'),
    (10, 2, '2023-01-12'),
    (10, 1, '2023-01-12'); 
