DROP TABLE IF EXISTS messages; 

-- Table Definition
CREATE TABLE messages (
    id SERIAL PRIMARY KEY,
    time time,
    date date,
    content text
);

TRUNCATE TABLE messages RESTART IDENTITY;

INSERT INTO messages ("time", "date", "content") VALUES
('12:09', '13-04-2023', 'Hello, world'),
('01:10', '08-03-2023', 'Quack overflow'),
('15:15', '06-04-2023', 'Ruby rules');