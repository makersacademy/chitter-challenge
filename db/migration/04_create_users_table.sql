-- for both databases

CREATE TABLE users(id SERIAL PRIMARY KEY, u_name VARCHAR(30), username VARCHAR(50) UNIQUE, u_email VARCHAR(50) UNIQUE, u_password VARCHAR(20));