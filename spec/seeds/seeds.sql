TRUNCATE TABLE peeps, users RESTART IDENTITY;

INSERT INTO users (username, password, email)
VALUES
('Jonas', '1234', 'jonas@makers.com'),
('Anna', '5555', 'anna@makers.com'),
('Phil', '9090', 'phil@makers.com');

INSERT INTO peeps (content, time_posted, user_id) 
VALUES 
('Learning about web apps is so exciting!', '2022-09-10 14:15:00', 1),
('Pairing was really fun today.', '2022-09-13 14:54:45', 2),
('I have just started designing the chitter challenge.', '2022-09-15 09:31:40', 1),
('I am currently working on my solo project.', '2022-09-15 11:03:56', 3);


