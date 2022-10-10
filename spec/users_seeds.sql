DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name text,
  username text,
  email varchar,
  password text
);

TRUNCATE TABLE users,peeps RESTART IDENTITY;


INSERT INTO users ("name", "username", "email", "password") VALUES
('Hibaq', 'Hibaq123', 'hibaq@gmail.com','potatolife'),
('Anna', 'Anna123', 'Anna@gmail.com','Userlife123'),
('James', 'James123', 'Zara@gmail.com','Welcometo'),
('Mary', 'Mary123', 'David@gmail.com','New_password'),
('Alan', 'Alan123', 'Jerry@gmail.com','Rhianna');