
TRUNCATE TABLE users,peeps RESTART IDENTITY; 

INSERT INTO users ("user_name", "name", "email", "password") VALUES
('ruby_100', 'Ruby Malowitz', 'coolperson@aol.com', 'HaHUgsa1'),
('sticky_fingers', 'Mike Pearl', 'hi_its_me@me.com', '%hau191'),
('jpeg.1', 'Drew Stick','drumstick200@live.com', '*hahg2q'),
('find_me_online', 'Finola Lover', 'find@me.com', 'MUgaui1');

INSERT INTO peeps ("content", "created", "user_id") VALUES
('This is my first peep','01/12/2022 02:03:04',1),
('What a cool peep', '01/12/2022 02:20:00',2),
('Has anyone watched peepshow?','01/12/2022 02:25:04',1),
('Looking for peeps for a cool project, does anyone know a peep', '01/12/2022 02:10:04',3),
('Hey peep I can help you! ','01/12/2022 02:30:04',4);