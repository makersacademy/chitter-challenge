CREATE DATABASE chitter_manager;
CREATE TABLE peeps(id SERIAL PRIMARY KEY, text VARCHAR(140), handle VARCHAR(50), user_name VARCHAR(60));
ALTER TABLE peeps ADD time_posted TIMESTAMP;
CREATE DATABASE chitter_manager_test;
CREATE TABLE peeps(id SERIAL PRIMARY KEY, text VARCHAR(140), handle VARCHAR(50), user_name VARCHAR(60));
ALTER TABLE peeps ADD time_posted TIMESTAMP;



