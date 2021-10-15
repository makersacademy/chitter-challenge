-- database for development enviroment
CREATE DATABASE chitter;
CREATE TABLE peeps (id SERIAL PRIMARY KEY, name VARCHAR(60), peep VARCHAR(280));
-- database for test enviroment
CREATE DATABASE chitter_test;
CREATE TABLE peeps (id SERIAL PRIMARY KEY, name VARCHAR(60), peep VARCHAR(280));