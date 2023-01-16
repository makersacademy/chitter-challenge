
TRUNCATE TABLE users, posts RESTART IDENTITY;

INSERT INTO users ("username", "email_address", "registration_date") VALUES
('alice', 'alice@email.com', '2022-08-23'),
('bob', 'bob@email.com', '2022-09-16'),
('carol', 'carol@email.com', '2022-09-29'),
('dan', 'dan@email.com', '2022-10-18'),
('faythe', 'faythe@email.com', '2022-11-22'),
('frank', 'frank@email.com', '2022-11-27'),
('ted', 'ted@email.com', '2022-12-22');