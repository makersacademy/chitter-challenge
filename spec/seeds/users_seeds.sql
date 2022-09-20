DROP TABLE IF EXISTS users cascade;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email text,
    password text,
    name text,
    username text
);

TRUNCATE TABLE users RESTART IDENTITY;

INSERT INTO users ("email", "password", "name", "username") VALUES
('fake1@fake.com', 'PASSWORD1', 'Dave Smith', 'DVS123'),
('fake2@fake.com', 'PASSWORD2', 'Abby Martin', 'am44'),
('fake3@fake.com', 'PASSWORD3', 'Pete Mitchell', 'PM1986');