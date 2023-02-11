TRUNCATE TABLE users, peeps RESTART IDENTITY;

-- Table Definition

INSERT INTO users (username) VALUES ('Harry');
INSERT INTO users (username) VALUES ('Hermoine');
INSERT INTO users (username) VALUES ('Ron');
INSERT INTO users (username) VALUES ('Professor Snape');
INSERT INTO users (username) VALUES ('Voldemort');

INSERT INTO peeps (content, time, user_id) VALUES ('Hello, I am Harry', '2020-06-22 19:10:25', '1');
INSERT INTO peeps (content, time, user_id) VALUES ('Hi my name is Hermoine', '2020-09-19 12:40:25', '2');
INSERT INTO peeps (content, time, user_id) VALUES ('I am Ron Weasley', '2021-11-18 19:10:25', '3');
INSERT INTO peeps (content, time, user_id) VALUES ('Snape snape snapety snape', '1987-03-12 11:40:25', '2');