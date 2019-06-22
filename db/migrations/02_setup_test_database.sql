CREATE DATABASE chitter_test;
\c chitter_test
CREATE TABLE peeps(id SERIAL PRIMARY KEY, content VARCHAR(140));
