DROP TABLE IF EXISTS users CASCADE; 

-- Table Definition
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email text ,
  pass_word text, 
  username text ,
  full_name text 
);

TRUNCATE TABLE users RESTART IDENTITY;

INSERT INTO users ("email", "pass_word", "username", "full_name") VALUES
('giorgio@gmail.com', 'password78', 'gggio', 'giorgio george'),
('harold@hotmail.com', 'wordpass321', 'harryh', 'harold harrington'),
('fifi@outlook.com', 'fifi98', 'fifi', 'ophelia offing')


