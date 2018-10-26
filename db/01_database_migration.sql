CREATE DATABASE chitter;
CREATE DATABASE chitter_test;
\c chitter
CREATE TABLE users(first_name VARCHAR, last_name VARCHAR, email VARCHAR, username VARCHAR, user_id SERIAL PRIMARY KEY);
CREATE TABLE peeps(user_id INT4, content VARCHAR, time TIMESTAMP, post_id SERIAL PRIMARY KEY);
