CREATE DATABASE shop;
USE shop;

CREATE TABLE users (
	id INT NOT NULL AUTO_INCREMENT,
	firstname VARCHAR(45),
	lastname VARCHAR(45),
	login VARCHAR(45) NOT NULL,
	password VARCHAR(45) NOT NULL,
    email VARCHAR(100) NOT NULL,
	city VARCHAR(45),
	voivodeship VARCHAR(45),
	county VARCHAR(45),
	zip_code VARCHAR(45),
	street VARCHAR(45),
	house_number VARCHAR(45),
	apartment_number VARCHAR(45),
	PRIMARY KEY(id)
);

CREATE TABLE product_categories (
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(45) NOT NULL,
	description TEXT,
	PRIMARY KEY(id)
);

CREATE TABLE products (
	id int NOT NULL AUTO_INCREMENT,
	name VARCHAR(100) NOT NULL,
	price INT NOT NULL,
	description TEXT,
	photo VARCHAR(45),
	category_id int NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY(category_id) REFERENCES product_categories (id)
);

CREATE TABLE orders (
	id INT NOT NULL AUTO_INCREMENT,
	order_date Date NOT NULL,
	is_paid BOOLEAN,
	is_done BOOLEAN,
	execute_date Date,
	user_id INT NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY(user_id) REFERENCES users(id)
);

CREATE TABLE ordered_products(
	id INT NOT NULL AUTO_INCREMENT,
	order_id INT NOT NULL,
	product_id INT NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY(order_id) REFERENCES orders(id),
	FOREIGN KEY(product_id) REFERENCES products(id)
);
