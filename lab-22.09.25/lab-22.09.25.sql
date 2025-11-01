-- Lab Experiment 05: To implement different types of joins: Inner Join, Outer Join (Left, Right, Full), and Natural Join.

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- STUDENT NAME: Hemasai C
-- USN: 1RUA24BCA0033
-- SECTION: 
-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;

-- Write your code below this line along with the output 
-- 'root@localhost', 'RVU-PC-003', '8.4.6', '2025-09-22 06:01:26'

-- table 01: Customers
create database customer;
use customer;
-- CREATE  a TABLE named Customers (customer_id INT PRIMARY KEY,customer_name VARCHAR(50),city VARCHAR(50)
Create table Customers(cust_id int primary key,Name varchar(50),City varchar(50));
-- insert 5 records
insert into Customers values(1,"Nandan","Kolar"),
(2,"Yashwanth P V","Bangalore"),
(3,"Harshitha H","Bidadi"),
(4,"Pruthvi","Bangalore"),
(5,"Shishir","Bangalore");
select * from Customers;
-- TABLE:02 Orders Table

-- CREATE a TABLE named Orders (order_id INT PRIMARY KEY,customer_id INT foreign key,product_name VARCHAR(50),order_date DATE,
    -- insert 5 records
create table Orders(order_id int primary key,cust_id int,product_name varchar(50),order_date date,
foreign key (cust_id) references Customers(cust_id));

-- TASK FOR STUDENTS 
insert into Orders values(1,2,"iphone 16","2025-09-20"),(2,2,"Samsung S24","2025-09-21"),(3,1,"POCO x4","2025-09-21"),(4,3,"iphone 15","2025-09-22"),(5,4,"Dell Laptop","2025-09-25");
select * from Orders;
-- Write and Execute Queries
/*
1. Inner Join – 
   Find all orders placed by customers from the city "Bangalore."
   List all customers with the products they ordered.
   Show customer names and their order dates.
   Display order IDs with the corresponding customer names.
   Find the number of orders placed by each customer.
   Show city names along with the products ordered by customers.
*/
-- orders placed by customers from the city "Bangalore."
SELECT c.Name, o.product_name
FROM Customers c
INNER JOIN Orders o ON c.cust_id = o.cust_id
WHERE c.city = 'Bangalore';

-- customers with the products they ordered.
SELECT c.Name, o.product_name
FROM Customers c
INNER JOIN Orders o ON c.cust_id = o.cust_id;

-- customer names and their order dates.
SELECT c.Name,o.order_date
FROM Customers c
INNER JOIN Orders o ON c.cust_id = o.cust_id;

-- order IDs with the corresponding customer names.
select c.Name,o.order_id
from Customers c
inner join Orders o on c.cust_id = o.cust_id;

-- number of orders placed by each customer.
select c.name, count(o.order_id) as total_orders
from customers c
inner join orders o on c.cust_id = o.cust_id
group by c.name;

-- city names along with the products ordered by customers.
select c.City,o.product_name
from Customers c
inner join orders o on c.cust_id = o.cust_id;

/* 
2  Left Outer Join – 
    Find all customers and their orders, even if a customer has no orders.
    List all customers and the products they ordered.
    Show customer IDs, names, and their order IDs.
    Find the total number of orders (if any) placed by each customer.
    Retrieve customers who have not placed any orders.
	Display customer names with their order dates.
-- Write your code below this line along with the output 
*/
-- all customers and their orders
select c.name, o.product_name
from customers c
left join orders o on c.cust_id = o.cust_id;

-- customer ids, names, and their order ids
select c.cust_id, c.name, o.order_id
from customers c
left join orders o on c.cust_id = o.cust_id;

-- total number of orders per customer
select c.name, count(o.order_id) as total_orders
from customers c
left join orders o on c.cust_id = o.cust_id
group by c.name;

-- customers who have not placed any orders
select c.name
from customers c
left join orders o on c.cust_id = o.cust_id
where o.order_id is null;

-- customer names with their order dates
select c.name, o.order_date
from customers c
left join orders o on c.cust_id = o.cust_id;
 
/* 3: Right Outer Join – 
      Find all orders and their corresponding customers, even if an order doesn't have a customer associated with it.
      Show all orders with the customer names.
      Display product names with the customers who ordered them.
	  List order IDs with customer cities.
      Find the number of orders per customer (include those without orders).
	  Retrieve customers who do not have any matching orders.
     Write your code below this line along with the output 
 */
 -- all orders and their customers
select o.order_id, c.name
from customers c
right join orders o on c.cust_id = o.cust_id;

-- show all orders with customer names
select o.product_name, c.name
from customers c
right join orders o on c.cust_id = o.cust_id;

-- list order ids with customer cities
select o.order_id, c.city
from customers c
right join orders o on c.cust_id = o.cust_id;

-- number of orders per customer
select c.name, count(o.order_id) as total_orders
from customers c
right join orders o on c.cust_id = o.cust_id
group by c.name;

/* 4: Full Outer Join – 
        Find all customers and their orders, including those customers with no orders and orders without a customer.
        List all customers and products, whether they placed an order or not.
        Show customer IDs with order IDs (include unmatched ones).
		Display customer names with order dates.
		Find all unmatched records (customers without orders and orders without customers).
        Show customer cities with products.
     Write your code below this line along with the output 
  */   
  -- all customers and their orders
select c.name, o.product_name
from customers c
left join orders o on c.cust_id = o.cust_id
union
select c.name, o.product_name
from customers c
right join orders o on c.cust_id = o.cust_id;

-- customer ids with order ids
select c.cust_id, o.order_id
from customers c
left join orders o on c.cust_id = o.cust_id
union
select c.cust_id, o.order_id
from customers c
right join orders o on c.cust_id = o.cust_id;

-- unmatched records
select c.name, o.product_name
from customers c
left join orders o on c.cust_id = o.cust_id
where o.order_id is null
union
select c.name, o.product_name
from customers c
right join orders o on c.cust_id = o.cust_id
where c.cust_id is null;

   -- 5: Natural Join – 
--           Find all orders placed by customers.
--           List all customers with the products they ordered using NATURAL JOIN.
--           Show customer names along with their order dates using NATURAL JOIN.
--           Find all customer cities and the products ordered by those customers using NATURAL JOIN.

--      Write your code below this line along with the output 
-- all orders placed by customers
select *
from customers
natural join orders;

-- customers with the products they ordered
select name, product_name
from customers
natural join orders;

-- customer names with order dates
select name, order_date
from customers
natural join orders;

-- customer cities with products
select city, product_name
from customers
natural join orders;

  
  -- END OF THE EXPERIMENT