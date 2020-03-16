CREATE TABLE peeps(peep_id SERIAL PRIMARY KEY, peep VARCHAR(250), created_on TIMESTAMP DEFAULT NOW(), user_id INTEGER REFERENCES users (user_id));
