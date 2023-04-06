DROP TABLE IF EXISTS users, peeps; 

-- Table Definition
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username text,
    email varchar,
    password varchar
);

-- Table Definition
CREATE TABLE peeps (
    id SERIAL PRIMARY KEY,
    body text
    time timestamp,
    tags text,
    user_id int
);

TRUNCATE TABLE users, peeps RESTART IDENTITY;

INSERT INTO users ("username", "email", "password") VALUES
('Amber', 'amber@email.com', '123456'),
('Billy', 'billy@email.com', 'password'),
('Caleb', 'caleb@email.com', 'hello')

INSERT INTO peeps ("body", "time", "tags", "user_id") VALUES
('Today I coded', '2023-04-01 13:00:00', 'code,amber', 1),
('Today I ate', '2023-04-02 14:00:00', 'food,billy', 2),
('Today I slept', '2023-04-03 15:00:00', 'sleep,amber', 1),
('Today I wept', '2023-04-04 16:00:00', 'cry,caleb', 3),
('Today I swam', '2023-04-05 17:00:00', 'swim,amber', 1),
('Today I raged', '2023-04-06 18:00:00', 'rage,caleb', 3),
('Today I relaxed', '2023-04-07 19:00:00', 'relax,billy', 2)