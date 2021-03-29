CREATE DATABASE "chitter_test";

\c chitter_test;

CREATE TABLE users
(
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(20),
    password VARCHAR(140),
    email VARCHAR(30)
);

CREATE TABLE peeps
(
    peep_id SERIAL PRIMARY KEY,
    message VARCHAR(512),
    user_id integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT peeps_one_author FOREIGN KEY (user_id)
        REFERENCES users (user_id) MATCH SIMPLE
);

CREATE TABLE tags
(
    tag_id SERIAL PRIMARY KEY,
    user_id integer,
    peep_id integer,
    CONSTRAINT peep_id FOREIGN KEY (peep_id)
        REFERENCES peeps (peep_id) MATCH SIMPLE,
    CONSTRAINT tagged_user FOREIGN KEY (user_id)
        REFERENCES users (user_id) MATCH SIMPLE
);
