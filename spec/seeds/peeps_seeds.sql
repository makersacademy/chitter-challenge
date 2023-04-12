DROP TABLE IF EXISTS peeps; 

-- Table Definition
CREATE TABLE peeps (
    id SERIAL PRIMARY KEY,
    title text,
    content text
);

TRUNCATE TABLE peeps RESTART IDENTITY;

INSERT INTO peeps ("title", "content") VALUES
('Peep 1', 'This is my first Peep'),
('Peep 2', 'This is my second Peep'),
('Peep 3', 'This is my third Peep'),
('Peep 4', 'This is my fourth Peep'),
('Peep 5', 'This is my fifth Peep');