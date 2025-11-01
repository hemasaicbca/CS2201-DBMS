create database library;
use library;
create table Books(BookID int primary key,Title varchar(20),Author varchar(20),price int,PublishDate date);
insert into Books values(101,"The Alchemist","Paulo Coelha",350,"2010-06-15");
insert into Books values(102,"Atomic Habits","James Clear",450,"2018-10-16");
insert into Books values(103,"Clean Code","Robert Martin",550,"2008-08-01");
insert into Books values(104,"Think like a Monk","Jay Shetty",400,"2020-09-08");
insert into Books values(105,"Python crash course","Eric Matthes",500,"2019-05-10");

create table Customers(CustID int primary key,Name varchar(20),Email varchar(50),Purchasedate date);
insert into Customers values(201,"Arjun Rao","Arjun@gmail.com","2021-02-10");
insert into Customers values(202,"Priya Nair","priya@gmail.com","2020-07-25");
insert into Customers values(203,"John Smith","john@gmail.com","2022-01-14");
insert into Customers values(204,"Maria Lopez","maria@gmail.com","2019-11-30");

create table Orders(OrderID int primary key,CustID int,BookID int,OrderDate date,Quantity int,
foreign key (CustID) references Customers(CustID),
foreign key (BookID) references Books(BookID));

insert into Orders values(301,201,102,"2022-03-05",2);
insert into Orders values(302,202,101,"2021-09-12",1);
insert into Orders values(303,203,104,"2022-05-20",3);
insert into Orders values(304,204,104,"2020-12-25",1);
insert into Orders values(305,201,103,"2021-11-18",1);


-- Display all in uppercase
select upper(Name) from Customers as uppercase;
-- Output:
# upper(Name)
-- 'ARJUN RAO'
-- 'PRIYA NAIR'
-- 'JOHN SMITH'
-- 'MARIA LOPEZ'

-- display all in lowercase
select lower(Name) from Customers as lowercase;
-- Output
# lower(Name)
-- 'arjun rao'
-- 'priya nair'
-- 'john smith'
-- 'maria lopez'

-- first 3 letters of book title
select left(Title,3) from Books as firstletters;
-- Output
# left(Title,3)
-- 'The'
-- 'Ato'
-- 'Cle'
-- 'Thi'
-- 'Pyt'

-- email domain
select right(Email,9) from Customers as Email;
-- Output
# right(Email,9)
-- 'gmail.com'
-- 'gmail.com'
-- 'gmail.com'
-- 'gmail.com'

-- length of book title
select length(Title) from Books as length;
-- Output
# length(Title)
-- '13'
-- '13'
-- '10'
-- '17'
-- '19'

-- concatenate author and book
select concat(Title," , ",Author) from Books as author_book;
-- Output
# concat(Title," , ",Author)
-- 'The Alchemist , Paulo Coelha'
-- 'Atomic Habits , James Clear'
-- 'Clean Code , Robert Martin'
-- 'Think like a Monk , Jay Shetty'
-- 'Python crash course , Eric Matthes'

-- book title starting with a
select Title from Books where Author like "%a";
-- Output
# Title
-- 'The Alchemist'

-- Published years
select Title,extract(Year from PublishDate) as publishyear from Books;
-- output
# Title, publishyear
-- 'The Alchemist', '2010'
-- 'Atomic Habits', '2018'
-- 'Clean Code', '2008'
-- 'Think like a Monk', '2020'
-- 'Python crash course', '2019'

-- Joined month
select Name,extract(month from PurchaseDate) as datejoined from Customers;
-- output
# Name, datejoined
-- 'Arjun Rao', '2'
-- 'Priya Nair', '7'
-- 'John Smith', '1'
-- 'Maria Lopez', '11'

-- 2021 joined
select Name from Customers where year(PurchaseDate)=2021;
-- output
# Name
-- 'Arjun Rao'

-- day name on which each order was placed
select dayname(OrderDate) from Orders as Orderday;
-- output
# dayname(OrderDate)
-- 'Saturday'
-- 'Sunday'
-- 'Friday'
-- 'Friday'
-- 'Thursday'

-- age of books
SELECT TIMESTAMPDIFF(YEAR, PublishDate, CURDATE()) AS BookAge FROM Books;
-- output
# BookAge
-- '15'
-- '6'
-- '17'
-- '5'
-- '6'

-- no of days of customer join date
SELECT Name, DATEDIFF(CURDATE(), PurchaseDate) AS DaysSinceJoin FROM Customers;
# Name, DaysSinceJoin
-- 'Arjun Rao', '1680'
-- 'Priya Nair', '1880'
-- 'John Smith', '1342'
-- 'Maria Lopez', '2118'

-- orders placed in December
SELECT * FROM Orders WHERE MONTH(OrderDate) = 12;
# OrderID, CustID, BookID, OrderDate, Quantity
-- '304', '204', '104', '2020-12-25', '1'


-- Total no of books available
SELECT COUNT(*) AS TotalBooks FROM Books;
# TotalBooks
-- '5'


-- Average Price
SELECT AVG(Price) AS AvgPrice FROM Books;
# AvgPrice
-- '450.0000'

-- Min and Max
SELECT MAX(Price) AS MaxPrice, MIN(Price) AS MinPrice FROM Books;
# MaxPrice, MinPrice
-- '550', '350'

-- Customers joined after 2020
SELECT COUNT(*) AS CustomersAfter2020 FROM Customers WHERE YEAR(PurchaseDate) > 2020;
# CustomersAfter2020
-- '2'

-- Total books ordered
SELECT SUM(Quantity) AS TotalBooksOrdered FROM Orders;
# TotalBooksOrdered
-- '8'

-- Total quantity ordered per customer
SELECT CustID, SUM(Quantity) AS TotalQty FROM Orders GROUP BY CustID;
# CustID, TotalQty
-- '201', '3'
-- '202', '1'
-- '203', '3'
-- '204', '1'

-- Average order quantity per book
SELECT BookID, AVG(Quantity) AS AvgQty FROM Orders GROUP BY BookID;
# BookID, AvgQty
-- '101', '1.0000'
-- '102', '2.0000'
-- '103', '1.0000'
-- '104', '2.0000'


-- Book with highest total ordered
SELECT BookID, SUM(Quantity) AS TotalQty
FROM Orders
GROUP BY BookID
ORDER BY TotalQty DESC
LIMIT 1;

# BookID, TotalQty
-- '104', '4'

-- Revenue generated per book
SELECT Books.Title, SUM(Orders.Quantity * Books.Price) AS Revenue
FROM Orders, Books
WHERE Orders.BookID = Books.BookID
GROUP BY Books.Title;
# Title, Revenue
-- 'Atomic Habits', '900'
-- 'The Alchemist', '350'
-- 'Think like a Monk', '1600'
-- 'Clean Code', '550'


-- Total orders placed each year
SELECT YEAR(OrderDate), COUNT(*)
FROM Orders
GROUP BY YEAR(OrderDate);
# YEAR(OrderDate), COUNT(*)
-- '2022', '2'
-- '2021', '2'
-- '2020', '1'

