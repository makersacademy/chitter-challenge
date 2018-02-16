CREATE DATABASE peeps;
CREATE TABLE peeps (
    id SERIAL PRIMARY KEY,
    peep VARCHAR(144),
    author VARCHAR(60)
);
