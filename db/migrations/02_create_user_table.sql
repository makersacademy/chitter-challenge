-- Connect to psql
-- You should already have a database called chitter; 
-- Connect to the database using the pqsl command \c chitter;
-- Run the query below:

CREATE TABLE chitter_users(
  id SERIAL PRIMARY KEY,
  chitterer VARCHAR(255) UNIQUE,
  email VARCHAR(255) UNIQUE,
  handle VARCHAR(255) UNIQUE,
  username VARCHAR(255) UNIQUE,
  password VARCHAR(255)
);

-- note to self, use the UNIQUE keyword to prevent duplication of certain fields
-- you can also alter the table later to add uniqueness to specific columns
