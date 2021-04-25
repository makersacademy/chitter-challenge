CREATE DATABASE chitter_test;
CREATE DATABASE chitter;
CREATE TABLE peeps (id SERIAL PRIMARY KEY, content VARCHAR(240), user_id INTEGER REFERENCES users (id), time_created TIME);
CREATE TABLE users (id SERIAL PRIMARY KEY, username VARCHAR(30), email VARCHAR(60), password VARCHAR(100));

