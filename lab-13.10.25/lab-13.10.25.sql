-- Lab Experiment 08: Implementation of Procedure ( insert, update and delete)
-- STUDENT NAME: Hemasai C 
-- USN: 1RUA24BCA0033
-- SECTION: A

SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
-- OUTPUT : [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
-- 'root@localhost', 'RVU-PC-003', '8.4.6', '2025-10-13 11:35:43'

-- Scenario: Employee Management System
-- CREATE AND LOAD THE database DBLab008
create database DBLab008;
use DBLab008;
-- Write your SQL query below Codespace:

-- Task 1: Create the Employee Table
-- Create a table to store information about Employee.
-- Include the following columns:
 --   empid INT PRIMARY KEY,
   -- empname VARCHAR(50),
   -- age INT,
   -- salary DECIMAL(10,2),
   -- designation VARCHAR(30),
   -- address VARCHAR(100),
   -- date_of_join DATE
-- Write your SQL query below Codespace:
create table Employee(
empid INT PRIMARY KEY,
    empname VARCHAR(50),
    age INT,
    salary DECIMAL(10,2),
    designation VARCHAR(30),
    address VARCHAR(100),
    date_of_join DATE);
-- DESCRIBE THE SCHEMA -- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
-- OUTPUT : Disclaimer - This code is not the part of the SQL Code

-- insert 10 records to the table 
-- Write your SQL query below Codespace:
insert into Employee values
("100","Neha",21,200000.00,"HR","Bangalore","2025-07-21"),
("101","Nandan J",21,15000.00,"Manager","Chintamani","2025-05-20"),
("102","Yashwanth P V",18,25000.00,"CEO","Koramangala","2020-01-15"),
("103","Harshitha H",18,28000.00,"MD","Bidadi","2020-01-15"),
("104","Pruthvi Gowda R",17,30000.00,"Junior developer","Vijayanagar","2024-08-28"),
("105","Sharon Arlin",20,2500000.00,"Founder","Kammanahalli","2019-01-20"),
("106","Shishir V",18,20000.00,"Intern","Pattanagere","2024-01-17"),
("107","Ravi Kumar",25,75000.00,"Developer","Whitefield","2022-03-14"),
("108","Sneha Reddy",23,55000.00,"Designer","Jayanagar","2021-07-09"),
("109","Arjun Mehta",28,120000.00,"Manager","Indiranagar","2020-11-22"),
("110","Priya Sharma",21,40000.00,"Analyst","BTM Layout","2023-05-30");

select * from Employee;



-- COPYPASTE OF THE OUTPUT in CSV Format and terminate with ;
# empid, empname, age, salary, designation, address, date_of_join
-- '100', 'Neha', '21', '200000.00', 'HR', 'Bangalore', '2025-07-21'
-- '101', 'Nandan J', '21', '15000.00', 'Manager', 'Chintamani', '2025-05-20'
-- '102', 'Yashwanth P V', '18', '25000.00', 'CEO', 'Koramangala', '2020-01-15'
-- '103', 'Harshitha H', '18', '28000.00', 'MD', 'Bidadi', '2020-01-15'
-- '104', 'Pruthvi Gowda R', '17', '30000.00', 'Junior developer', 'Vijayanagar', '2024-08-28'
-- '105', 'Sharon Arlin', '20', '2500000.00', 'Founder', 'Kammanahalli', '2019-01-20'
-- '106', 'Shishir V', '18', '20000.00', 'Intern', 'Pattanagere', '2024-01-17'
-- '107', 'Ravi Kumar', '25', '75000.00', 'Developer', 'Whitefield', '2022-03-14'
-- '108', 'Sneha Reddy', '23', '55000.00', 'Designer', 'Jayanagar', '2021-07-09'
-- '109', 'Arjun Mehta', '28', '120000.00', 'Manager', 'Indiranagar', '2020-11-22'
-- '110', 'Priya Sharma', '21', '40000.00', 'Analyst', 'BTM Layout', '2023-05-30'

-- perform the following procedures on the employee database and copy paste the output in the space provided
-- A. Insert Procedure

-- 1. Write a stored procedure named InsertEmployee to insert a new employee record into the Employee table with all fields as input parameters.
delimiter //
create procedure insertemployee(
    in pid int,
    in pname varchar(50),
    in page int,
    in psalary decimal(10,2),
    in pdesignation varchar(30),
    in paddress varchar(100),
    in pdate date
)
begin
    insert into employee values(pid, pname, page, psalary, pdesignation, paddress, pdate);
end //
delimiter ;
-- 2. Modify the insert procedure to ensure the employee’s age must be between 18 and 60.
      -- If not, display a message: "Invalid age, employee not added."
      delimiter //
create procedure insertemployee_agecheck(
    in pid int,
    in pname varchar(50),
    in page int,
    in psalary decimal(10,2),
    in pdesignation varchar(30),
    in paddress varchar(100),
    in pdate date
)
begin
    if page between 18 and 60 then
        insert into employee values(pid, pname, page, psalary, pdesignation, paddress, pdate);
    else
        select 'invalid age, employee not added.' as message;
    end if;
end //
delimiter ;
-- 3. Create a procedure that inserts a new employee record.
          -- If the salary is not provided, assign a default salary of 20000.
          delimiter //
create procedure insertemployee_defaultsalary(
    in pid int,
    in pname varchar(50),
    in page int,
    in psalary decimal(10,2),
    in pdesignation varchar(30),
    in paddress varchar(100),
    in pdate date
)
begin
    if psalary is null then
        set psalary = 20000.00;
    end if;
    insert into employee values(pid, pname, page, psalary, pdesignation, paddress, pdate);
end //
delimiter ;
-- 4. Write a procedure that inserts three new employee records in a single procedure using multiple INSERT statements.
delimiter //
create procedure insert_multiple_employees()
begin
    insert into employee values(111,'vikram',24,50000.00,'developer','hebbal','2022-10-12');
    insert into employee values(112,'kavya',22,30000.00,'analyst','banashankari','2023-04-05');
    insert into employee values(113,'rohit',26,40000.00,'tester','yeshwanthpur','2021-09-09');
end //
delimiter ;
-- B.  Update Procedure
/*
Update Salary:
Write a stored procedure named UpdateSalary to update an employee’s salary based on their empid.

Increment Salary by Percentage:
Create a procedure to increase the salary by 10% for all employees whose designation = 'Manager'.

Update Designation:
Write a procedure to update the designation of an employee by empid.
Example: Promote an employee from 'Clerk' to 'Senior Clerk'.

Update Address:
Write a procedure to update the address of an employee when empid is given as input.

Conditional Update (Age Check):
Create a procedure that updates salary only if the employee’s age > 40; otherwise, print "Not eligible for salary update."

*/
-- 1.
delimiter //
create procedure updatesalary(in pid int, in newsalary decimal(10,2))
begin
    update employee set salary = newsalary where empid = pid;
end //
delimiter ;
-- 2.
delimiter //
create procedure increment_manager_salary()
begin
    update employee set salary = salary * 1.10 where designation = 'manager';
end //
delimiter ;
-- 3
delimiter //
create procedure updatedesignation(in pid int, in newdesig varchar(30))
begin
    update employee set designation = newdesig where empid = pid;
end //
delimiter ;
-- 4
delimiter //
create procedure updateaddress(in pid int, in newaddr varchar(100))
begin
    update employee set address = newaddr where empid = pid;
end //
delimiter ;
-- 5
delimiter //
create procedure updatesalary_agecheck(in pid int, in newsalary decimal(10,2))
begin
    declare age_val int;
    select age into age_val from employee where empid = pid;
    if age_val > 40 then
        update employee set salary = newsalary where empid = pid;
    else
        select 'not eligible for salary update.' as message;
    end if;
end //
delimiter ;
-- C. Delete Procedure
/*
Delete by empid:
Write a stored procedure named DeleteEmployee to delete an employee record using their empid.

Delete by Designation:
Create a procedure that deletes all employees belonging to a specific designation (e.g., 'Intern').

Delete Based on Salary Range:
Write a procedure to delete employees whose salary is less than ₹15000.

Delete by Joining Year:
Write a procedure to delete employees who joined before the year 2015.
*/
-- 1
delimiter //
create procedure deleteemployee(in pid int)
begin
    delete from employee where empid = pid;
end //
delimiter ;
-- 2
delimiter //
create procedure deletebydesignation(in pdesig varchar(30))
begin
    delete from employee where designation = pdesig;
end //
delimiter ;
-- 3
delimiter //
create procedure delete_lowsalary()
begin
    delete from employee where salary < 15000;
end //
delimiter ;
-- 4
delimiter //
create procedure delete_oldemployees()
begin
    delete from employee where year(date_of_join) < 2015;
end //
delimiter ;
-- End of Lab Experiment 
-- Upload the Completed worksheet in the google classroom with file name USN _ LabExperiment01