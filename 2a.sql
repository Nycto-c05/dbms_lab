CREATE DATABASE IF NOT EXISTS StudentDB;
USE StudentDB;

-- Create the EMP table
CREATE TABLE EMP (
    Emp_no INT PRIMARY KEY,
    Emp_name VARCHAR(255),
    Dept_no INT
);

-- Insert data into the EMP table
INSERT INTO EMP (Emp_no, Emp_name, Dept_no)
VALUES
    (1, 'Ram', 101),
    (2, 'Shyam', 102),
    (3, 'Sita', 101),
    (4, 'Gita', 103),
    (5, 'Hari', 103);

-- Create the DEPT table
CREATE TABLE DEPT (
    Dept_no INT PRIMARY KEY,
    Dept_name VARCHAR(255)
);

-- Insert data into the DEPT table
INSERT INTO DEPT (Dept_no, Dept_name)
VALUES
    (101, 'HR'),
    (102, 'Finance'),
    (103, 'IT');

-- Create the Address table
CREATE TABLE Address (
    Dept_name VARCHAR(255),
    Dept_location VARCHAR(255)
);

-- Insert data into the Address table
INSERT INTO Address (Dept_name, Dept_location)
VALUES
    ('HR', 'Location1'),
    ('Finance', 'Location2'),
    ('IT', 'Location3');

-- Q1. Display the location of the department where employee 'Ram' is working.
SELECT A.Dept_location
FROM Address A
JOIN DEPT D ON A.Dept_name = D.Dept_name
JOIN EMP E ON D.Dept_no = E.Dept_no
WHERE E.Emp_name = 'Ram';

-- Q2. Create a view to store the total number of employees working in each department in ascending order.
CREATE OR REPLACE VIEW EmployeeCount AS
SELECT D.Dept_name, COUNT(E.Emp_no) AS TotalEmployees
FROM DEPT D
LEFT JOIN EMP E ON D.Dept_no = E.Dept_no
GROUP BY D.Dept_name
ORDER BY TotalEmployees ASC;

-- Q3. Find the name of the department in which no employee is working.
SELECT D.Dept_name
FROM DEPT D
LEFT JOIN EMP E ON D.Dept_no = E.Dept_no
WHERE E.Emp_no IS NULL;

select * from EMP;

drop database StudentDB;
