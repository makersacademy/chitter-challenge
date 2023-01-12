

-- DATETIME - format: YYYY-MM-DD HH:MI:SS

TRUNCATE TABLE users, posts RESTART IDENTITY;

INSERT INTO users (name, username, email, password, logged_in) VALUES
('name1', 'username1', 'email1', 'password1', false),
('name2', 'username2', 'email2', 'password2', true);


INSERT INTO posts (post_time, message, user_id) VALUES
('2010-10-10 10:10:10', 'hello1', 1),
('2010-10-10 10:10:10', 'hello2', 2);


--   attr_accessor :id, :name, :username, :email, :password, :logged_in
