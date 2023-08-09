-- Active: 1691152031186@@127.0.0.1@5432@test1
-- ## create database
 CREATE DATABASE test1;

-- ## rename database 
 ALTER DATABASE db1 RENAME TO db2;

-- ## delate database
 DROP DATABASE db2;

-- ## create statement table
CREATE TABLE student(
    student_id INTEGER,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    cgpa NUMERIC(1,2)
)

-- ## rename a table name
ALTER TABLE student RENAME TO learners;

-- ## delate a table
 DROP TABLE users;

 -- ## DELETE all the rows in a table without deleting the TABLE
TRUNCATE TABLE users;

-- ## CREATE TABLE with CONSTRAINT
CREATE TABLE users(
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    age INTEGER DEFAULT 18
);
-- ## insert value into users
INSERT INTO users values (1,'aab','aab@gmail.com');

INSERT INTO users(username,email) VALUES
('bac','bac@gmail.com'),
('bca','bca@gmail.com');

-- ## ALTER TABLE
ALTER TABLE users 
ADD COLUMN password VARCHAR(255) DEFAULT '1234' NOT NULL;

ALTER TABLE users
DROP COLUMN age;


SELECT * FROM users; 

CREATE Table courses(
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(255) NOT NULL
    description VARCHAR(255) ,
    published_date DATE
);
UPDATE courses 
SET course_name = 'Course',
description = 'course description'
WHERE course_id = 1;
UPDATE employee 
set departmentId = NULL
WHERE empId =8;

SELECT * FROM employee;
DELETE FROM courses WHERE empId =5;

-- department table
CREATE TABLE Department(
    deptId SERIAL PRIMARY KEY,
    deptName VARCHAR(255) NOT NULL
);


INSERT INTO Department (deptName) VALUES
    ('Sales'),
    ('Marketing'),
    ('Engineering'),
    ('Human Resources'),
    ('Finance'),
    ('IT'),
    ('Research and Development'),
    ('Product Management'),
    ('Design'),
    ('Business Development');
    

SELECT *FROM Department;
-- employee table
CREATE TABLE Employee(
    empId SERIAL PRIMARY KEY,
    empName VARCHAR(255) NOT NULL,
    email TEXT  NOT NULL,
    salary INTEGER NOT NULL,
    joiningDate DATE NOT NULL,
    departmentId INT,
    constraint fk_constraint_dept
       FOREIGN KEY (departmentId)
       REFERENCES Department(deptId)
);
INSERT INTO Employee (empName, email, salary, joiningDate, departmentId) 
VALUES
    ('John Doe', 'john.doe@example.com', 50000, '2023-01-15', 1),
    ('Jane Smith', 'jane.smith@example.com', 60000, '2023-02-20', 2),
    ('Michael Johnson', 'michael.johnson@example.com', 55000, '2022-11-10', 3),
    ('Emily Brown', 'emily.brown@example.com', 65000, '2023-05-05', 4),
    ('William Davis', 'william.davis@example.com', 52000, '2023-03-12', 5),
    ('Olivia Wilson', 'olivia.wilson@example.com', 58000, '2022-09-25', 6),
    ('James Martinez', 'james.martinez@example.com', 62000, '2023-07-18', 7),
    ('Emma Anderson', 'emma.anderson@example.com', 53000, '2023-04-01', 8),
    ('Liam Taylor', 'liam.taylor@example.com', 68000, '2022-12-22', 9),
    ('Ava Rodriguez', 'ava.rodriguez@example.com', 59000, '2023-06-08', 10),
    ('Sophia Clark', 'sophia.clark@example.com', 57000, '2022-10-09', 1),
    ('Noah White', 'noah.white@example.com', 62000, '2022-11-18', 7),
    ('Isabella Hall', 'isabella.hall@example.com', 54000, '2023-01-30', 9),
    ('Liam Davis', 'liam.davis@example.com', 63000, '2023-02-10', 3),
    ('Olivia Allen', 'olivia.allen@example.com', 57000, '2023-04-22', 2),
    ('Lucas Martinez', 'lucas.martinez@example.com', 61000, '2023-06-11', 10),
    ('Sophia Miller', 'sophia.miller@example.com', 55000, '2022-09-07', 6),
    ('Aiden Smith', 'aiden.smith@example.com', 64000, '2022-12-03', 6),
    ('Amelia Wilson', 'amelia.wilson@example.com', 59000, '2023-03-27', 8),
    ('Jackson Johnson', 'jackson.johnson@example.com', 56000, '2023-07-02', 4);


-- ## SELECT
SELECT * FROM Employee;
SELECT * FROM department;
SELECT empId,empName, departmentId FROM Employee;
SELECT * FROM Employee WHERE salary >90000;
SELECT * FROM Employee ORDER BY empName ASC LIMIT 10 OFFSET 0;

-- in not in between like
SELECT * FROM Employee WHERE departmentId IN (1, 2, 3, 4, 5);

SELECT * FROM Employee WHERE salary BETWEEN 50000 AND 60000;
SELECT * FROM employee WHERE empName LIKE '%a%';
SELECT * FROM employee WHERE empName LIKE '_a_';

-- ## joining inner left right full
 SELECT empId,empName, deptId,deptName
FROM Employee
FULL JOIN Department ON Employee.departmentId = Department.deptId;

-- ## aggregation min max sum avg

SELECT Department.deptId, deptName, AVG(salary),sum(salary), MAX(salary),min(salary),count(*)
FROM Employee
INNER JOIN Department ON Employee.departmentId = Department.deptId
GROUP BY Department.deptId, deptName;
