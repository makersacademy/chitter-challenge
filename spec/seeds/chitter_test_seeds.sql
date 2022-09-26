TRUNCATE TABLE users, peeps RESTART IDENTITY;

INSERT INTO users (email, name, username, password) VALUES
('chris@test.com', 'Christopher', 'chris97', 'zxcvb_123'),
('emma@test.com', 'Emma', 'emma08', 'asdfg@456'),
('amelia@test.com', 'Amelia', 'amelia15', 'qwerty#789');

INSERT INTO peeps (content, post_time, user_id) VALUES
('content1', '2022-05-10 10:50:55', 2),
('content2', '2022-06-23 04:20:35', 3),
('content3', '2022-09-18 08:14:25', 1),
('content4', '2022-09-19 02:30:10', 3);

