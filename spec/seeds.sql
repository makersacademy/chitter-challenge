TRUNCATE TABLE peeps RESTART IDENTITY CASCADE; 
TRUNCATE TABLE users RESTART IDENTITY CASCADE; 


INSERT INTO users (username, email, password) VALUES
    ('user1', 'user1@example.com', '<hashed_password>'),
    ('user2', 'user2@example.com', '<hashed_password>');

INSERT INTO peeps (peep, timestamp, username_id) VALUES
    ('Test peep 1', '2023-04-10 12:34:56', 1),
    ('Test peep 2', '2023-04-11 15:30:00', 2),
    ('Test peep 3', '2023-04-12 20:30:00', 2);

