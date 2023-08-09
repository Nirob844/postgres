-- Active: 1691152031186@@127.0.0.1@5432@tasks@public
--! task 1:  SELECT and WHERE Clause Create a table named "employees" with columns (emp_id, emp_name, department, salary) and insert the following data
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);

INSERT INTO employees (emp_id, emp_name, department, salary)
VALUES
    (1, 'John Doe', 'HR', 50000.00),
    (2, 'Jane Smith', 'IT', 60000.00),
    (3, 'Michael Johnson', 'Finance', 55000.00),
    (4, 'Emily Brown', 'HR', 52000.00);

SELECT * FROM employees;

--? Write an SQL query to retrieve the names and salaries of employees who work in the "HR" department.
SELECT emp_name,salary FROM employees WHERE department = 'HR';

--! Task 2: Aggregation and HAVING Clause Create a table named "orders" with columns (order_id, customer_id, total_amount) and insert the following data:
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    total_amount DECIMAL(10, 2)
);

INSERT INTO orders (order_id, customer_id, total_amount)
VALUES
    (101, 1, 200.00),
    (102, 2, 300.00),
    (103, 1, 150.00),
    (104, 3, 400.00),
    (105, 2, 250.00);
SELECT * FROM orders;

--? Write an SQL query to find the customer IDs and the average total amount of their orders. Display only those customers whose average total amount is greater than or equal to 250.
SELECT customer_id, AVG(total_amount) AS average_total_amount
FROM orders
GROUP BY customer_id
HAVING AVG(total_amount) >= 250;

--! Task 3: JOIN and GROUP BY Create two tables named "students" and "courses" with columns as follows:
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    age INT,
    gender VARCHAR(10)
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    credits INT
);

INSERT INTO students (student_id, student_name, age, gender)
VALUES
    (1, 'Alice', 22, 'Female'),
    (2, 'Bob', 21, 'Male'),
    (3, 'Charlie', 23, 'Male');

INSERT INTO courses (course_id, course_name, credits)
VALUES
    (101, 'Mathematics', 3),
    (102, 'History', 4),
    (103, 'Physics', 3);

-- Enrollment table with student-course relationships
CREATE TABLE enrollment (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT
);

INSERT INTO enrollment (enrollment_id, student_id, course_id)
VALUES
    (1, 1, 101),
    (2, 1, 102),
    (3, 2, 103),
    (4, 3, 101);
--? Write an SQL query to retrieve the student name, course name, and credits for all enrolled courses.
SELECT s.student_name,cr.course_name,cr.credits
FROM students s
JOIN enrollment e ON e.student_id=s.student_id
JOIN courses cr ON cr.course_id=e.course_id;

--! Task 4: Multiple Joins and Aggregation Create three tables named "employees," "departments," and "salaries" with columns as follows:
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department_id INT
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

CREATE TABLE salaries (
    emp_id INT,
    salary DECIMAL(10, 2)
);

INSERT INTO employees (emp_id, emp_name, department_id)
VALUES
    (1, 'John Doe', 1),
    (2, 'Jane Smith', 2),
    (3, 'Michael Johnson', 1),
    (4, 'Emily Brown', 3);

INSERT INTO departments (department_id, department_name)
VALUES
    (1, 'HR'),
    (2, 'IT'),
    (3, 'Finance');

INSERT INTO salaries (emp_id, salary)
VALUES
    (1, 50000.00),
    (2, 60000.00),
    (3, 55000.00),
    (4, 52000.00);
--? Write an SQL query to retrieve the department name and the average salary of employees working in each department. Sort the results by the average salary in descending order.
SELECT e.emp_name, d.department_name, AVG(s.salary)
FROM employees e
JOIN departments d ON d.department_id = e.department_id
JOIN salaries s ON s.emp_id = e.emp_id
GROUP BY e.emp_name, d.department_name
ORDER BY avg(s.salary) DESC;

--! Task 5: Aggregation and Grouping Create a table named "orders" with columns (order_id, customer_id, order_date, total_amount) and insert the following data:
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2)
);

INSERT INTO orders (order_id, customer_id, order_date, total_amount)
VALUES
    (101, 1, '2023-01-05', 200.00),
    (102, 2, '2023-01-06', 300.00),
    (103, 1, '2023-02-10', 150.00),
    (104, 3, '2023-02-15', 400.00),
    (105, 2, '2023-03-20', 250.00);
--? Write an SQL query to find the total sales amount for each month, along with the number of orders in that month.
SELECT
    DATE_TRUNC('month', order_date) AS month,
    COUNT(*) AS number_of_orders,
    SUM(total_amount) AS total_sales_amount
FROM orders
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY month;
