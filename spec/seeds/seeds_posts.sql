-- Drop the table if it exists
DROP TABLE IF EXISTS posts;

-- Create the table
CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  message TEXT,
  timestamp TIMESTAMP,
  user_id INTEGER
);

-- Truncate the table and reset the auto-incrementing ID
TRUNCATE TABLE posts RESTART IDENTITY;

-- Insert data into the table
INSERT INTO posts ("message", "timestamp", "user_id") VALUES
  ('Friends don''t lie', '2023-01-08 12:05:06', 1),
  ('Ahoy, ladies. Didn''t see you there', '2023-01-08 09:05:06', 5),
  ('You''re all so nerdy, it makes me physically ill', '2023-01-07 16:24:06', 6),
  ('Okay, it''s official, I''m never having kids', '2023-01-08 21:09:06', 3),
  ('Mike, don''t stop, okay? You''re the heart', '2023-01-07 15:11:06', 4),
  ('If anyone asks where I am, I''ve left the country!', '2023-01-09 11:11:06', 2),
  ('Eggos, eggos, eggos', '2023-01-07 12:22:06', 1),
  ('We''re not even in the game; we''re on the bench.', '2023-01-09 15:11:06', 2);
