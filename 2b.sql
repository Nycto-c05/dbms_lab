CREATE DATABASE IF NOT EXISTS StudentDB;
USE StudentDB;

-- Create the EMP table
CREATE TABLE EMP (
    emp_id INT PRIMARY KEY,
    last_name VARCHAR(255),
    job_id VARCHAR(255),
    salary DECIMAL(10, 2)
);

-- Insert data into the EMP table
INSERT INTO EMP (emp_id, last_name, job_id, salary)
VALUES
    (1, 'John', 'MANAGER', 50000.00),
    (2, 'Alice', 'MANAGER', 55000.00),
    (3, 'Bob', 'CLERK', 30000.00),
    (4, 'Charlie', 'CLERK', 28000.00),
    (5, 'David', 'ANALYST', 60000.00),
    (6, 'Eve', 'ANALYST', 62000.00);

-- Q1. Find out all employees having salary less than all managers, and they should not be managers.
SELECT E1.emp_id, E1.last_name, E1.salary
FROM EMP E1
WHERE E1.job_id <> 'MANAGER'
AND E1.salary < ALL (
    SELECT E2.salary
    FROM EMP E2
    WHERE E2.job_id = 'MANAGER'
);

-- Q2. Find out all employees having a salary not equal to any of the managers' salaries, and they should not be managers.
SELECT E1.emp_id, E1.last_name, E1.salary
FROM EMP E1
WHERE E1.job_id <> 'MANAGER'
AND E1.salary <> ALL (
    SELECT E2.salary
    FROM EMP E2
    WHERE E2.job_id = 'MANAGER'
);


drop database StudentDB;
