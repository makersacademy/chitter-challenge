CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  name VARCHAR(60),
  username VARCHAR(25),
  email_address VARCHAR(60),
  password VARCHAR(140),
  UNIQUE (username, email_address)
);

-- User is the parent table, peeps is the child
