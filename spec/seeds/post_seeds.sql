DROP TABLE IF EXISTS posts;

CREATE TABLE posts(
    id SERIAL PRIMARY KEY,
    content text,
    date text,
    user_id int
);

TRUNCATE TABLE posts RESTART IDENTITY;

INSERT INTO posts("content", "date", "user_id") VALUES
('I am Iron Man.', '2012-10-27 15:18:48 +0100', 1),
('You shall not touch my beard!', '2018-09-27 15:18:48 +0100', 3),
('I can do this all day.', '2018-10-27 15:18:48 +0100', 2),
('Another!', '2021-10-27 15:18:48 +0100', 3),
('I invented time travel...', '2016-10-27 15:18:48 +0100', 1),
('Developers, assemble!', '2019-10-27 15:18:48 +0100', 2);