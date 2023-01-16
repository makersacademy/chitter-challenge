TRUNCATE TABLE posts, users RESTART IDENTITY; 

INSERT INTO users (name, email, user_name, password, logged_in ) VALUES ('Adam Hoar', 'pretend@hotmail.com', 'adam1', 'password1', false);
INSERT INTO users (name, email, user_name, password, logged_in ) VALUES ('Joe Bloggs', 'fake@icloud.com', 'joe1', 'pizza123', false);
INSERT INTO users (name, email, user_name, password, logged_in ) VALUES ('John Doe', 'real@icloud.com', 'john3', 'makers1', false);

INSERT INTO posts (content, date_time, user_id) VALUES ('Peep 1', '17:48', 1);
INSERT INTO posts (content, date_time, user_id) VALUES ('Peep 2', '18:48', 2);
INSERT INTO posts (content, date_time, user_id) VALUES ('Peep 3', '19:48', 3);