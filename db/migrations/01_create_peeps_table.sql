CREATE DATABASE chitter;
\c chitter2;
CREATE TABLE peeps (id serial PRIMARY KEY, message VARCHAR (140), posted_at TIMESTAMP);
CREATE DATABASE chitter_test;
\c chitter_test2;
CREATE TABLE peeps (id serial PRIMARY KEY, message VARCHAR (140), posted_at TIMESTAMP);
