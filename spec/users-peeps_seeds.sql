TRUNCATE TABLE users, peeps RESTART IDENTITY CASCADE; -- replace with your own table name.`

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO users (name, email, password) VALUES ('Robbie', 'robbie@gmail.com', 'def');
INSERT INTO users (name, email, password) VALUES ('Shah', 'shah@gmail.com', 'ghi');
INSERT INTO users (name, email, password) VALUES ('Anisha', 'anisha@gmail.com', 'jkl');

INSERT INTO peeps (name, username, message, time_created, user_id) VALUES ('Chris', 'chris123', 'COMING HOME!','2022-12-01 10:00:00', 1);
INSERT INTO peeps (name, username, message, time_created, user_id) VALUES ('Robbie', 'robbie456', 'ENGLAND FOR THE WIN!','2022-12-01 10:10:00', 2);
INSERT INTO peeps (name, username, message, time_created, user_id) VALUES ('Shah', 'shah789', 'SCORE!','2022-11-29 11:00:00', 2);
INSERT INTO peeps (name, username, message, time_created, user_id) VALUES ('Anisha', 'anisha11', 'I wanna go home','2022-11-29 11:30:00', 3);