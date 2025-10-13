-- Lab Experiment 01: Implementation of DDL Commands in SQL for the given scenarios
-- STUDENT NAME: 
-- USN: 
-- SECTION: 

SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
-- OUTPUT : [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
-- 'root@localhost', 'RVU-PC-003', '8.4.6', '2025-08-25 05:54:03'

-- Scenario: College Student Management System

-- CREATE AND LOAD THE database
-- Write your SQL query below Codespace:
create database student_system;
use student_system;

-- Task 1: Create the Tables under this system (min 5 tables)
  -- Table 01: Departments ( DepartmentID, DepartmentName, HOD,ContactEmail,PhoneNumber,Location )
  -- Table 02: Course (CourseID, CourseName,Credits,DepartmentID,Duration,Fee )
  -- Table 03: Students (StudentID,FirstName,LastName,Email,DateOfBirth,CourseID)
  -- Table 04: Faculty FacultyID,FacultyName,DepartmentID,Qualification,Email,PhoneNumber)
  -- Table 05: Enrollments (  EnrollmentID,StudentID,CourseID,Semester,Year,Grade)
-- Specify the Key (Primary and Foreign) for each table while creating


-- Write your SQL query below Codespace:
create table Departments(
DepartmentID int Primary key,Departmentname varchar(25), HOD varchar(25),ContactEmail varchar(25),Phonenumber int,Location Varchar(100));  
create table Course(
CourseID int Primary key,CourseName varchar(25),credits int,DepartmentID int,Duration int,fee decimal(10,2),foreign key (DepartmentID) references Departments(DepartmentID));
create table Students(
StudentID int primary key,FirstName varchar(25),LastName varchar(25),Email varchar(20),DateofBirth date,CourseID int,foreign key(CourseID) references Course(CourseID));
create table Faculty(
FacultyID int Primary key,FacultyName varchar(25),DepartmentID int,Qualification varchar(25),Email varchar(25),PhoneNumber int,foreign key(DepartmentID) references Departments(DepartmentID));
create table Enrollments(
EnrollmentID int primary key,StudentID int,CourseID int,Semester int,Year int,Grade decimal(5,2),foreign key(StudentID) references Students(StudentID),foreign key(CourseID) references Course(CourseID));
-- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
-- OUTPUT : Disclaimer - This code is not the part of the SQL Code
desc Departments;
desc Course;
desc Students;
desc Faculty;
desc Enrollments;

--  describe the structure of each table and copy paste the Output 
-- 'DepartmentID', 'int', 'NO', 'PRI', NULL, ''
-- 'Departmentname', 'varchar(25)', 'YES', '', NULL, ''
-- 'HOD', 'varchar(25)', 'YES', '', NULL, ''
-- 'ContactEmail', 'varchar(25)', 'YES', '', NULL, ''
-- 'Phonenumber', 'int', 'YES', '', NULL, ''
-- 'Location', 'varchar(100)', 'YES', '', NULL, ''
-- Course table
-- 'StudentID', 'int', 'NO', 'PRI', NULL, ''
-- 'FirstName', 'varchar(25)', 'YES', '', NULL, ''
-- 'LastName', 'varchar(25)', 'YES', '', NULL, ''
-- 'Email', 'varchar(20)', 'YES', '', NULL, ''
-- 'DateofBirth', 'date', 'YES', '', NULL, ''
-- 'CourseID', 'int', 'YES', 'MUL', NULL, ''
-- Students table
-- 'StudentID', 'int', 'NO', 'PRI', NULL, ''
-- 'FirstName', 'varchar(25)', 'YES', '', NULL, ''
-- 'LastName', 'varchar(25)', 'YES', '', NULL, ''
-- 'Email', 'varchar(20)', 'YES', '', NULL, ''
-- 'DateofBirth', 'date', 'YES', '', NULL, ''
-- 'CourseID', 'int', 'YES', 'MUL', NULL, ''
-- Faculty Table
-- 'FacultyID', 'int', 'NO', 'PRI', NULL, ''
-- 'FacultyName', 'varchar(25)', 'YES', '', NULL, ''
-- 'DepartmentID', 'int', 'YES', 'MUL', NULL, ''
-- 'Qualification', 'varchar(25)', 'YES', '', NULL, ''
-- 'Email', 'varchar(25)', 'YES', '', NULL, ''
-- 'PhoneNumber', 'int', 'YES', '', NULL, ''
-- Enrollments Table
-- 'EnrollmentID', 'int', 'NO', 'PRI', NULL, ''
-- 'StudentID', 'int', 'YES', 'MUL', NULL, ''
-- 'CourseID', 'int', 'YES', 'MUL', NULL, ''
-- 'Semester', 'int', 'YES', '', NULL, ''
-- 'Year', 'int', 'YES', '', NULL, ''
-- 'Grade', 'decimal(5,2)', 'YES', '', NULL, ''









-- Perform the following operations on the each of the tables
-- 01: add 2 new columns for each table
-- 02: Modify the existing column from each table
-- 03 change the datatypes
-- 04: Rename a column
-- 05: Drop a column
-- 06: Rename the table
-- 07: describe the structure of the new table
-- 01:
alter table Departments add (no_of_staff int, no_of_students int);
alter table Course add (school varchar(10),no_of_subjects int);
alter table Students add (Address varchar(100),Gender varchar(10));
alter table Faculty add (Address varchar(100),Salary varchar(20));
alter table Enrollments add (no_of_enrollments int,Enrollment_date date);
-- 02:
alter table Departments modify no_of_staff varchar(10);
alter table Course modify CourseName varchar(50);
alter table Students modify Email varchar(30);
alter table Faculty modify Qualification varchar(30);
alter table Enrollments modify Grade decimal(4,2);
-- 04:
alter table Departments rename column no_of_staff  to staff_count ;
-- 05:
alter table Enrollments drop column no_of_enrollments;
-- 06:
alter table Faculty rename to Teachers;
-- 07:
desc Teachers;


/*  Additional set of questions 
--1 Add a new column Address (VARCHAR(100)) to the Students table.
--2 Add a column Gender (CHAR(1)) to the Students table.
--3 Add a column JoiningDate (DATE) to the Faculty table.
--4 Modify the column CourseName in the Courses table to increase its size from VARCHAR(50) to VARCHAR(100).
--5 Modify the column Location in the Departments table to VARCHAR(80).
--6 Rename the column Qualification in the Faculty table to Degree.
--7 Rename the table Faculty to Teachers.
--8 Drop the column PhoneNumber from the Departments table.
--9 Drop the column Email from the Students table.
--10 Drop the column Duration from the Courses table.
*/

SHOW TABLES; -- Before dropping the table

-- Drop the 'Courses' and 'Enrollments' tables from the database.
-- Write your SQL query below Codespace:

SHOW TABLES; -- After dropping the table Enrollement and Course

-- Note: Perform the specified operations on all the 5 tables in the system
-- End of Lab Experiment 01
-- Upload the Completed worksheet in the google classroom with file name USN _ LabScenario01
