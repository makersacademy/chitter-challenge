
TRUNCATE users, peeps RESTART IDENTITY;

INSERT INTO users (first_name, last_name, username, email, password) VALUES ('Benedict', 'Smith', 'bennyboy', 'ben@gmail.com', '123bento');
INSERT INTO users (first_name, last_name, username, email, password) VALUES ('Kylie', 'Jenner', 'kyliejenner', 'kjen@hotmail.com', 'ih8kimbo');
INSERT INTO users (first_name, last_name, username, email, password) VALUES ('Elon', 'Musk', 'elonmusk', 'no1@tesla.com', 'ihrtte5la');
INSERT INTO users (first_name, last_name, username, email, password) VALUES ('Rihanna', 'Fenty', 'rihanna', 'badgyal@gmail.com', 'b@dgyalrh1');
INSERT INTO users (first_name, last_name, username, email, password) VALUES ('Joe', 'Bloggs', 'ragedad', 'angryboi@aol.com', 'n0th@ppy');
INSERT INTO users (first_name, last_name, username, email, password) VALUES ('Karen', 'Finance', 'canispeaktothemanager', 'excuseme@manager.com', 'c0mplain3r');


INSERT INTO peeps (content, time, user_id) VALUES ('First peep babeh!', '2009-01-17 12:23', '3');
INSERT INTO peeps (content, time, user_id) VALUES ('Just started at makers', '2022-09-12 09:15', '1');
INSERT INTO peeps (content, time, user_id) VALUES ('Watch our new series on hulu', '2022-10-06 14:00', '2');
INSERT INTO peeps (content, time, user_id) VALUES ('@elonmusk I dont like you', '2022-10-01 12:20', '5');
INSERT INTO peeps (content, time, user_id) VALUES ('@tesco, I want a refund', '2022-10-06 14:01', '6');
INSERT INTO peeps (content, time, user_id) VALUES ('@aldi I want a refund', '2022-10-06 14:02', '6');
INSERT INTO peeps (content, time, user_id) VALUES ('@sainsburys I want a refund', '2022-10-06 14:03', '6');
INSERT INTO peeps (content, time, user_id) VALUES ('@bennboy any advice on stocks?', '2021-01-01 00:01', '3');
INSERT INTO peeps (content, time, user_id) VALUES ('@elonmusk no', '2021-01-02 12:05', '1');
INSERT INTO peeps (content, time, user_id) VALUES ('Does anyone know how to code?', '2022-05-30 12:01', '1');
