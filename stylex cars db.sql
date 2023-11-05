									   /*Task 1 - Create a database and use it */
                                       
  create database stylexcars_db;
  use stylexcars_db
  									 /*Task 2 - Creating multiple tables in the database*/
                                     
create table salespersons(salespersonid int primary key ,salesperson_name varchar(50),salesperson_city varchar(50),commission_rate int not null);
create table customers(customer_id int primary key ,c_firstname varchar(50) ,c_lastname varchar(50) ,c_city varchar(50) ,c_rating int not null);
create table orders(orderid int primary key ,amount int not null ,order_date date not null ,salesperson_id int not null ,customer_id int not null);
desc salespersons;
desc customers;
desc orders;
									 /*Task 3 - Adding the values to all the tables in the database*/
                                     
INSERT INTO salespersons (salespersonid, salesperson_name, salesperson_city, commission_rate) VALUES 
    (1001, 'William', 'New York', 12),
    (1002, 'Liam', 'New Jersey', 13),
    (1003, 'Axelrod', 'San Jose', 10),
    (1004, 'James', 'San Diego', 11),
    (1005, 'Fran', 'Austin', 26),
    (1007, 'Oliver', 'New York', 15),
    (1008, 'John', 'Atlanta', 2),
    (1009, 'Charles', 'New Jersey', 2);
select * from salespersons;
INSERT INTO customers (customer_id, c_firstname, c_lastname, c_city, c_rating) VALUES 
    (2001, 'Hoffman', 'Anny', 'New York', 1),
    (2002, 'Giovanni', 'Jenny', 'New Jersey', 2),
    (2003, 'Liu', 'Williams', 'San Jose', 3),
    (2004, 'Grass', 'Harry', 'San Diego', 3),
    (2005, 'Clemens', 'John', 'Austin', 4),
    (2006, 'Cisneros', 'Fanny', 'New York', 4),
    (2007, 'Pereira', 'Jonathan', 'Atlanta', 3);
select * from customers;
INSERT INTO orders (orderid, amount, order_date, salesperson_id, customer_id) VALUES 
    (3001, 23, '2020-02-01', 1009, 2007),
    (3002, 20, '2021-02-23', 1007, 2007),
    (3003, 89, '2021-03-06', 1002, 2002),
    (3004, 67, '2021-04-02', 1004, 2002),
    (3005, 30, '2021-07-30', 1001, 2007),
    (3006, 35, '2021-09-18', 1001, 2004),
    (3007, 19, '2021-10-02', 1001, 2001),
    (3008, 21, '2021-10-09', 1003, 2003),
    (3009, 45, '2021-10-10', 1009, 2005);
select * from orders;

						/*Task 4 - Update the commission_rate to 15 to those who have commission_rate less than 15*/

set sql_safe_updates=0;
UPDATE salespersons
SET commission_rate = 15
WHERE commission_rate < 15;
select * from salespersons;

                                      /*Task 5 - Creating backup table for the orders table*/
                                   
create table orders_bkp like orders;
insert into orders_bkp select * from orders;
select * from orders_bkp;                                   

					/*Task 6 - Increasing the rating by 3 points to those customers who placed an order more than once*/
                    
set sql_safe_updates=0;
UPDATE customers
SET c_rating = c_rating + 3
WHERE customer_id IN (2002, 2007);
select * from customers;    