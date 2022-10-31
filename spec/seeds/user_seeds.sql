DROP TABLE IF EXISTS users;

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    name text,
    username text,
    email text,
    password text
);

TRUNCATE TABLE users RESTART IDENTITY;

INSERT INTO users("name", "username", "email", "password") VALUES
('Tony Stark', 'Iron Man', 'tony@makersacademy.com', '12345678*'),
('Steve Rogers', 'Captain America', 'steve@makersacademy.com', '12345678-'),
('Thor Odinson', 'Thor', 'thor@makersacademy.com', '12345678&');