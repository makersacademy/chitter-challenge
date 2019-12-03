CREATE TABLE users(id SERIAL PRIMARY KEY,username varchar(60) NOT NULL UNIQUE, email varchar(60) NOT NULL UNIQUE, name varchar(100), password varchar(140));
