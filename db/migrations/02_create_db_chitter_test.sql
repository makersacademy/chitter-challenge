CREATE DATABASE chitter_test;
\c chitter_test;
CREATE TABLE details (id SERIAL PRIMARY KEY, email VARCHAR(60), password VARCHAR(60), name VARCHAR(60), username VARCHAR(60));
