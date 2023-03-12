TRUNCATE TABLE peeps RESTART IDENTITY;

INSERT INTO peeps ("content", "peep_time", "likes", "user_id") VALUES
('First peep', '2022-03-01 09:02:39', '4', '1'),
('First peep', '2022-06-29 10:03:51', '3', '2'),
('First peep', '2022-07-23 12:04:05', '2', '3'),
('First peep', '2022-09-16 02:05:44', '5', '4'),
('Second peep', '2022-11-23 18:06:27', '1', '1'),
('Second peep', '2022-12-03 22:05:16', '2', '2'),
('Second peep', '2023-01-30 19:09:59', '3', '3'),
('Second peep', '2023-02-12 07:02:12', '7', '4'),
('Third peep', '2023-03-04 12:01:49', '0', '1');