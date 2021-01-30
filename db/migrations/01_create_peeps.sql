-- Main database/table
CREATE DATABSE "chitter"
CREATE TABLE chitters(id SERIAL PRIMARY KEY, "user" VARCHAR(20), "peep" VARCHAR(100), "time" VARCHAR);
SELECT * FROM chitters 

-- Test database/table 
CREATE DATABASE "chitter_test"
CREATE TABLE chitters(id SERIAL PRIMARY KEY, "user" VARCHAR(20), "peep" VARCHAR(100), "time" VARCHAR);
