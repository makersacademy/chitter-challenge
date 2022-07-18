TRUNCATE TABLE users RESTART IDENTITY CASCADE;

INSERT INTO users (name,email,password) VALUES
('Irina','irina@email.com','$2a$04$5sYFlPVgQkg7aysJ/zzdqeagXIESBjzJo2pq.NHrFjAYW0lonCIRS'),
('Tim','tim@gmail.com','$2a$04$BmxeMdBOt/sRk6v5ZSNg3uvSxeGWeIvGu1Tx8ppQ6OIKHS2m4RPXe'),
('Julien','julien@gmail.com','$2a$04$u6MRxbgndNpMrZ/rit.MtOWLxZ8Zz2HZ3PTgbhLetMgAZX4OXbSL.');

TRUNCATE TABLE messages RESTART IDENTITY CASCADE;

INSERT INTO messages (message,date,author_id) VALUES
('I had a tasty salad','2022-07-14',1),
('It is too hot today','2022-11-07',2),
('We need to go to the beach','2022-11-07',3);