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