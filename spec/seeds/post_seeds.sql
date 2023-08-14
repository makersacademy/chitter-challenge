DROP TABLE IF EXISTS posts CASCADE;

-- Table Definition
CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  time TIMESTAMP,
  message text,
  user_id int
);

TRUNCATE TABLE posts RESTART IDENTITY;

INSERT INTO posts ("time", "message", "user_id") VALUES
  (CURRENT_TIMESTAMP, 'Hey howre you doing', 1),
  (CURRENT_TIMESTAMP, 'Warm out today', 2),
  (CURRENT_TIMESTAMP, 'Warm out yesterday', 2),
  (CURRENT_TIMESTAMP, 'Coffefe', 3);
