DROP TABLE IF EXISTS makers; 

-- Table Definition
CREATE TABLE makers(
  id SERIAL PRIMARY KEY,
  name text,
  username text,
  email text,
  password text
);

TRUNCATE TABLE makers RESTART IDENTITY;

INSERT INTO makers (id, name, username, email, password) VALUES
(1, 'Rose Tree', 'petal1', 'rose@petal.com', 'bumbleb33'),
INSERT INTO makers (id, name, username, email, password) VALUES
(2, 'Graham Fillmore', 'Jazziman', 'GF@eastwest.com', '43770');




