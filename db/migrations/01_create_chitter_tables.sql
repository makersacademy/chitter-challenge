CREATE TABLE users(id SERIAL PRIMARY KEY, username VARCHAR(12), email VARCHAR(24), password VARCHAR(128));
CREATE TABLE peeps(id SERIAL PRIMARY KEY, poster_id INTEGER references users(id) DEFAULT 1, peep_content VARCHAR(160), posted_at TIMESTAMP);
