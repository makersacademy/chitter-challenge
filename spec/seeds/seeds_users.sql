DROP TABLE IF EXISTS users; 

-- Table Definition
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name text,
  username text,
  email text,
  password text
);

TRUNCATE TABLE users RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO users ("name", "username", "email", "password") VALUES
('Jane Hopper', 'Biokinesis', 'eleven@strangerthings.com', 'IloveMike11'),
('Mike Wheeler', 'D&D', 'mike@strangerthings.com', 'IloveEl'),
('Dustin Henderson', 'Demogorgan', 'dustin@strangerthings.com', 'DArtagnan'),
('Will Byers', 'MindFlayer', 'will@strangerthings.com', 'Tunne1s'),
('Steve Harrington', 'BaseballBat', 'steve@strangerthings.com', 'Nancy123'),
( 'Erica Sinclair', 'Boffin', 'erica@strangerthings.com)', 'LucasisStupid!');