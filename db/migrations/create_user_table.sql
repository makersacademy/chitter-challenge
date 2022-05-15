-- Connect to psql
-- Create the database using the psql command CREATE DATABASE chitter;
-- Connect to the database using the pqsl command \c chitter;
-- Run the query we have saved in the file 01_create_chits_table.sql

CREATE TABLE chitter_users(
  id SERIAL PRIMARY KEY,
  hitterer VARCHAR(255),
  email VARCHAR(255),
  handle VARCHAR(255),
  username VARCHAR(255),
  password VARCHAR(255)
);
