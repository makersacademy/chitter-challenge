-- Connect to psql
-- Create the database using the psql command CREATE DATABASE chitter;
-- Connect to the database using the pqsl command \c chitter;
-- Run the query we have saved in the file 01_create_chits_table.sql

CREATE TABLE chits(id SERIAL PRIMARY KEY, content VARCHAR(255),
handle VARCHAR (255),
timestamp VARCHAR(255),
);
