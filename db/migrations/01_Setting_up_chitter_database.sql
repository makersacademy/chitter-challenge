#Create chitter database:
CREATE DATABASE chitter;
\c chitter

#Create chitter test dabatbase:
CREATE DATABASE chitter_test;

#Create user table chitter database & test database:
CREATE TABLE users(id SERIAL PRIMARY KEY, name VARCHAR(30), email VARCHAR(30), username VARCHAR(20), password VARCHAR(20));

#Create peep table chitter database & test database:
#NEEDS EDITS - TIMEPOSTED etc.
CREATE TABLE peeps(id SERIAL PRIMARY KEY, text VARCHAR(240), user_id INTEGER REFERENCES users (id));
