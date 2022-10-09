CREATE TABLE users (
                       id SERIAL PRIMARY KEY,
                       email VARCHAR(120),
                       username VARCHAR(120),
                       fullname text(120),
                       password VARCHAR(120)
);