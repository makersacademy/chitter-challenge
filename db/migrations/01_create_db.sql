CREATE DATABASE "chitter";
\c chitter;
CREATE TABLE peeps (id SERIAL PRIMARY KEY, peep VARCHAR(280));
