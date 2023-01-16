DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username text,
    password text,
    user_email text
);
TRUNCATE TABLE users RESTART IDENTITY;

INSERT INTO users ("username", "password", "user_email") VALUES
('Roger', 'blueskie5', 'roger@yahoo.com'),
('Oana', 'password1!', 'oana@gmail.com'),
('Matthew', '!@£QWELCOME', 'matt@hotmail.com'),
('Irene', 'yellow', 'irene@outlook.com');
