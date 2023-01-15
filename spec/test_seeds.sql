

-- DATETIME - format: YYYY-MM-DD HH:MI:SS

TRUNCATE TABLE users, posts RESTART IDENTITY;

INSERT INTO users (name, username, email, password, logged_in) VALUES
('Anonymous', 'Anon', 'Anon', 'Anon', false),
('Jimmy Kimmel', 'username2', 'email2', 'password2', true);


INSERT INTO posts (post_time, message, user_id) VALUES
('2010-10-10 10:10:10', 'This is an anonymous post... look out...', 1),
('2010-10-10 10:10:10', 'Check out this chitter bot', 2);


--   attr_accessor :id, :name, :username, :email, :password, :logged_in
