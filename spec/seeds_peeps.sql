
DROP TABLE IF EXISTS peeps;
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE peeps (
    id SERIAL PRIMARY KEY,
    peep_content text,
    time_posted timestamp,
    user_id int4
);
TRUNCATE TABLE peeps RESTART IDENTITY;


INSERT INTO peeps ("peep_content", "time_posted", "user_id") VALUES
('Using Chitter for the first time!', '2023-01-15 17:30:56', 2),
('Have a great weekend!', '2023-01-15 17:35:10', 2),
('Weekend challenge!', '2023-01-15 17:40:50', 2),
('Hello Chitter!', '2023-01-15 17:53:31', 3),
('My first peep!', '2023-01-15 17:58:58', 1),
('Bad hair day :(', '2023-01-15 18:12:10', 3),
('Repeeps mean nugget treats.', '2023-01-15 19:33:30', 3),
('Just setting up my Chitter.', '2023-01-15 20:16:24', 4),
('Hello Chitterers!', '2023-01-15 20:59:26', 4);
