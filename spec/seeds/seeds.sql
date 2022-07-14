TRUNCATE TABLE users RESTART IDENTITY CASCADE;

INSERT INTO users (name,email,password) VALUES
('Irina','irina@email.com','test'),
('Tim','tim@gmail.com','test2'),
('Julien','julien@gmail.com','test3');

TRUNCATE TABLE messages RESTART IDENTITY CASCADE;

INSERT INTO messages (message,date,author_id) VALUES
('I had a tasty salad','2022-07-14',1),
('It is too hot today','2022-11-07',2),
('We need to go to the beach','2022-11-07',3);