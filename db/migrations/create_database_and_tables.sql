CREATE DATABASE chitter_manager;
CREATE TABLE peeps(id SERIAL PRIMARY KEY, text VARCHAR(140), handle VARCHAR(50), user_name VARCHAR(60));
ALTER TABLE peeps ADD time_posted TIMESTAMP;
CREATE TABLE sign_up (id SERIAL PRIMARY KEY, email VARCHAR(80), password VARCHAR(70), user_name VARCHAR(80), handle VARCHAR(50));

CREATE DATABASE chitter_manager_test;
CREATE TABLE peeps(id SERIAL PRIMARY KEY, text VARCHAR(140), handle VARCHAR(50), user_name VARCHAR(60));
ALTER TABLE peeps ADD time_posted TIMESTAMP;
CREATE TABLE sign_up (id SERIAL PRIMARY KEY, email VARCHAR(80), password VARCHAR(70), user_name VARCHAR(80), handle VARCHAR(50));



