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
('fake1@fake.com', 'PASSWORD1', 'Michael Smith', 'MSTheKING'),
('fake2@fake.com', 'PASSWORD2', 'Danny Martin', 'AFGdan'),
('fake3@fake.com', 'PASSWORD3', 'Phil Mitchell', 'EEmitchell');