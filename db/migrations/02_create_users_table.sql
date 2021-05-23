CREATE TABLE users
(
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(20),
  last_name VARCHAR(20),
  username VARCHAR(15) UNIQUE,
  email VARCHAR(50) UNIQUE,
  password VARCHAR(50)
); 
