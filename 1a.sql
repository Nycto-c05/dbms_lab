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
