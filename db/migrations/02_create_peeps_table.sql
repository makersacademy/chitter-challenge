CREATE TABLE peeps ( id SERIAL PRIMARY KEY, peep VARCHAR(241), created_at TIMESTAMP DEFAULT NOW(), user_id INTEGER REFERENCES users (id));