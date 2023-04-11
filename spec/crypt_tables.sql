DROP TABLE IF EXISTS users, peeps; 

-- Table Definition
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name text,
    username text,
    email varchar,
    password varchar
);

-- Table Definition
CREATE TABLE peeps (
    id SERIAL PRIMARY KEY,
    body text,
    time timestamp,
    tags text,
    user_id int
);

TRUNCATE TABLE users, peeps RESTART IDENTITY CASCADE;

INSERT INTO users ("name", "username", "email", "password") VALUES
('Amber Thompson', 'Amber', 'amber@email.com', '$2a$12$79o3wBPYwLiNGnS329LQJOV91pzp4RXaQi1KXPShy7bg6hBD1t3LO'),
('Billy Thompkins', 'Billy', 'billy@email.com', '$2a$12$KuowH.RWU8/Hx7u1uNJAzOYEABy2APD9v4lrAGn5UxK9mhdXGSpXm'),
('Caleb Tomlinson', 'Caleb', 'caleb@email.com', '$2a$12$a/Sg0TiHT7uXxsr4oWDfFu5DEzJrTDSPqkie3v3iYDcKOXb7D07j6')
;

INSERT INTO peeps ("body", "time", "tags", "user_id") VALUES
('Today I coded', '2023-04-01 13:00:00', '#code, #amber', 1),
('Today I ate', '2023-04-02 14:00:00', '#food, #billy', 2),
('Today I slept', '2023-04-03 15:00:00', '#sleep, #amber', 1),
('Today I wept', '2023-04-04 16:00:00', '#cry, #caleb', 3),
('Today I swam', '2023-04-05 17:00:00', '#swim, #amber', 1),
('Today I meditated', '2023-04-06 18:00:00', '#meditate, #caleb', 3),
('Today I relaxed', '2023-04-07 19:00:00', '#relax, #billy', 2)
;

-- psql -h 127.0.0.1 chitter
-- psql -h 127.0.0.1 chitter_test


-- psql -h 127.0.0.1 chitter < spec/seeds.sql
-- psql -h 127.0.0.1 chitter_test < spec/seeds.sql
