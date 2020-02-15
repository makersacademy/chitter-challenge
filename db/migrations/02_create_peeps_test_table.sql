CREATE DATABASE peep_manager_test;
CREATE TABLE peeps(id SERIAL PRIMARY KEY, name VARCHAR(30), username VARCHAR(30), content VARCHAR(150), time TIMESTAMP);
