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

DELETE FROM courses WHERE course_id =1;

-- department table
CREATE TABLE Department(
    deptId SERIAL PRIMARY KEY,
    deptName VARCHAR(255) NOT NULL
);
INSERT INTO Department  VALUES (1,'IT');

-- employee table
CREATE TABLE Employee(
    empId SERIAL PRIMARY KEY,
    empName VARCHAR(255) NOT NULL,
    email TEXT  NOT NULL,
    salary INTEGER NOT NULL,
    joiningDate DATE NOT NULL
    departmentId INT,
    constraint fk_constraint_dept
       FOREIGN KEY (departmentId)
       REFERENCES Department(deptId)
);
INSERT INTO Employee VALUES (1, 'employee', 1);

-- ## SELECT
SELECT * FROM Employee;
SELECT empId,empName, departmentId FROM Employee;
SELECT * FROM Employee WHERE salary >90000;
SELECT * FROM Employee ORDER BY name ASC LIMIT 10 OFFSET 0;

-- in not in between like
SELECT * FROM Employee WHERE IN (1,2,3,4,5) ;
SELECT * FROM Employee WHERE salary BETWEEN 1000 ADD 15000;
SELECT * FROM employee WHERE name LIKE '%a%';
SELECT * FROM employee WHERE name LIKE '__a__';


 

