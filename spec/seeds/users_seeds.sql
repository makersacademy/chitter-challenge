DROP TABLE IF EXISTS users;

-- Table Definition
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name text,
  email varchar
  
);

TRUNCATE TABLE users RESTART IDENTITY;

INSERT INTO users (name, email) VALUES 
('sara', 'sara@gmail.com'),
('amir', 'amir@gmail.com');
