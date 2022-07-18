CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name text,
    email text,
    password text
);

INSERT INTO users (name,email,password) VALUES
('Irina','irina@email.com','test'),
('Tim','tim@gmail.com','test2'),
('Julien','julien@gmail.com','test3');

CREATE TABLE messages (
    id SERIAL PRIMARY KEY,
    message text,
    date timestamp,
    author_id int,
    constraint fk_author foreign key(author_id) references users(id)
);

INSERT INTO messages (message,date,author_id) VALUES
('I had a tasty salad','2022-07-14',1),
('It is too hot today','2022-11-07',2),
('We need to go to the beach','2022-11-07',3);