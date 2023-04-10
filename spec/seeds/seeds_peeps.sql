TRUNCATE TABLE peeps RESTART IDENTITY CASCADE;

INSERT INTO peeps (content, user_id) values('Just a test peep!', 1);
INSERT INTO peeps (content, user_id) values('Just another test peep!', 1);
INSERT INTO peeps (content, user_id) values('Just a random peep!', 2);