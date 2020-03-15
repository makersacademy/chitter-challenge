CREATE TABLE users(id SERIAL PRIMARY KEY, name VARCHAR(15) not null, username VARCHAR(15) not null unique, email TEXT not null unique, password VARCHAR(15) not null);
