DROP TABLE IF EXISTS peeps;

-- Table Definition
CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  content text,
  time time,
  user_id int
  
);

TRUNCATE TABLE peeps RESTART IDENTITY;

INSERT INTO peeps (content, time, user_id ) VALUES 
('Beautiful day', '9:44','1'),
('Sun is all over the place', '11:14', 1),
('Nice place', '12:04', 2),
('Need to get back home', '14:09', 2),
('Funny story', '05:10', 1);