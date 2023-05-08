TRUNCATE TABLE makers RESTART IDENTITY CASCADE;
TRUNCATE TABLE peeps RESTART IDENTITY CASCADE;

INSERT INTO makers(name, username, email_address, password) VALUES('Matty Boi', 'MattyMooMilk', 'mattys_fake_email@tiscali.net', 'Password1!');
INSERT INTO makers(name, username, email_address, password) VALUES('Hayley Lady', 'HayleyOk', 'another_fake_email420@gmail.com', 'DifferentPassword123.');


INSERT INTO peeps(title, content, date_posted, maker_id) VALUES('My first ever peep', 'Internet is crazy', '2023-07-10 04:05:06 +0000', 1);
INSERT INTO peeps(title, content, date_posted, maker_id) VALUES('Hayleys peep', 'Another test peep', '2023-07-21 12:25:12 +0000', 2);
