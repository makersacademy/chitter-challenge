TRUNCATE TABLE peeps,users RESTART IDENTITY;

INSERT INTO users (email, username, name, password) VALUES 
('mosho@live.co.uk', 'Mosho', 'Moses', 'password'),
('layi@live.co.uk', 'Layi88', 'Layi', 'password2');
INSERT INTO peeps (username, name, content, time, user_id) VALUES 
('Mosho', 'Moses', 'My first peep!', '2022-09-20 15:03:45', 1),
('Layi88', 'Layi', 'Test peep 2', '2022-09-20 16:00:00', 2),
('Mosho', 'Moses', 'My second! peep!', '2022-09-20 16:03:45', 1);