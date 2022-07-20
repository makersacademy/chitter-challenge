-- Connect to psql
-- You should already have a database called chitter; 
-- Connect to the database using the pqsl command \c chitter;
-- Run the query below:

CREATE TABLE chitter_users(
  id SERIAL PRIMARY KEY,
  chitterer VARCHAR(255),
  email VARCHAR(255),
  handle VARCHAR(255),
  username VARCHAR(255),
  password VARCHAR(255)
);
