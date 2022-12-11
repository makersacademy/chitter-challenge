DROP TABLE IF EXISTS accounts CASCADE; 

-- Table Definition
CREATE TABLE accounts (
    id SERIAL PRIMARY KEY,
    email text,
    password text,
    name text,
    username text,
    bio text
);

TRUNCATE TABLE accounts RESTART IDENTITY CASCADE;

-- The below is specific to the chitter-test database:

INSERT INTO accounts ("email", "password", "name", "username", "bio") VALUES
('johndoe@mail.com', 'Password1!', 'John Doe', 'johndoe1234', 'Hi, my name is John'),
('bobby-b@ntl.co.uk', 'justpassingthrough', 'Bob Bob', 'newtothis', 'Why do I need to do this?'),
('trooper666@aol.com', 'ride_the_lightning84', 'Taylor Black', 'headbanger666', 'Keep on rockin in the free world'),
('juniordev@outlook.com', 'c0d1ng-15_fun!', 'Dan Delorian', 'developer92', 'Ruby is my passion'),
('turtles@msn.com', 'turtlesturtlesturtles', 'Jason Turturro', 'TurtleGuy', 'I REALLY like turtles'),
('travel4ever@gmail.com', 'around_the_w0rld', 'Clara Viajera', 'global_roamer22', 'Always on the move'),
('seinfeld_fan@msn.com', 'Jerry1954', 'Seinfeld Seinfeld', 'seinfeld_bot', 'Comedy bot');