CREATE TABLE peeps (id SERIAL PRIMARY KEY, peep VARCHAR(255) UNIQUE NOT NULL, created_on TIMESTAMP NOT NULL);