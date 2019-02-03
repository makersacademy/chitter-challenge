CREATE DATABASE chitter;
CREATE TABLE peeps(id SERIAL PRIMARY KEY, peeps VARCHAR(60));
ALTER TABLE peeps ADD COLUMN timestamp timestamp with time zone;
CREATE TABLE users (id SERIAL PRIMARY KEY, email VARCHAR(60), password VARCHAR(140));