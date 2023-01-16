TRUNCATE TABLE peeps RESTART IDENTITY;

INSERT INTO peeps ("message", "time", "account_id") VALUES
('Today will be a good day', '09:15', 1),
('I am bored who is out?', '11:30', 3),
('Arsenal playing, buzzing!', '15:10', 2),
('Twisted my ankle today :(', '18:45', 1),
('Good win!', '22:00', 2);