use re;

-- Create the Branch table
CREATE TABLE branch (
    branch_name VARCHAR(50) PRIMARY KEY,
    branch_city VARCHAR(50),
    assets DECIMAL(12, 2)
);

-- Create the Customer table
CREATE TABLE customer (
    cust_name VARCHAR(50) PRIMARY KEY,
    cust_street VARCHAR(100),
    cust_city VARCHAR(50)
);

-- Create the Account table
CREATE TABLE Account (
    Ace_no INT PRIMARY KEY,
    branch_name VARCHAR(50) NOT NULL,
    balance DECIMAL(10, 2),
    FOREIGN KEY (branch_name) REFERENCES branch(branch_name)
);

-- Create the Depositor table
CREATE TABLE Depositor (
    cust_name VARCHAR(50),
    acc_no INT,
    PRIMARY KEY (cust_name, acc_no),
    FOREIGN KEY (cust_name) REFERENCES customer(cust_name),
    FOREIGN KEY (acc_no) REFERENCES Account(Ace_no)
);

-- Create the Loan table
CREATE TABLE Loan (
    loan_no INT PRIMARY KEY,
    branch_name VARCHAR(50) NOT NULL,
    amount DECIMAL(10, 2),
    FOREIGN KEY (branch_name) REFERENCES branch(branch_name)
);

-- Create the Borrower table
CREATE TABLE Borrower (
    cust_name VARCHAR(50),
    loan_no INT,
    PRIMARY KEY (cust_name, loan_no),
    FOREIGN KEY (cust_name) REFERENCES customer(cust_name),
    FOREIGN KEY (loan_no) REFERENCES Loan(loan_no)
);


-- Modify the foreign key constraint for Borrower to allow ON DELETE CASCADE
ALTER TABLE Borrower
DROP FOREIGN KEY Borrower_ibfk_2;

ALTER TABLE Borrower
ADD CONSTRAINT Borrower_ibfk_2
FOREIGN KEY (loan_no) REFERENCES Loan(loan_no) ON DELETE CASCADE;

-- Insert dummy values

-- Insert into Branch table
INSERT INTO branch (branch_name, branch_city, assets) VALUES
    ('Branch1', 'City1', 50000.00),
    ('Branch2', 'City2', 75000.00),
    ('Branch3', 'City3', 60000.00);

-- Insert into Customer table
INSERT INTO customer (cust_name, cust_street, cust_city) VALUES
    ('Customer1', 'Street1', 'City1'),
    ('Customer2', 'Street2', 'City2'),
    ('Customer3', 'Street3', 'City3');

-- Insert into Account table
INSERT INTO Account (Ace_no, branch_name, balance) VALUES
    (1, 'Branch1', 1000.00),
    (2, 'Branch2', 2000.00),
    (3, 'Branch3', 1500.00);

-- Insert into Depositor table
INSERT INTO Depositor (cust_name, acc_no) VALUES
    ('Customer1', 1),
    ('Customer2', 2),
    ('Customer3', 3);

-- Insert into Loan table
INSERT INTO Loan (loan_no, branch_name, amount) VALUES
    (101, 'Branch1', 12000.00),
    (102, 'Branch2', 1300.00),
    (103, 'Branch3', 8000.00);

-- Insert into Borrower table
INSERT INTO Borrower (cust_name, loan_no) VALUES
    ('Customer1', 101),
    ('Customer2', 102),
    ('Customer3', 103);
    
    
    
-- Q1. Find all customers who have a loan from the bank. Find their names, loan_no, and loan amount
SELECT DISTINCT C.cust_name, L.loan_no, L.amount
FROM customer C
JOIN Borrower B ON C.cust_name = B.cust_name
JOIN Loan L ON B.loan_no = L.loan_no;

-- Q2. Find all loan numbers for loans made at Akurdi Branch with a loan amount greater than 12,000
SELECT L.loan_no
FROM Loan L
JOIN branch B ON L.branch_name = B.branch_name
WHERE B.branch_city = 'Akurdi' AND L.amount > 12000;

-- Q3. Find the average account balance at each branch
SELECT A.branch_name, AVG(A.balance) AS avg_balance
FROM Account A
GROUP BY A.branch_name;

-- Q4. Find all customers who have an account or a loan or both at the bank
SELECT DISTINCT C.cust_name
FROM customer C
LEFT JOIN Depositor D ON C.cust_name = D.cust_name
LEFT JOIN Borrower B ON C.cust_name = B.cust_name
WHERE D.cust_name IS NOT NULL OR B.cust_name IS NOT NULL;

-- Q5. Delete all loans with a loan amount between 1300 and 1500
DELETE FROM Loan
WHERE amount BETWEEN 1300 AND 1500;
