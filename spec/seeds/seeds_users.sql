TRUNCATE TABLE users, peeps RESTART IDENTITY;

-- Table Definition

INSERT INTO users (id, username) VALUES (1, 'Harry');
INSERT INTO users (id, username) VALUES (2, 'Hermoine');
INSERT INTO users (id, username) VALUES (3, 'Ron');
INSERT INTO users (id, username) VALUES (4, 'Professor Snape');
INSERT INTO users (id, username) VALUES (5, 'Voldemort');

INSERT INTO peeps (id, content, time, user_id) VALUES (1, 'Hello, I am Harry', '2020-06-22 19:10:25', '1');
INSERT INTO peeps (id, content, time, user_id) VALUES (2, 'Hi my name is Hermoine', '2020-09-19 12:40:25', '2');
INSERT INTO peeps (id, content, time, user_id) VALUES (3, 'I am Ron Weasley', '2021-11-18 19:10:25', '3');
INSERT INTO peeps (id, content, time, user_id) VALUES (4, 'Snape snape snapety snape', '1987-03-12 11:40:25', '2');
