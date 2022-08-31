TRUNCATE TABLE users, posts RESTART IDENTITY; 

INSERT INTO users (username, name, email, password) VALUES 
('ted453', 'Ted D', 'tedd@hotmailtest.com', 'qwerty123'),
('jem341', 'Jemm Platz', 'JSpace@yahoot.com', 'astrocosmaus789'),
('user123', 'Anon Ymouse', 'is_a_user@user.com', 'password_123');

-- Add posts test cases