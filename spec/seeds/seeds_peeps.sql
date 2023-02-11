TRUNCATE TABLE users, peeps RESTART IDENTITY;

-- Table Definition

INSERT INTO users (username, name, email, password) VALUES ('harryp', 'Harry Potter', 'harry@xyz.com', 'harry@123');
INSERT INTO users (username, name, email, password) VALUES ('hermoineg', 'Hermoine Grainger', 'hgrainger@xyz.com', 'hgrainger@123');
INSERT INTO users (username, name, email, password) VALUES ('ronw', 'Ronald Weasley', 'ronweasley@xyz.com', 'ron@123');
INSERT INTO users (username, name, email, password) VALUES ('professor_snape', 'Severus Snape', 'snape@xyz.com', 'snape@123');
INSERT INTO users (username, name, email, password) VALUES ('voldemort', 'Tom Marvolo Riddle', 'tom@xyz.com', 'tom@123');

INSERT INTO peeps (content, time, user_id) VALUES ('Hello, I am Harry', '2020-06-22 19:10:25', '1');
INSERT INTO peeps (content, time, user_id) VALUES ('Hi my name is Hermoine', '2020-09-19 12:40:25', '2');
INSERT INTO peeps (content, time, user_id) VALUES ('I am Ron Weasley', '2021-11-18 19:10:25', '3');
INSERT INTO peeps (content, time, user_id) VALUES ('Snape snape snapety snape', '1987-03-12 11:40:25', '2');
