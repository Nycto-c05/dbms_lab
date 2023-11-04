-- Create the Student Database
CREATE DATABASE IF NOT EXISTS StudentDB;
USE StudentDB;

-- Create the Student Table with Roll Number, Name, and Submission Status
CREATE TABLE Student (
    RollNumber INT NOT NULL,
    Name VARCHAR(255),
    SubmissionStatus VARCHAR(50),
    PRIMARY KEY (RollNumber)
);

-- Insert Dummy Data into the Student Table
INSERT INTO Student (RollNumber, Name, SubmissionStatus)
VALUES
    (1, 'John Doe', 'Submitted'),
    (2, 'Jane Smith', 'Not Submitted'),
    (3, 'Alice Johnson', 'Submitted'),
    (4, 'Bob Brown', 'Not Submitted');

-- Change the Submission Status of a Specific Student
UPDATE Student
SET SubmissionStatus = 'Submitted'
WHERE RollNumber = 2;

-- Create a View on the Student Table
CREATE VIEW SubmittedStudents AS
SELECT RollNumber, Name, SubmissionStatus
FROM Student
WHERE SubmissionStatus = 'Submitted';

-- Create or update the view without referencing the non-existent 'SUBMISSION_DATE' column
CREATE OR REPLACE VIEW SubmittedStudents AS
SELECT RollNumber, Name, SubmissionStatus
FROM Student
WHERE SubmissionStatus = 'Submitted';

-- Change the Name of a Specific Student in the Table
UPDATE Student
SET Name = 'New Name'
WHERE RollNumber = 1;


drop database StudentDB;
