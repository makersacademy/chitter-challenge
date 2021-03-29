CREATE TABLE tweets(id SERIAL PRIMARY KEY, tweet VARCHAR(240), created_at now());
ALTER TABLE tweets ADD COLUMN created_by INTEGER REFERENCES users;
