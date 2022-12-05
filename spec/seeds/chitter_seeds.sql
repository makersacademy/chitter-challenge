DROP TABLE IF EXISTS users CASCADE; 

-- Table Definition
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username text,
    email text
);

TRUNCATE TABLE users RESTART IDENTITY;

INSERT INTO users ("username", "email") VALUES
('Yannis', 'yphillip@foals.com'),
('Jimmy', 'jsmith@foals.com'),
('Jack', 'beeker@foals.com');



DROP TABLE IF EXISTS posts; 

-- Table Definition
CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title text,
    content text,
    time timestamp,
    user_id int
);

TRUNCATE TABLE posts RESTART IDENTITY CASCADE;

INSERT INTO posts ("title", "content", "time", "user_id") VALUES
('Antidotes', 'math rocking glory', '2008-01-01 12:00:00', 1),
('TLF', 'spanish sahara left field', '2010-01-01 12:00:00', 2),
('Holy Fire', 'you dont have my number', '2013-01-01 12:00:00', 3),
('Went Down', 'I see a lion', '2015-01-01 12:00:00', 1);



