CREATE DATABASE chitter;

\c chitter

CREATE TABLE chitter(id SERIAL PRIMARY KEY, user_id VARCHAR(20), peep VARCHAR(250));

