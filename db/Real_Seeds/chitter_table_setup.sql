CREATE TABLE users (
                       id SERIAL PRIMARY KEY,
                       email VARCHAR,
                       username VARCHAR,
                       fullname text,
                       password VARCHAR
                   );

CREATE TABLE peeps (
                       id SERIAL PRIMARY KEY,
                       message VARCHAR(160),
                       timestamp TIMESTAMP,
                       user_id int,
                       constraint fk_user foreign key(user_id)
                           references users(id)
                           on delete cascade
                   );