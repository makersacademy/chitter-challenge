TRUNCATE TABLE users, posts RESTART IDENTITY; 

INSERT INTO users (username, name, email, password) VALUES 
('ted453', 'Ted D', 'tedd@hotmailtest.com', 'qwerty123'),
('jem341', 'Jemm Platz', 'JSpace@yahoot.com', 'astrocosmaus789'),
('user123', 'Anon Ymouse', 'is_a_user@user.com', 'password_123');

INSERT INTO posts (content, post_time, tagged_users, user_id) VALUES
('Ran a marathon yesterday, quicker than the Flash', '2020-08-09 13:57:40', '', 3),
('Ate beans LOL', '2021-08-09 13:57:40', 'jem341', 1),
('Going on a diet after eating a beige buffet for lunch', '2022-01-09 13:57:40', 'ted453', 3),
('Walked the dog, barked at a cat', '2022-05-06 16:57:40', '', 1),
('Wrote a message to Makers today saying how good the course is', '2022-08-31 20:57:40', 'user123', 2);