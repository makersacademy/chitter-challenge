-- -- peeps table
CREATE TABLE peeps(id SERIAL PRIMARY KEY, peep VARCHAR(100));
-- -- comments table
CREATE TABLE comments(id SERIAL PRIMARY KEY, text VARCHAR(240), peep_id INTEGER REFERENCES peeps (id));
-- -- users table
CREATE TABLE chitter_users(id SERIAL PRIMARY KEY, email VARCHAR(60), password VARCHAR(140));
-- CREATE TABLE peeps (id SERIAL PRIMARY KEY, username VARCHAR(60), peep VARCHAR(100), data DATE);

-- -- test database

-- CREATE DATABASE chitter_test WITH OWNER faryahussain ENCODING 'UTF8';

-- CREATE TABLE peeps_test (id SERIAL PRIMARY KEY, username VARCHAR(60), peep VARCHAR(100), data DATE);