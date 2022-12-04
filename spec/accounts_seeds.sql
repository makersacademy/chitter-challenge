DROP TABLE IF EXISTS accounts CASCADE; 

-- Table Definition
CREATE TABLE accounts (
  id SERIAL PRIMARY KEY,
  email text,
  password text,
  name text,
  username text
);

TRUNCATE TABLE accounts RESTART IDENTITY CASCADE;

INSERT INTO accounts (email, password, name, username) VALUES 
('tom@gmail.com', 'pass1', 'Tom Seleiro', 'TomS'),
('robbie@gmail.com', 'word2', 'Robbie Kirkbride', 'rwmk'),
('shah@gmail.com', '123', 'Shah Hussain', 'SH99'),
('chris@gmail.com', 'password', 'Chris Hutchinson', 'HutchyC');