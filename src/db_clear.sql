DROP DATABASE IF EXISTS fornitureworker;
CREATE DATABASE fornitureworker;
USE fornitureworker;


CREATE table users (
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	jwt varchar(512) NOT NULL,
	login varchar(255) NOT NULL,
	name varchar(255) NOT NULL,
	date_created date,
	role int(10) NOT NULL,
	description text(1000),
	active boolean NOT NULL
);


-- Testing data for users' table
-- UNIQUE CODE ID: '_' + Math.random().toString(36).substr(2, 9) + '-' + Math.random().toString(36).substr(2, 9)
-- insert into users (id, jwt, login, name, date_created, role, description, active) 
-- values(NULL, "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsb2dpbiI6ImFkbWluIiwicGFzc3dvcmQiOiJhZG1pbiIsImlhdCI6MTYyOTY0NDIwN30.ABUcGSsB1zqxBOKUlcTY4C5_JLEmtnht6dCLfZGM4oE", "admin", "Данилут", "2021-08-16", 0, "Hello!", 1);


create table production_order (
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_fc int NOT NULL,
	hash varchar(255) NOT NULL,
	name varchar(255),
	count int NOT NULL,
	week int NOT NULL,
	material varchar(255),
	color varchar(255),
	year int,
	status varchar(255),
	date_created date,
	description text(1000),
	id_added_user int NOT NULL
);



create table fillfulment_control_order (
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_fc int not null,
	hash varchar(255) NOT NULL,
	week int not null,
	site_name varchar(255),
	date_order varchar(255),
	client_phone varchar(255) NOT NULL,
	client_name varchar(255),
	client_address varchar(255),
	price float(10, 2),
	status varchar(255),
	paid float(10, 2),
	debt float(10, 2),
	date_created date,
	year int,

	-- additional info
	delivery boolean NOT NULL default 0,
	assembly boolean NOT NULL default 0,
	entering boolean NOT NULL default 0,
	assemblyAndEntering boolean NOT NULL default 0,

	delivery_price float(10, 2) default 0,
	assembly_price float(10, 2) default 0,
	entering_price float(10, 2) default 0,
	assemblyAndEntering_price float(10, 2) default 0
);




create table invoices (
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_fc int not null,
	hash varchar(255) NOT NULL,
	week int not null,
	site_name varchar(255),
	date_order varchar(255),
	client_phone varchar(255) NOT NULL,
	client_name varchar(255),
	client_address varchar(255),
	price float(10, 2),
	status varchar(255),
	paid float(10, 2),
	deliver_back boolean,
	date_created date,
	year int,

	-- additional info
	delivery boolean NOT NULL default 0,
	assembly boolean NOT NULL default 0,
	entering boolean NOT NULL default 0,
	assemblyAndEntering boolean NOT NULL default 0,

	delivery_price float(10, 2) default 0,
	assembly_price float(10, 2) default 0,
	entering_price float(10, 2) default 0,
	assemblyAndEntering_price float(10, 2) default 0
);



create table invoice_orders (
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_fc int NOT NULL,
	id_iv int NOT NULL,
	hash varchar(255) NOT NULL,
	name varchar(255),
	count int NOT NULL,
	week int NOT NULL,
	material varchar(255),
	color varchar(255),
	price float(10, 2),
	allPrice float(10, 2)
);



create table forming_number_order(
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	week int,
	count int,
	year int
);


create table colors(
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	color varchar(100)
);

create table materials(
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	material varchar(100)
);