-- Disable Notice messages in RSpec
SET client_min_messages TO WARNING;

-- Testing seeds
TRUNCATE TABLE users RESTART IDENTITY CASCADE;
TRUNCATE TABLE peeps RESTART IDENTITY;

INSERT INTO users (email, password, name, username) VALUES
  ('email_1@email.com', '$2a$12$YHla9QIlKIi/sC/kf4aIoORjRJR2HfzYVr6d546JJ7BMvV15ZpzpO', 'user_1', 'username_1'),
  ('email_2@email.com', '$2a$12$cZe8SPDM3nanKwHCpUmfx.OIfLhDezopqQRDxYIHJaDzF9t8lhT12', 'user_2', 'username_2'),
  ('email_3@email.com', '$2a$12$X8IqacWC7NXqp7mJUPDcAuWQm4b4BwvezoPksj6h53jF2l7SU0VYi', 'user_3', 'username_3');
  
INSERT INTO peeps (content, creation_time, link_to, user_id) VALUES
  ('content peep 1', '2022-10-24 10:30:21', null, 1),
  ('content peep 2', '2022-10-24 10:31:00', null, 2),
  ('content peep 3', '2022-10-24 10:32:00', null, 3),
  ('content peep 4', '2022-10-24 10:33:00', null, 1),
  ('content peep 5', '2022-10-24 10:34:00', 1, 2),
  ('content peep 6', '2022-10-24 10:35:00', 1, 3);