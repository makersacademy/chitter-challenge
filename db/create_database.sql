CREATE DATABASE chitter;
CREATE TABLE users(id SERIAL PRIMARY KEY, username VARCHAR(100), password VARCHAR(200));
CREATE TABLE peeps(id SERIAL PRIMARY KEY, peep_content VARCHAR(280), timestamp TIMESTAMP, user_id INTEGER, constraint fk_test foreign key (user_id) REFERENCES users (id));
