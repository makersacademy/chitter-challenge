CREATE TABLE users(
  id SERIAL PRIMARY KEY, 
  name VARCHAR(60), 
  username VARCHAR(60) CONSTRAINT must_be_unique UNIQUE, 
  email VARCHAR(60) CONSTRAINT must_be_unique UNIQUE, 
  password VARCHAR(140)
  );
