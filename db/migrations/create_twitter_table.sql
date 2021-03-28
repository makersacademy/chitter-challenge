CREATE TABLE twitter(id SERIAL PRIMARY KEY, tweet VARCHAR(240), created_at now());
ALTER TABLE tweets ADD COLUMN created_by INTEGER REFERENCES users;
CREATE TABLE comment(id SERIAL PRIMARY KEY, comment VARCHAR(240), tweet_id INTEGER REFERENCES tweets (id), user_id INTEGER REFERENCES users (id));