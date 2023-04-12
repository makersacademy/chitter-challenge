DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email text,
  username text,
  password text
);

TRUNCATE TABLE users RESTART IDENTITY;

INSERT INTO users(email, username, password) VALUES
('sunaina.d.rishi@gmail.com', 'sunnyd', 'SunnyD');