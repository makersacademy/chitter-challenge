TRUNCATE TABLE users, peeps RESTART IDENTITY;

INSERT INTO users ("email", "password", "name", "username") VALUES
('fake1@fake.com', 'PASSWORD1', 'Dave Smith', 'DVS123'),
('fake2@fake.com', 'PASSWORD2', 'Abby Martin', 'am44'),
('fake3@fake.com', 'PASSWORD3', 'Pete Mitchell', 'PM1986');

INSERT INTO peeps ("content", "peep_time", "user_id") VALUES
('Hello', '2022-09-15 11:41:22', 1),
('Hi', '2022-09-14 10:32:02', 1),
('Hola', '2022-08-20 18:15:48', 1),
('Bonjour', '2022-09-15 10:11:54', 2),
('Ciao', '2022-09-15 08:28:30', 2),
('Guten Tag', '2022-09-12 01:41:22', 2),
('Ni Hao', '2022-09-11 11:41:22', 2),
('Konnichiwa', '2022-09-15 11:44:22', 3),
('Yasou', '2022-09-15 09:14:22', 3),
('Shalom', '2022-09-15 11:37:22', 3);