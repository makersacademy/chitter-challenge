CREATE DATABASE "chitter_manager_test";
\c chitter_manager_test;
CREATE TABLE peeps(id SERIAL PRIMARY KEY, url VARCHAR(120));