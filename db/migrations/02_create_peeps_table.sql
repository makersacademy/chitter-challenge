CREATE TABLE peeps(peepId SERIAL PRIMARY KEY, userId integer REFERENCES users(userId), timestamp TIMESTAMP, content VARCHAR(140), threadPeep VARCHAR(140));
