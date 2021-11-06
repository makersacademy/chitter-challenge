-- -- peeps table
CREATE TABLE peeps(id SERIAL PRIMARY KEY, peep VARCHAR(100));
-- added timestamp column
ALTER TABLE peeps ADD COLUMN created_at DEFAULT NOW();
-- add user id to peeps
ALTER TABLE peeps ADD COLUMN user_id INTEGER REFERENCES chitter_users (id);
-- -- comments table
CREATE TABLE comments(id SERIAL PRIMARY KEY, text VARCHAR(240), peep_id INTEGER REFERENCES peeps (id));
-- -- users table
CREATE TABLE chitter_users(id SERIAL PRIMARY KEY, email VARCHAR(60), password VARCHAR(140));
-- added username column
ALTER TABLE chitter_users ADD COLUMN username VARCHAR(60);
-- CREATE TABLE peeps (id SERIAL PRIMARY KEY, username VARCHAR(60), peep VARCHAR(100), data DATE);

-- -- test database

-- CREATE DATABASE chitter_test WITH OWNER faryahussain ENCODING 'UTF8';

-- CREATE TABLE peeps_test (id SERIAL PRIMARY KEY, username VARCHAR(60), peep VARCHAR(100), data DATE);