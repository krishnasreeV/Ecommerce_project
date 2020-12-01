/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  saiv0001
 * Created: Nov 25, 2018
- id,	name,	password,	email,	role.
 */

CREATE TABLE Users(
id INTEGER NOT NULL IDENTITY(1,1),
Name VARCHAR(60) UNIQUE,
Password VARCHAR(60),	
Email VARCHAR(60),
ROLE VARCHAR(10),
PRIMARY KEY(id));

-- INSERT INTO Users VALUES(1, 'admin', 'admin123', 'admin', 'admin');
-- 
-- 	

CREATE TABLE CategoryMaster(
id INTEGER NOT NULL IDENTITY(1,1),
catName VARCHAR(60),
PRIMARY KEY(id));
--  
INSERT INTO  CategoryMaster VALUES ('Apparel');
-- -- ProductMaster	- id,	catId,	name,	brand,	desc,	image,	price.
CREATE TABLE ProductMaster(
id INTEGER NOT NULL IDENTITY(1,1),
catId INTEGER,
name VARCHAR(60),
brand VARCHAR(60),
descreption VARCHAR(60),
image VARCHAR(40),
price INTEGER,
PRIMARY KEY(id),
FOREIGN KEY(catId) REFERENCES  CategoryMaster(id)
);
-- -- 
-- -- BestSelling	- id,	prodId
CREATE TABLE BestSelling(
id INTEGER NOT NULL IDENTITY(1,1),
prodId INTEGER,
PRIMARY KEY(id),
FOREIGN KEY(prodId) REFERENCES  ProductMaster(id)
);
-- -- 
-- -- -- -- 
-- 
-- -- -- CustomerMaster	- id,	email,	password,	name,	mobile,	address.
CREATE TABLE CustomerMaster(
id INTEGER NOT NULL IDENTITY(1,1),
email VARCHAR(60) UNIQUE NOT NULL,
password VARCHAR(60) NOT NULL,
name VARCHAR(60) NOT NULL,
mobile VARCHAR(20) NOT NULL,
address VARCHAR(150) NOT NULL,
PRIMARY KEY(id));
-- 
-- INSERT INTO CustomerMaster VALUES(1,'customer@email.com','customer123','customer','928179184','2jsbchewuhxb');
-- 
-- SELECT * FROM ProductMaster LEFT JOIN CategoryMaster ON  ProductMaster.catId= CategoryMaster.id  WHERE ProductMaster.Id= 2;
-- -- Cart	- id,	custId,	status
CREATE TABLE Cart(
id INTEGER NOT NULL IDENTITY(1,1),
custId INTEGER,
status VARCHAR(10),
PRIMARY KEY(id),
FOREIGN KEY(custId) REFERENCES  CustomerMaster(id)
);


--CartDetails	:	id,	cartId,	prodId,	qty.
CREATE TABLE CartDetails(
id INTEGER NOT NULL IDENTITY(1,1),
cartId INTEGER,
prodId INTEGER,
qty INTEGER,	
PRIMARY KEY(id),
FOREIGN KEY(cartId) REFERENCES  Cart(id);

---------------------------------------------------------------	

