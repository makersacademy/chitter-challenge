TRUNCATE TABLE users, posts RESTART IDENTITY;

INSERT INTO posts ("content", "post_timestamp", "user_id") VALUES
('Looking forward to a great weekend!', '2023-01-13 12:12:12', 1),
('This is my first peep!', '2023-01-04 07:12:24', 7),
('Back to work...', '2023-01-03 09:05:12', 6),
('Currently coding', '2023-01-03 08:10:14', 5),
('I love Chitter!', '2023-01-02 12:12:12', 4),
('Hope 2023 is a good year', '2023-01-01 00:14:18', 2),
('Happy New Year', '2023-01-01 00:12:15', 2),
('Just joined', '2022-12-31 12:12:12', 3),
('Hello..', '2022-12-31 09:09:24', 1);

INSERT INTO users ("username", "email_address", "registration_date") VALUES
('alice', 'alice@email.com', '2022-08-23'),
('bob', 'bob@email.com', '2022-09-16'),
('carol', 'carol@email.com', '2022-09-29'),
('dan', 'dan@email.com', '2022-10-18'),
('faythe', 'faythe@email.com', '2022-11-22'),
('frank', 'frank@email.com', '2022-11-27'),
('ted', 'ted@email.com', '2022-12-22');
