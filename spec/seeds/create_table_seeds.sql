DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name text,
    username text,
    email text,
    password text
);

DROP TABLE IF EXISTS peeps;

CREATE TABLE peeps (
    id SERIAL PRIMARY KEY,
    time TIMESTAMP,
    content text,
    user_id int,
    constraint fk_user foreign key(user_id)
        references users(id)
        on delete cascade
);
