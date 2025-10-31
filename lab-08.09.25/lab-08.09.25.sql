-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Lab Experiment 03: Implementation of different types of SQL functions.

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- STUDENT NAME: Hemasai C
-- SECTION: BCA
-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;

-- Paste the Output below by execution of above command
-- 'root@localhost', 'RVU-PC-003', '8.4.6', '2025-09-08 11:30:30'

create database company;
use company;
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- PreCoded Relational Schema and Instance.
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- 1. create a table named Employee with EmpID ,FirstName,LastName Salary BirthDate HireDate 
create table Employee(EmpID varchar(10) Primary key,FirstName varchar(20),LastName varchar(20),Salary int,Birthdate date,Hiredate date);
desc Employee;
-- 2. Insert 10 records to employee;
insert into Employee values("A001","Sai","Ram",100000,"2005-03-30","2025-07-23");
insert into Employee values("A002","John","Smith",10000,"2003-03-30","2025-07-24");
insert into Employee values("A003","Nandan","J",300000,"2004-11-19","2025-07-20");
insert into Employee values("A004","Yashwanth","P V",200000,"2006-05-03","2025-07-19");
insert into Employee values("A005","Pruthvi","Gowda",200000,"2006-11-16","2025-07-23");
insert into Employee values("A006","Neha","Kiran",500000,"2003-01-18","2025-07-25");
insert into Employee values("A007","Harshitha","H",100000,"2005-11-11","2025-07-20");
insert into Employee values("A008","Sharon","Arlin",300000,"2005-10-08","2025-07-20");
insert into Employee values("A009","Shishir","Bhandari",400000,"2006-10-02","2025-07-23");
insert into Employee values("A010","Manoj","B",600000,"2005-09-03","2025-07-23");
select * from Employee;
-- 3. create a table named Orders with OrderID , OrderDate, totalAmount, EmpID(foreign key)  
create table Orders(OrderID varchar(20) Primary key,OrderDate date,totalamount int,EmpID varchar(10),Foreign key(EmpID) references Employee(EmpID));
desc Orders;
-- 4. Insert 10 records to Orders
insert into Orders values("AA2025","2025-07-20",2000,"A004");
insert into Orders values("AA2002","2025-07-21",34000,"A001");
insert into Orders values("AA2025","2025-07-20",2000,"A004");
insert into Orders values("AA2112","2025-07-28",8500,"A010");
insert into Orders values("AA1223","2025-07-27",98000,"A006");
insert into Orders values("AA0029","2025-07-22",7000,"A001");
insert into Orders values("AA3322","2025-07-26",3000,"A003");
insert into Orders values("AA2222","2025-07-21",45000,"A002");
insert into Orders values("AA6025","2025-07-19",100,"A008");
insert into Orders values("AA5555","2025-07-27",5666,"A005");

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Print the Information of the Employee and Order Table. [ Hint: SELECT * FROM TABLENAME ]
-- Write the SQL Query below this line.
select * from Employee;
select * from Orders;



-- Output: 
-- 'A001', 'Sai', 'Ram', '100000', '2005-03-30', '2025-07-23'
-- 'A002', 'John', 'Smith', '10000', '2003-03-30', '2025-07-24'
-- 'A003', 'Nandan', 'J', '300000', '2004-11-19', '2025-07-20'
-- 'A004', 'Yashwanth', 'P V', '200000', '2006-05-03', '2025-07-19'
-- 'A005', 'Pruthvi', 'Gowda', '200000', '2006-11-16', '2025-07-23'
-- 'A006', 'Neha', 'Kiran', '500000', '2003-01-18', '2025-07-25'
-- 'A007', 'Harshitha', 'H', '100000', '2005-11-11', '2025-07-20'
-- 'A008', 'Sharon', 'Arlin', '300000', '2005-10-08', '2025-07-20'
-- 'A009', 'Shishir', 'Bhandari', '400000', '2006-10-02', '2025-07-23'
-- 'A010', 'Manoj', 'B', '600000', '2005-09-03', '2025-07-23'

-- 'AA0029', '2025-07-22', '7000', 'A001'
-- 'AA1223', '2025-07-27', '98000', 'A006'
-- 'AA2002', '2025-07-21', '34000', 'A001'
-- 'AA2020', '2025-07-25', '2000', 'A005'
-- 'AA2025', '2025-07-20', '2000', 'A004'
-- 'AA2112', '2025-07-28', '8500', 'A010'
-- 'AA2222', '2025-07-21', '45000', 'A002'
-- 'AA3322', '2025-07-26', '3000', 'A003'
-- 'AA5555', '2025-07-27', '5666', 'A005'
-- 'AA6025', '2025-07-19', '100', 'A008'



-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Number Functions Section
-- ------------------------------------------------------------
/* a. Round Salaries: Round employee salaries to nearest integer */
select round(Salary) AS ROUNDSALARY from Employee;

-- Output: 
-- '10000'
-- '100000'
-- '100000'
-- '200000'
-- '200000'
-- '300000'
-- '300000'
-- '400000'
-- '500000'
-- '600000'

/* b. Absolute Values: Show absolute values of salaries */
select abs(Salary) AS Absolutesalary from Employee;
-- Output: 
-- '100000'
-- '10000'
-- '300000'
-- '200000'
-- '200000'
-- '500000'
-- '100000'
-- '300000'
-- '400000'
-- '600000'

/* c. Ceiling Values: Get ceiling values of order amounts */
select ceiling(totalamount) as ceilingvalue from Orders;
-- Output: 
-- 7000
-- 98000
-- 34000
-- 2000
-- 2000
-- 8500
-- 45000
-- 3000
-- 5666
-- 100
-- ------------------------------------------------------------
-- Aggregate Functions Section
-- ------------------------------------------------------------
/* a. Count of Employees: Find total number of employees */
SELECT COUNT(*) AS EmployeeCount FROM Employee;
-- Output: 
-- '10'

/* b. Sum of Salaries: Calculate total salary expense */
select sum(Salary) from Employee;
-- Output: 
-- 2710000
/* c. Average Order Amount: Find average order value */
select AVG(totalamount) as Averageorderamount from Orders;
-- Output: 
-- 20526.6000
/* d. Max/Min Salary: Find highest and lowest salaries */
select max(Salary) as maximumsalary from Employee;
select min(Salary) as minimumsalary from Employee;
-- Output: 
-- max_salary='600000'
-- min_salary='10000'

-- ------------------------------------------------------------
-- Character Functions Section
-- ------------------------------------------------------------
/* a. Case Conversion: Show names in uppercase and lowercase */
select upper(FirstName) as Uppercase from Employee;
select lower(FirstName) as Lowercase from Employee;
-- Output: 
-- 'SAI'
-- 'JOHN'
-- 'NANDAN'
-- 'YASHWANTH'
-- 'PRUTHVI'
-- 'NEHA'
-- 'HARSHITHA'
-- 'SHARON'
-- 'SHISHIR'
-- 'MANOJ'

-- 'sai'
-- 'john'
-- 'nandan'
-- 'yashwanth'
-- 'pruthvi'
-- 'neha'
-- 'harshitha'
-- 'sharon'
-- 'shishir'
-- 'manoj'


/* b. Concatenate Names: Create full names */
select concat(FirstName,LastName) as fullname from Employee;
-- Output: 
-- 'SaiRam'
-- 'JohnSmith'
-- 'NandanJ'
-- 'YashwanthP V'
-- 'PruthviGowda'
-- 'NehaKiran'
-- 'HarshithaH'
-- 'SharonArlin'
-- 'ShishirBhandari'
-- 'ManojB'

/* c. Extract Substring: Get first 3 characters of first names */

-- Output: 

-- ------------------------------------------------------------
-- Conversion Functions Section
-- ------------------------------------------------------------
/* Convert String to Date: Convert text to DATE type */

-- Output: 

-- ------------------------------------------------------------
-- Date Functions Section
-- ------------------------------------------------------------
/* a. Current Date/Time: Get current timestamp */

-- Output: 

/* b. Extract Year: Get year from order dates */

-- Output: 

/* c. Add Months: Add 3 months to order dates */

-- Output: 

/* d. Days Since Order: Calculate days between order date and now */
-- Output: 

-- END of the Task -- 