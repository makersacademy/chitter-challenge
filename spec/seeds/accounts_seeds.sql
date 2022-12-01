DROP TABLE IF EXISTS accounts; 

-- Table Definition
CREATE TABLE accounts (
    account_id SERIAL PRIMARY KEY,
    username text,
    password text
);

TRUNCATE TABLE accounts RESTART IDENTITY CASCADE;

INSERT INTO accounts ("username", "password") VALUES
('johndoe1234', 'Password1!'),
('justpassingthrough', 'newtothis'),
('metallover666', 'ride_the_lightning84'),
('developer92', 'c0d1ng-15_fun!'),
('TurtleGuy', 'turtlesturtlesturtles'),
('global_roamer22', 'around_the_w0rld'),
('seinfeld_bot', 'Jerry1954');