-- Main database/table
CREATE DATABSE "chitter"
CREATE TABLE chitters(id SERIAL PRIMARY KEY, "peep" VARCHAR(100), "time" VARCHAR);
ALTER TABLE chitters
ADD "user_details" INTEGER REFERENCES users (id);
CREATE TABLE users(id SERIAL PRIMARY KEY, "email" VARCHAR(60), "password" VARCHAR(140), "name" VARCHAR(60), "username" VARCHAR(60));

-- Test database/table 
CREATE DATABASE "chitter_test"
CREATE TABLE chitters(id SERIAL PRIMARY KEY, "peep" VARCHAR(100), "time" VARCHAR);
ALTER TABLE chitters
ADD "user_details" INTEGER REFERENCES users (id);
CREATE TABLE users(id SERIAL PRIMARY KEY, "email" VARCHAR(60), "password" VARCHAR(140), "name" VARCHAR(60), "username" VARCHAR(60));
