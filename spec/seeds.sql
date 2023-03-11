TRUNCATE TABLE chitters, users RESTART IDENTITY;
 -- replace with your own table name.
--this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.
INSERT INTO users (user_name, email, password) VALUES ('bob', 'bob@gmail.com','password1');
INSERT INTO users (user_name, email, password) VALUES ('Anna', 'anna@hotmail.com','password2');
INSERT INTO users (user_name, email, password) VALUES ('Davinder', 'davinder@gmail.com', 'password3');
INSERT INTO users (user_name, email, password) VALUES ('Annad', 'annad@gmail.com','password4');


INSERT INTO chitters (contents, time, user_id ) VALUES ('Hey guys happy monday', 1.13, 1);
INSERT INTO chitters (contents, time, user_id ) VALUES ('Happy monday to you too!', 2.14, 2);
INSERT INTO chitters (contents, time, user_id ) VALUES ('Did you have any breakfast?',3.25, 3);
INSERT INTO chitters (contents, time, user_id ) VALUES ('Yea I had some chocolate',3.25, 4);