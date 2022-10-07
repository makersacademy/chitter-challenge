
TRUNCATE TABLE peeps, users RESTART IDENTITY; 

INSERT INTO users (name, username, email, password) VALUES ('Ruby', 'cute-cat', 'ruby1@gmail.com', '12345');
INSERT INTO users (name, username, email, password) VALUES ('Amethist', 'foxlover', 'ameth22@gmail.com', '123456');

INSERT INTO peeps (content, user_id, created_at) VALUES ('Have you seen my new kitty-cat? She is adorable!', '1', CURRENT_TIMESTAMP);--'2022-10-05 17:50:20');
INSERT INTO peeps (content, user_id, created_at) VALUES ('I am back from the dead and stronger than ever.', '2', CURRENT_TIMESTAMP); --'2022-10-03 12:45:20'
INSERT INTO peeps (content, user_id, created_at) VALUES ('Who thought foxes could be so fascinating? Have you seen the documentary...', '2', CURRENT_TIMESTAMP); --'2022-10-01 10:55:20'
