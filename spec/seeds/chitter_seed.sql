TRUNCATE TABLE users, peeps, notifications RESTART IDENTITY;

INSERT INTO users (name, username, email, password_hash)
VALUES
  ('Donald', 'orangeman', 'donald@example.com', '$2a$12$DZagv8/ATHdJDawRjWGs8O2GO5AG/CgvbwgddzVakqQhXcM8Cw512'),
  ('Elon', 'manchild', 'elon@example.com', '$2a$12$9kXkcQYCUa9m3MObwyb9Eey0GE2T8tEzJnzDo2BD.tb/Ojoq3ft2S'),
  ('Gandalf', 'ringofpower', 'gandalf@example.com', '$2a$12$VACYIR4w6GnPOeYQk3W6au7lkssN2mGOSCsql899i3KjKN6qhs1Ba');

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

  -- donald abc123
  -- elon xyz789
  -- gandalf 123456