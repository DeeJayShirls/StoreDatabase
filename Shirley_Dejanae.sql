-- Dejanae Shirley
-- 041068775

-- creates the database called store
CREATE DATABASE Store;

-- creates the product types table
CREATE TABLE product_types (
id int PRIMARY KEY AUTO_INCREMENT ,
name varchar (50)
);
-- creates the products table
CREATE TABLE products(
id int PRIMARY KEY AUTO_INCREMENT ,
description varchar(75) NOT NULL,
price decimal (6,2),
product_types_id int,
FOREIGN KEY (product_types_id) REFERENCES product_types (id)

);
-- creates the customers table
CREATE TABLE customers (
id int PRIMARY KEY AUTO_INCREMENT,
name varchar (50) NOT NULL ,
email varchar (150),  
phone_number varchar (20),
street_address varchar (50),
city varchar (30),
province char (2) ,
postal_code char (6) 
);

-- creates the orders table
CREATE TABLE orders (
id int PRIMARY KEY AUTO_INCREMENT,
order_date datetime,
constraint customersFK FOREIGN KEY (id) REFERENCES customers (id)
);
-- creates the order lines table
CREATE TABLE order_lines (
orders_id int NOT NULL,
products_id int NOT NULL,
PRIMARY KEY (orders_id,products_id) ,
FOREIGN KEY (orders_id) REFERENCES orders (id),
FOREIGN KEY (products_id) REFERENCES products (id),
quantity int,
price decimal (6,2),
line_total decimal (8,2)
);
-- adds data to the customers table
INSERT INTO customers 
(name , email, phone_number, street_address, city, province, postal_code)
VALUES
('Max Stella', 'maxstella33@hotmail.com', '9856678549', '2354 Rural Retreat', 'New York', 'CN', 'V3Y5C7'),
('Declan Kane', 'kanedeclan@gmail.com', '5322489756', '678 Church Street', 'Florida', 'BC', 'A6U7D3'),
('Alex Volkov', 'allvolkov@gmail.com', '2566348975', '996 Kostin Road', 'Boston', 'KH', 'R2T5H6'),
('River Wild', 'wildriver@gmail.com', '356348975', '9877 Wellingston Street', 'Manchester', 'VA', 'O8U1G2'),
('Archer Hale', 'halearch@gmail.com', '3598754556', '2311 Bridget Isle', 'Trelawny', 'EW', 'D8N1J9');
-- adds the different product types to the table
INSERT INTO product_types 
(name)
VALUES
('Software'),
('Hardware'),
('Service');

-- inserts data into the products table
INSERT INTO products 
( description ,product_types_id)
VALUES
('Windows','1'),
('Visual Studio', '1'),
('Mouse', '2'),
('Keyboard', '2'),
('Technical Assistance', '3'),
('Computer Training', '3');

-- changes the phone number of one customer
UPDATE customers
SET phone_number = '8387379456'
WHERE name = 'Max Stella' ;

-- changes the postal code of a city in the customers table
UPDATE customers
SET postal_code = 'E7F2J4'
WHERE name ='Archer Hale' ;

-- deletes the product type software form the table
DELETE FROM product_types 
WHERE name = 'Software' ;