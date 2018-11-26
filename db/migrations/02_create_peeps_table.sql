CREATE TABLE peeps(id SERIAL PRIMARY KEY, userId integer REFERENCES users(id), timestamp TIMESTAMP, content VARCHAR(140), threadPeep VARCHAR(140));
