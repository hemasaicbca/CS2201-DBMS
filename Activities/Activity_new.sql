-- Name : Hemasai C
-- USN : 1RUA24BCA0033

create database school;
use school;
create table student(studentid varchar(10) primary key,firstname varchar(10),lastname varchar(10),Dob date,class varchar(5),marks int,city varchar(10));
create table faculty(teacherid varchar(10) primary key,firstname varchar(10),lastname varchar(10),Subject varchar(10),hiredate date,salary int);
create table course(courseid varchar(10) primary key, coursename varchar(10),credits int);
create table enrollment(enrollid varchar(10),studentid varchar(10),courseid varchar(10),grade varchar(5),foreign key (studentid) references student(studentid),foreign key (courseid) references course(courseid));
-- STUDENT DATA
insert into student values ("A001","Sharon","Arlin","2005-10-08","F104",95,"Bangalore");
insert into student values ("A002","Nandan","J","2004-11-19","F104",85,"Bangalore");
insert into student values ("A003","Pruthvi","Gowda R","2006-11-16","F104",70,"Bangalore");
insert into student values ("A004","Hemasai","C","2005-03-20","F104",98,"Bangalore");
insert into student values ("A005","Shishir","V","2006-10-02","F104",80,"Bangalore");
-- FACULTY DATA
insert into faculty values ("C001","Sharath","B R","DBMS","2025-07-20",100000);
insert into faculty values ("C002","Manish","Kumar","JAVA","2024-07-10",200000);
insert into faculty values ("C003","Maneesh","Raajan","CN","2025-07-26",50000);
-- COURSE DATA
insert into course values("CS0011","JAVA",8);
insert into course values("CS0012","DBMS",8);
insert into course values("CS0021","CN",8);
-- ENROLLMENT DATA 
insert into enrollment values("E001","A002","CS0011","A");
insert into enrollment values("E002","A004","CS0021","C");
insert into enrollment values("E003","A001","CS0012","B");
insert into enrollment values("E004","A003","CS0011","D");
insert into enrollment values("E005","A005","CS0011","P");

-- Student Table
Select * from student;
-- 'A001', 'Sharon', 'Arlin', '2005-10-08', 'F104', '95', 'Bangalore'
-- 'A002', 'Nandan', 'J', '2004-11-19', 'F104', '85', 'Bangalore'
-- 'A003', 'Pruthvi', 'Gowda R', '2006-11-16', 'F104', '70', 'Bangalore'
-- 'A004', 'Hemasai', 'C', '2005-03-20', 'F104', '98', 'Bangalore'
-- 'A005', 'Shishir', 'V', '2006-10-02', 'F104', '80', 'Bangalore'

-- Faculty Table
Select * from faculty;
-- 'C001', 'Sharath', 'B R', 'DBMS', '2025-07-20', '100000'
-- 'C002', 'Manish', 'Kumar', 'JAVA', '2024-07-10', '200000'
-- 'C003', 'Maneesh', 'Raajan', 'CN', '2025-07-26', '50000'

-- Course Table
Select * from course;
-- 'CS0011', 'JAVA', '8'
-- 'CS0012', 'DBMS', '8'
-- 'CS0021', 'CN', '8'

-- Enrollment Table
select * from enrollment;
-- 'E001', 'A002', 'CS0011', 'A'
-- 'E002', 'A004', 'CS0021', 'C'
-- 'E003', 'A001', 'CS0012', 'B'
-- 'E004', 'A003', 'CS0011', 'D'
-- 'E005', 'A005', 'CS0011', 'P'

-- Last 3 characters of courses 
select right(coursename,3) from course;
-- 'AVA'
-- 'BMS'
-- 'CN'

-- Concatenating FirstName and LastName of teachers as fullname
SELECT CONCAT(firstname, ' ', lastname) AS fullname
FROM faculty;

-- 'Sharath B R'
-- 'Manish Kumar'
-- 'Maneesh Raajan'

-- length of each student’s name
select studentid, firstname, lastname,
       LENGTH(firstname) + LENGTH(lastname) as namelength from student;
-- 'A001', 'Sharon', 'Arlin', '11'
-- 'A002', 'Nandan', 'J', '7'
-- 'A003', 'Pruthvi', 'Gowda R', '14'
-- 'A004', 'Hemasai', 'C', '8'
-- 'A005', 'Shishir', 'V', '8'

-- .Replace the word "Maths" with "Mathematics" in the Course table.
SELECT REPLACE(coursename, 'CN', 'Computer_networks') AS updated_course
FROM course;
-- 'JAVA'
-- 'DBMS'
-- 'Computer_networks'

-- .Find the absolute difference between maximum and minimum marks.
SELECT ABS(MAX(marks) - MIN(marks)) AS abs_marks
FROM student;

-- '28'

-- Round off teachers’ salaries to the nearest thousand
SELECT teacherid, salary, ROUND(salary, -3) AS roundoff
FROM faculty;

-- 'C001', '100000', '100000'
-- 'C002', '200000', '200000'
-- 'C003', '50000', '50000'

-- Square root of each course credit
SELECT courseid, coursename, SQRT(credits) AS sqrt_credits
FROM course;

-- 'CS0011', 'JAVA', '2.8284271247461903'
-- 'CS0012', 'DBMS', '2.8284271247461903'
-- 'CS0021', 'CN', '2.8284271247461903'

-- Display students’ marks with ceiling and floor values
SELECT studentid, marks,
       CEIL(marks) AS ceil_marks,
       FLOOR(marks) AS floor_marks
FROM student;

-- 'A001', '95', '95', '95'
-- 'A002', '85', '85', '85'
-- 'A003', '70', '70', '70'
-- 'A004', '98', '98', '98'
-- 'A005', '80', '80', '80'

-- modulus of total marks ÷ 5
SELECT SUM(marks) % 5 AS modulus
FROM student;

-- '3'

-- Display current date and time
SELECT NOW() AS date_and_time;

-- '2025-09-10 22:02:14'

-- Show year and month of hire for all teachers
SELECT teacherid, YEAR(hiredate) AS hire_year, MONTH(hiredate) AS hire_month
FROM faculty;

-- 'C001', 2025, '7'
-- 'C002', 2024, '7'
-- 'C003', 2025, '7'

-- List students born in January
SELECT * FROM student
WHERE MONTH(dob) = 1;
-- # studentid, firstname, lastname, Dob, class, marks, city

-- difference in days between today and teacher’s HireDate
SELECT teacherid, DATEDIFF(CURDATE(), hiredate) AS days_diff
FROM faculty;

-- 'C001', '52'
-- 'C002', '427'
-- 'C003', '46'

-- total number of students in the school
SELECT COUNT(*) AS total
FROM student;
-- '5'

-- average salary of teachers
SELECT AVG(salary) AS avg_salary
FROM faculty;
-- '116666.6667'

-- highest and lowest marks in the Student table
SELECT MAX(marks) AS highest, MIN(marks) AS lowest
FROM student;
-- '98', '70'
