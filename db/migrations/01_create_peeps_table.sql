CREATE DATABASE chitter
CREATE TABLE peeps(id SERIAL PRIMARY KEY, name VARCHAR(60), username VARCHAR(60), message VARCHAR(200), time TIMESTAMP DEFAULT CURRENT_TIMESTAMP)