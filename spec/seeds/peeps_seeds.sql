DROP TABLE IF EXISTS peeps; 

-- Table Definition
CREATE TABLE peeps (
    id SERIAL PRIMARY KEY,
    message text,
    time timestamp,
    user_id int
);

TRUNCATE TABLE peeps RESTART IDENTITY;

INSERT INTO peeps ("message", "time", "user_id") VALUES
('I pick my friends like I pick fruit', '2023-01-08 04:05:06', 1),
('How you gonna win when you aint right within?', '2023-01-08 04:05:06', 2),
('Sometimes I dont wanna feel those metal clouds', '2023-01-08 04:05:06', 3)
