DROP TABLE IF EXISTS followers;
DROP TABLE IF EXISTS peeps;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username VARCHAR(50) NOT NULL UNIQUE,
  email VARCHAR(200) NOT NULL UNIQUE,
  password_digest VARCHAR(60) NOT NULL
);

CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  text TEXT NOT NULL,
  user_id INTEGER NOT NULL REFERENCES users(id),
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE followers (
  id SERIAL PRIMARY KEY,
  follower_id INTEGER NOT NULL REFERENCES users(id),
  following_id INTEGER NOT NULL REFERENCES users(id)
);


-- Insert some users
INSERT INTO users (username, email,password_digest) VALUES
  ('alice', 'alice@gmail.com', 'password_hash_for_alice'),
  ('bob', 'bob@gmail.com', 'password_hash_for_bob'),
  ('charlie', 'charlie@gmail.com','password_hash_for_charlie');

-- Insert some peeps
INSERT INTO peeps (text, user_id, created_at) VALUES
  ('Hello, starting my chitter:)!', 1, NOW()),
  ('Just finished my first marathon!', 2, NOW() - INTERVAL '1 day'),
  ('Excited to start my new job tomorrow', 3, NOW() - INTERVAL '2 days');

-- Insert some follower relationships
INSERT INTO followers (follower_id, following_id) VALUES
  (1, 2),
  (2, 3),
  (3, 1);