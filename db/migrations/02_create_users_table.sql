CREATE TABLE users (
  id SERIAL PRIMARY KEY, 
  user_name VARCHAR(255) NOT NULL UNIQUE,
  email VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL
);

INSERT INTO users (user_name, password, email) VALUES ('test_name', 'test_email@test.com', '12345678');
