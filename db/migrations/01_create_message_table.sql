run psql
CREATE DATABASE chitter;
\c chitter
CREATE TABLE messages(id SERIAL PRIMARY KEY, message VARCHAR(99), time VARCHAR(60));
