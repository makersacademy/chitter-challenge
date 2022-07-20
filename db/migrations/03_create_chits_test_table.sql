-- Connect to psql
-- Create the test database using the psql command CREATE DATABASE chitter_test;
-- Connect to the database using the pqsl command \c chitter_test;
-- Run the query below to create the chits table;

CREATE TABLE chits (id SERIAL PRIMARY KEY, content VARCHAR(255),
handle VARCHAR (255), 
timestamp VARCHAR(255)
);
