CREATE DATABASE chitter;
\c chitter;
CREATE TABLE peeps (id serial PRIMARY KEY, message VARCHAR (140), posted_at TIMESTAMP);
CREATE DATABASE chitter_test;
\c chitter_test;
CREATE TABLE peeps (id serial PRIMARY KEY, message VARCHAR (140), posted_at TIMESTAMP);
