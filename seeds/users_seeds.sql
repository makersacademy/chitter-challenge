DROP TABLE IF EXISTS users CASCADE; 

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name text,
    username text,
    password text,
    email text
);

TRUNCATE TABLE users RESTART IDENTITY;

INSERT INTO users ("name", "username", "password", "email") VALUES
('Joe Osborne', 'Tardigrade_77', 'Hello123!', 'joeosborne77@gmail.com'),
('Petyr Baelish', 'enemyNo1', 'LittleFinger123!', 'peter@gmail.com');
