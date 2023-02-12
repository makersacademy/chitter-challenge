DROP TABLE IF EXISTS peeps; 

-- Table Definition
CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  title text,
  username text,
  content text,
  created TIMESTAMP,
-- The foreign key name is always maker_id
  maker_id int,
  constraint fk_maker foreign key(maker_id)
    references makers(id)
    on delete cascade
);

TRUNCATE TABLE peeps RESTART IDENTITY;

INSERT INTO peeps (title, username, content, created) VALUES
('Monday Yawning', 'Rubber Duckie', 'Is it possible that', '2023-02-13 12:30:15'),
INSERT INTO peeps (title, username, content, created) VALUES
('Two Peas in a Pod', 'Doris', 'When I met my pair for the first time', '2022-12-31 11:59:00');

