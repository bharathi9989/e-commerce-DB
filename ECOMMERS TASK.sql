create database if not exists ECOMMERCE_TASK; -- create database
show databases;
use ECOMMERCE_TASK;		-- use database

-- create customer table
create table customers(
id int auto_increment primary key, -- Unique id for each customers
name varchar(100),  -- customers name
email varchar(100), -- customers email
adderss varchar(300) -- customers address
);

alter table customers change adderss address varchar(300);
show tables;
-- Create products table
create table products(
id int auto_increment primary key,
name varchar(100),
price decimal(10,2),
description varchar(300)
);

-- create Order table
create table orders(
id int auto_increment primary key,
customer_id int,
order_date date,
total_amount decimal(10,2),
foreign key (customer_id) references customers(id)
);

-- insert sample datas in customers table

insert into customers (name,email,address) values
('velu','velu@gmail.com','kallakurichi'),
('bharathi','bharathi@gmail.com','chinnasalem'),
('prajna','prajna@gmail.com','udupi');

select * from customers;

--  insert sample datas in products table

insert into products (name,price,description) values
('product X',50.00,'description1 X'),
('product Y',100.00,'description Y'),
('product Z',150.00,'description Z');

select * from products;

insert into orders (customer_id,order_date,total_amount) values
(1,'2025-09-01',100.00),
(2,'2025-09-02',200.00),
(3,'2025-09-01',300.00);

select * from orders;


-- Quaries

-- 1. Retrieve all customers who have placed an order in the last 30 days.
select *
 from customers as cus
 join orders as ord
 on cus.id = ord.customer_id
 where ord.order_date >= curdate() - interval 30 day;
 -- 2. Get the total amount of all orders placed by each customer.
 
 select cus.name, sum(ord.total_amount) as total_spent_amount
 from customers as cus
 join orders as ord
 on cus.id =ord.customer_id 
 group by cus.id;
 
 -- 3. Update the price of Product C to 45.00.
 
 update products 
 set price = 45.00
 where name = 'product Z';
 SET SQL_SAFE_UPDATES = 0;
 
 show tables;
 select * from products;
 
 -- Actually in the task i had to create Product A,B,C but I created Prduct X,Y,Z instead and then i changed them again to A,B,C
 
 update products 
 set name = case name
 when 'product X' then 'product A'
 when 'product Y' then 'product B'
 when 'product Z' then 'product C'
 else name
 end;
 
 -- Description 
 
 update products 
 set description = case description
 when 'description1 X' then 'description A'
 when 'description Y' then 'description B'
 when 'description Z' then 'description C'
 else description
 end;
 
-- 4.Add a new column discount to the products table.alter

alter table products add discount decimal (5,2);
select * from products;

-- 5.Retrieve the top 3 products with the highest price.
select * from products order by price desc limit 3;

-- 6. Get the names of customers who have ordered Product A.

create table order_items ( -- we need new table for proper Normalization
id int auto_increment primary key,
order_id int,
product_id int,
quantity int,
price decimal(10,2),
foreign key (order_id) references orders(id),
foreign key (product_id) references products(id)
);

select * from order_items;

-- Sample order_items data

insert into order_items(order_id,product_id,quantity,price) values
(1, 1, 2, 60.00),
(2, 2, 1, 50.00),
(3, 3, 3, 120.00);

-- 6. Get the names of customers who have ordered Product A
select distinct cus.name 
from customers as cus 
join orders as ord 
on cus.id =ord.customer_id
join order_items as ord_item
on ord.id = ord_item.order_id
join products on ord_item.product_id = products.id
where products.name = 'products A';

-- 7. Join the orders and customers tables to retrieve the customer's name and order date for each order. 

select cus.name, ord.order_date
from orders as ord
join customers as cus on ord.customer_id = cus.id;
select *from ECOMMERCE_TASK;

-- 8. Retrieve the orders with a total amount greater than 150.00.
select * from orders where total_amount > 150.00;

-- Retrieve the average total of all orders.

select avg(total_amount) as average_order_total
from orders;  			-- avrage_order_total  200.00 


