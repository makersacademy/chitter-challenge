TRUNCATE TABLE peeps RESTART IDENTITY;

INSERT INTO peeps ("username", "comment", "time") VALUES
('user_01', 'Hello world', '2022/04/12 00:14:00'),
('user_01', 'This is awesome!', '2022/04/12 00:14:45'),
('user_01', 'Bored.', '2022/04/12 00:56:57');