CREATE DATABASE chitter;
\c chitter
CREATE TABLE users (id SERIAL PRIMARY KEY, username VARCHAR(60), email VARCHAR(60), password VARCHAR(60), full_name VARCHAR(60));
CREATE TABLE peeps (id SERIAL PRIMARY KEY, body VARCHAR(280), time_date_form TIMESTAMPTZ);
CREATE TABLE feed (id SERIAL PRIMARY KEY, user_id INTEGER, peep_id INTEGER);
