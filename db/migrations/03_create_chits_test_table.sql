-- Connect to psql
-- Create the database using the psql command CREATE DATABASE chitter_test;
-- Connect to the database using the pqsl command \c chitter_test;
-- Run the query we have saved in the file 03_create_chits_test_table.sql

CREATE TABLE chits(id SERIAL PRIMARY KEY, chit VARCHAR(255));
