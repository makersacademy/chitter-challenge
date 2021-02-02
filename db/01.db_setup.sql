CREATE DATABASE chitter;
CREATE DATABASE chitter_test;

\c chitter;
CREATE TABLE peeps (id SERIAL PRIMARY KEY, content VARCHAR(140)); 

\c chitter_test;
CREATE TABLE peeps (id SERIAL PRIMARY KEY, content VARCHAR(140));
