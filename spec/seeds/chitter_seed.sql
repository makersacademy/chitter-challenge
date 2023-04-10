TRUNCATE TABLE users, peeps, notifications RESTART IDENTITY;

INSERT INTO users (username, email, password_hash)
VALUES
  ('alice', 'alice@example.com', 'abc123'),
  ('bob', 'bob@example.com', 'xyz789'),
  ('charlie', 'charlie@example.com', '123456');

INSERT INTO peeps (content, created_at, user_id)
VALUES
  ('Hello, world!', '2022-04-09 10:00:00', 1),
  ('This is a test peep', '2022-04-09 11:00:00', 2),
  ('I love Chitter!', '2022-04-09 12:00:00', 3),
  ('Just finished a long day at work', '2022-04-10 09:00:00', 1),
  ('Can''t wait for the weekend', '2022-04-10 10:00:00', 2),
  ('Going to the beach tomorrow', '2022-04-10 11:00:00', 3);

INSERT INTO notifications (user_id, peep_id, created_at)
VALUES
  (1, 2, '2022-04-09 11:30:00'),
  (2, 3, '2022-04-09 12:30:00'),
  (3, 1, '2022-04-09 13:30:00'),
  (1, 5, '2022-04-10 10:30:00'),
  (2, 6, '2022-04-10 11:30:00');