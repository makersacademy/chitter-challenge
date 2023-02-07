TRUNCATE TABLE users, peeps RESTART IDENTITY CASCADE; -- replace with your own table name.`

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO users (email, password, name, username) VALUES ('robbie@gmail.com', '123', 'Robbie', 'robbie123');
INSERT INTO users (email, password, name, username) VALUES ('shah@gmail.com', '456', 'Shah', 'shah456');
INSERT INTO users (email, password, name, username) VALUES ('anisha@gmail.com', '789', 'Anisha', 'anisha789');

INSERT INTO peeps (message, time, user_id) VALUES ('COMING HOME!','2022-12-01 10:00:00', 1);
INSERT INTO peeps (message, time, user_id) VALUES ('ENGLAND FOR THE WIN!','2022-12-01 10:10:00', 2);
INSERT INTO peeps (message, time, user_id) VALUES ('SCORE!','2022-11-29 11:00:00', 2);
INSERT INTO peeps (message, time, user_id) VALUES ('I wanna go home','2022-11-29 11:30:00', 3);