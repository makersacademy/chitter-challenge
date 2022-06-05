-- Connect to psql
-- Create the database using the psql command CREATE DATABASE chitter_users_test;
-- Connect to the database using the pqsl command \c chitter_users_test;
-- Run the query we have saved in the file 04_create_chitter_users_test_table.sql

CREATE TABLE chitter_users(
  id SERIAL PRIMARY KEY,
  chitterer VARCHAR(255),
  email VARCHAR(255),
  handle VARCHAR(255),
  username VARCHAR(255),
  password VARCHAR(255)
);
