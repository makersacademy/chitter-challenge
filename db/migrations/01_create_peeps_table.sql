CREATE TABLE peeps(id SERIAL PRIMARY KEY, peep VARCHAR(200), created_at TIMESTAMP, maker integer REFERENCES users(id) );
ALTER TABLE peeps ALTER COLUMN created_at SET DEFAULT now();
