TRUNCATE TABLE peeps RESTART IDENTITY;

INSERT INTO peeps (content, timestamp, name, username, user_id) VALUES ('Now I know how lobsters feel :-(', '2022-08-13 12:00:00', 'Alex', 'iloveanimals123', '1');
INSERT INTO peeps (content, timestamp, name, username, user_id) VALUES ('Just call me the man with a fan! LOL', '2022-08-13 13:00:00', 'Zeus', 'habanerohotstuff', '2');

TRUNCATE TABLE users RESTART IDENTITY;

INSERT INTO users (name, email, username, password) VALUES ('Alex', 'alexemail@test.com', 'iloveanimals391', 'password123');
INSERT INTO users (name, email, username, password) VALUES ('Zeus', 'zeusemail@test.com', 'habanerohotstuff', 'password123');