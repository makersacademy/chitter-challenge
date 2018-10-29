#databas name
CREATE DATABASE chitter;

#Create chitter test dabatbase:
CREATE DATABASE chitter_test;

CREATE TABLE peeps(id SERIAL PRIMARY KEY, user VARCHAR(60), content VARCHAR(140), created_at TIMESTAMP DEFAULT Now());

CREATE TABLE users(id SERIAL PRIMARY KEY, name VARCHAR(30), email VARCHAR(60), username VARCHAR(30), password VARCHAR(60));
