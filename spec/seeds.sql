TRUNCATE TABLE peeps RESTART IDENTITY CASCADE; -- replace with your own table name.
TRUNCATE TABLE users RESTART IDENTITY CASCADE; -- replace with your own table name.
TRUNCATE TABLE peeps_users RESTART IDENTITY CASCADE; -- replace with your own table name.



INSERT INTO peeps (id, content, time) VALUES
(1, 'Hey this is my funny content', '2004-10-19 10:23:54'),
(2, 'Here is some serious content', '2007-12-25 08:08:08'),
(3, 'Read my fascinating content', '2013-04-22 14:23:59'),
(4, 'Scroll for more cool content', '2019-03-02 20:23:20'),
(5, 'Another piece of content', '2034-07-17 22:23:24');


INSERT INTO users (id, email, password) VALUES
(1, 'user1@email.com', 'password1'),
(2, 'user2@email.com', 'password2'),
(3, 'user3@email.com', 'password3');

INSERT INTO peeps_users (peep_id, user_id) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 3);


ALTER TABLE peeps_users ADD FOREIGN KEY (peep_id) REFERENCES peeps(id);
ALTER TABLE peeps_users ADD FOREIGN KEY (user_id) REFERENCES users(id);
