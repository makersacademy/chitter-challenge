CREATE TABLE users(
  user_id serial PRIMARY KEY,
  user_name VARCHAR(50) NOT NULL,
  user_handle VARCHAR(50) UNIQUE NOT NULL,
  email VARCHAR(350) UNIQUE NOT NULL,
  password VARCHAR(50) NOT NULL,
  created_at TIMESTAMP NOT NULL);

INSERT INTO users(user_name, user_handle, email, password, created_at)
  VALUES('Debbie Handler', 'The Real Debs', 'debbie@test.com', 'dkfg14', NOW()),
  ('Joan Peeler', 'JoJo', 'jojo@test.com', 'j450pl', NOW());
