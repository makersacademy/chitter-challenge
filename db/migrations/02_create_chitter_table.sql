CREATE TABLE all_peeps(id SERIAL PRIMARY KEY, peep_text VARCHAR(100), time TIMESTAMP, user_id INTEGER REFERENCES all_users (id));
