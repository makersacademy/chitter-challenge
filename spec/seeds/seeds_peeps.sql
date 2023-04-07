TRUNCATE TABLE peeps RESTART IDENTITY CASCADE;

INSERT INTO peeps (message, published, user_id) values('Just a test peep!', '2023-04-07', 1);
INSERT INTO peeps (message, published, user_id) values('Just another test peep!', '2023-04-07', 1);
INSERT INTO peeps (message, published, user_id) values('Just a random peep!', '2023-04-07', 2);