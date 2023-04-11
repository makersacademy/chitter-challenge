DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name text,
    username text,
    email text,
    password text
);

TRUNCATE TABLE users RESTART IDENTITY;

INSERT INTO users ("name", "username", "email", "password") VALUES
('Alice Smith', 'malice12', 'alice.smith@gmail.com', 'password'),
('Bobby Blake', 'mrbobby', 'mrbobby@gmail.com', 'secret');
