TRUNCATE TABLE users RESTART IDENTITY CASCADE;

INSERT INTO users (email, password, name, username) VALUES ('samm@makersacademy.com', 'password123', 'Sam Morgan', 'sjmog');
INSERT INTO users (email, password, name, username) VALUES ('dkong@makersacademy.com', 'banana123', 'Donkey Kong', 'dkong');

TRUNCATE TABLE peeps RESTART IDENTITY;

INSERT INTO peeps (content, time, user_id) VALUES ('My very first peep!', '2023-05-05 19:10:25', '1');
INSERT INTO peeps (content, time, user_id) VALUES ('This is better than twitter', '2023-05-09 09:55:01', '2');