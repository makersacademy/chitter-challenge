CREATE TABLE users (
id serial,
first_name varchar(50) NOT NULL,
last_name varchar(50) NOT NULL,
username varchar(25) UNIQUE NOT NULL,
email varchar(100) UNIQUE NOT NULL,
password varchar(23) NOT NULL,
PRIMARY KEY (id)
);