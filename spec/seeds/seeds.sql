TRUNCATE TABLE peeps, users RESTART IDENTITY;

INSERT INTO users (username, password, email)
VALUES
('Jonas', '$2a$12$xuF9WqcsgH.OiVlBa4W0xenODP5hieD4Eq7rZWtGpnrcAYaToorni', 'jonas@makers.com'),
('Anna', '$2a$12$QsHshHd.2EeO6p24/Dk17upcXC9JtJps9axwAMNygbVLNOUAug4Km', 'anna@makers.com'),
('Phil', '$2a$12$XKI9Fe2.4kt805RUIvtaB.lRwDwAOb4fZzJQLOb1CotRXSSZZGnVu', 'phil@makers.com');

INSERT INTO peeps (content, time_posted, user_id) 
VALUES 
('Learning about web apps is so exciting!', '2022-09-10 14:15:00', 1),
('Pairing was really fun today.', '2022-09-13 14:54:45', 2),
('I have just started designing the chitter challenge.', '2022-09-15 09:31:40', 1),
('I am currently working on my solo project.', '2022-09-15 11:03:56', 3),
('What a grey day!', '2022-09-12 16:17:00', 1);


