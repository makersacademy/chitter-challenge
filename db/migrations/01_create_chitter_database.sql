CREATE DATABASE chitter
CREATE TABLE peeps(id SERIAL PRIMARY KEY, date varchar, username varchar, context varchar, time varchar);

CREATE DATABASE chitter_test
CREATE TABLE peeps(id SERIAL PRIMARY KEY, date varchar, username varchar, context varchar, time varchar);

-- #In chitter and chitter_test databases:
CREATE TABLE users(id varchar, email varchar, password varchar);
