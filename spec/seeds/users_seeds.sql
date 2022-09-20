DROP TABLE IF EXISTS users; 

-- Table Definition
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name text,
    username text,
    email text,
    password text
);

TRUNCATE TABLE users RESTART IDENTITY;

INSERT INTO users ("name", "username", "email", "password") VALUES
('name1', 'username1', 'fake@email1.com', 'password1'),
('name2', 'username2', 'fake@email2.com', 'password2')



