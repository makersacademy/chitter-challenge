CREATE TABLE peep(peep_id SERIAL PRIMARY KEY, content VARCHAR(160), submission_time TIMESTAMP, user_id integer REFERENCES users (id));
