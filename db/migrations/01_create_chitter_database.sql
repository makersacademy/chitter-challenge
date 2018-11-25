-- #Development database:
CREATE DATABASE chitter
CREATE TABLE peeps(id SERIAL PRIMARY KEY, date varchar, username varchar, context varchar, time varchar);
CREATE TABLE users(id SERIAL PRIMARY KEY, email varchar, password varchar);

-- #Test database:
CREATE DATABASE chitter_test
CREATE TABLE peeps(id SERIAL PRIMARY KEY, date varchar, username varchar, context varchar, time varchar);
CREATE TABLE users(id SERIAL PRIMARY KEY, email varchar, password varchar);
