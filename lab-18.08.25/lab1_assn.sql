-- Lab Experiment 01: Implementation of DDL Commands in SQL
-- STUDENT NAME: 
-- USN: 
-- SECTION: 

SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
-- OUTPUT : [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]

-- 'root@localhost', 'RVU-PC-003', '8.4.6', '2025-08-18 11:35:44';

-- Scenario: University Course Management System
-- CREATE AND LOAD THE database DBLab001
-- Write your SQL query below Codespace:
create database University_system;
use University_system;

-- Task 1: Create the Students Table
-- Create a table to store information about students.
-- Include the following columns:
-- 1. StudentID (Primary Key)
-- 2. FirstName
-- 3. LastName
-- 4. Email (Unique Constraint)
-- 5. DateOfBirth

-- Write your SQL query below Codespace:
create table STUDENTS(
StudentID varchar(10) primary key,
firstname varchar(15),
lastname varchar(15),
email varchar(12) unique,
dob date);

DESC STUDENTS; -- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
-- OUTPUT : Disclaimer - This code is not the part of the SQL Code
-- 'StudentID', 'varchar(10)', 'NO', 'PRI', NULL, ''
-- 'firstname', 'varchar(15)', 'YES', '', NULL, ''
-- 'lastname', 'varchar(15)', 'YES', '', NULL, ''
-- 'email', 'varchar(12)', 'YES', 'UNI', NULL, ''
-- 'dob', 'date', 'YES', '', NULL, ''


-- Alter the table and 2 new columns
-- Modify a column data type
alter table STUDENTS modify email varchar(15);
desc STUDENTS;
-- Rename a column
alter table STUDENTS rename column dob to DateofBirth;
-- Drop a column
alter table Students drop column lastname;
-- Rename the table
alter table STUDENTS rename to Student_details;
desc Student_details;






-- Task 2: Create the Courses Table
-- Create a table to store information about courses.
-- Include the following columns:
-- - CourseID (Primary Key)
-- - CourseName
-- - Credits

-- Write your SQL query below Codespace:
Create table Courses(
CourseID varchar(15) Primary key,
CourseName varchar(15),
Credits int);

DESC Courses; -- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]

-- OUTPUT :

-- Alter the table and 2 new columns
alter table Courses add (Department varchar(10),no_of_classes int);

-- Modify a column data type
-- Rename a column
-- Drop a column
-- Rename the table


-- Task 3: Create the Enrollments Table
-- Create a table to store course enrollment information.
-- Include the following columns:
-- - EnrollmentID (Primary Key)
-- - StudentID (Foreign Key referencing Students table)
-- - CourseID (Foreign Key referencing Courses table)
-- - EnrollmentDate

-- Write your SQL query below Codespace:
create 

DESC ENROLLMENTS; -- [ [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ] ]
-- OUTPUT :

-- Alter the table and 2 new columns
-- Modify a column data type
-- Rename a column
-- Drop a column
-- Rename the table

-- Task 4: Alter the Students Table
-- Add a column 'PhoneNumber' to store student contact numbers.

-- Write your SQL query below Codespace:

DESC STUDENTS; -- [[ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]]

-- Task 5: Modify the Courses Table
-- Change the data type of the 'Credits' column to DECIMAL.
-- Write your SQL query below Codespace:

-- Task 6: Drop Tables

SHOW TABLES; -- Before dropping the table

-- Drop the 'Courses' and 'Enrollments' tables from the database.
-- Write your SQL query below Codespace:

SHOW TABLES; -- After dropping the table Enrollement and Course

-- End of Lab Experiment 01
-- Upload the Completed worksheet in the google classroom with file name USN _ LabExperiment01
