-- Reset identity for all tables
TRUNCATE TABLE users, peeps, replies, tags, peep_tags RESTART IDENTITY;

-- Insert test data into the users table
INSERT INTO users (email, password, name, username)
VALUES
  ('testuser1@example.com', 'password123', 'Test User 1', 'testuser1'),
  ('testuser2@example.com', 'password456', 'Test User 2', 'testuser2');

-- Insert test data into the peeps table
INSERT INTO peeps (content, timestamp, user_id)
VALUES
  ('Hello, this is my first peep!', NOW(), 1),
  ('I love Chitter!', NOW(), 2),
  ('Having a great day!', NOW(), 1);

-- Insert test data into the replies table
INSERT INTO replies (content, timestamp, user_id, peep_id)
VALUES
  ('That sounds awesome!', NOW(), 2, 1),
  ('Me too!', NOW(), 1, 2),
  ('Glad to hear that!', NOW(), 2, 3);

-- Insert test data into the tags table
INSERT INTO tags (name)
VALUES
  ('technology'),
  ('coding'),
  ('fun');

-- Insert test data into the peep_tags table
INSERT INTO peep_tags (peep_id, tag_id)
VALUES
  (1, 1),
  (1, 2),
  (2, 3),
  (3, 2),
  (3, 3);
