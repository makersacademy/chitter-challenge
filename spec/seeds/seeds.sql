
TRUNCATE TABLE peeps, makers RESTART IDENTITY; 

INSERT INTO makers (name, username, email, password, loggedin) VALUES ('Ruby', 'cute-cat', 'ruby1@gmail.com', '12345', 'true');
INSERT INTO makers (name, username, email, password, loggedin) VALUES ('Amethist', 'foxlover', 'ameth22@gmail.com', '123456', 'false');

INSERT INTO peeps (content, maker_id) VALUES ('Have you seen my new kitty-cat? She is adorable!', '1');--'2022-10-05 17:50:20');
INSERT INTO peeps (content, maker_id) VALUES ('I am back from the dead and stronger than ever.', '2'); --'2022-10-03 12:45:20'
INSERT INTO peeps (content, maker_id) VALUES ('Who thought foxes could be so fascinating? Have you seen the documentary...', '2'); --'2022-10-01 10:55:20'
