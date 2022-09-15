TRUNCATE TABLE users, peeps RESTART IDENTITY;

INSERT INTO users ("email", "password", "name", "username") VALUES
('fake1@fake.com', 'PASSWORD1', 'Michael Smith', 'MSTheKING'),
('fake2@fake.com', 'PASSWORD2', 'Danny Martin', 'AFGdan'),
('fake3@fake.com', 'PASSWORD3', 'Phil Mitchell', 'EEmitchell');

INSERT INTO peeps ("content", "peep_time", "user_id") VALUES
('What a day, hit 2 180s', '2022-09-15 11:41:22', 1),
('Cup of tea, 2 sugars', '2022-09-14 10:32:02', 1),
('Whats for tea?', '2022-08-20 18:15:48', 1),
('Morning at the beach', '2022-09-15 10:11:54', 2),
('Anyone want breakfast?', '2022-09-15 08:28:30', 2),
('Whos up?', '2022-09-12 01:41:22', 2),
('Buzzing for football this weekend', '2022-09-11 11:41:22', 2),
('Need a dirty cafe', '2022-09-15 11:44:22', 3),
('Cant believe pub isnt open yet', '2022-09-15 09:14:22', 3),
('Hungry.', '2022-09-15 11:37:22', 3);