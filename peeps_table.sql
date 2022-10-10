CREATE TABLE peeps (
    id SERIAL PRIMARY KEY,
    message text,
    tag text,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    user_id int
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email text,
    password text
);
