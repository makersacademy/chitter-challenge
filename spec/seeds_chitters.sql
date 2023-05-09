TRUNCATE TABLE chitters, users RESTART IDENTITY; -- replace with your own table name.

INSERT INTO users (email, password, name, username) VALUES ('samm@makersacademy.com', 'password123', 'Sam Morgan', 'sjmog');
INSERT INTO users (email, password, name, username) VALUES ('chonky@chonkersacademy.com', 'birdwird', 'Samuel Morganson', 'smorg');
INSERT INTO users (email, password, name, username) VALUES ('sleepy@sleepersacademy.com', 'zzzzzz', 'Tony Harrison', 'TZ');

INSERT INTO chitters (peep, created_at, user_id) VALUES ('flying solo', CURRENT_TIMESTAMP, 2);
INSERT INTO chitters (peep, created_at, user_id) VALUES ('falling', CURRENT_TIMESTAMP, 2);
INSERT INTO chitters (peep, created_at, user_id) VALUES ('dead', CURRENT_TIMESTAMP, 3);