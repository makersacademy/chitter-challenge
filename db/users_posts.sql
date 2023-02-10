DROP TABLE IF EXISTS users, posts;

CREATE TABLE users
(
    id            SERIAL PRIMARY KEY,
    email         text UNIQUE,
    password_hash text,
    name          text,
    username      text UNIQUE
);

CREATE TABLE posts
(
    id        SERIAL PRIMARY KEY,
    content   text,
    timestamp timestamp,
    user_id   int,
    constraint fk_user foreign key (user_id)
        references users (id)
        on delete cascade
);


