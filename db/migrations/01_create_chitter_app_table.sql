CREATE DATABASE chitter_app;
CREATE TABLE peeps(id SERIAL PRIMARY KEY, peep VARCHAR(60) NOT NULL, created_on VARCHAR(10), user_id integer NOT NULL);
-- CREATE TABLE peeps(id SERIAL PRIMARY KEY, peep VARCHAR(60) NOT NULL, created_on TIMESTAMP NOT NULL, user_id integer NOT NULL);