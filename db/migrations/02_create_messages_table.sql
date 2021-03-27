CREATE TABLE messages (
  id SERIAL PRIMARY KEY,
  content VARCHAR(2000),
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP::TIMESTAMP(0)
);

CREATE OR REPLACE VIEW view_messages AS 
  SELECT m.*, u.name, u.username
  FROM messages m
  LEFT JOIN users u
  ON m.user_id = u.id;