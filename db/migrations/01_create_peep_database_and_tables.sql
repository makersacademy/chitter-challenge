CREATE DATABASE peep_manager;
CREATE DATABASE peep_manager_test;
CREATE TABLE users (id SERIAL PRIMARY KEY, name VARCHAR(30), username VARCHAR(30), email VARCHAR(60), password VARCHAR(100));
CREATE TABLE peeps (id SERIAL PRIMARY KEY, content VARCHAR(240), user_id INTEGER REFERENCES users (id), time_created TIME);
