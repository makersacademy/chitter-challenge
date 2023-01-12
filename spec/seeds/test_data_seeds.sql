TRUNCATE TABLE peeps, users RESTART IDENTITY;

INSERT INTO users (name, email, username, password) VALUES 
('Test Testson', 'testing123@gmail.com', 'testing', 'password123'),
('Elon Musk', 'elon@twitter.com', 'elon_musk', 'tesla_rocks'),
('Steve Johnson', 'steve.johnson@talktalk.net', 'mr_politics', 'snowflakes');

INSERT INTO peeps (content, datetime, user_id) VALUES
('Hello! I''m a test account.', '2020-06-05 11:00:00', 1),
('Does anyone else love RSpec?', '2020-06-04 11:00:00', 1),
('Wow, this website is so much better than mine!', '2020-06-04 11:00:01', 2),
('Guys, pls don''t sell tesla stock', '2022-06-04 15:25:01', 2),
('I don''t like the government', '2022-08-04 14:25:01', 3),
('Happy New Year!', '2023-01-01 00:00:00', 3);
