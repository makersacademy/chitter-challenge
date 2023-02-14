DROP TABLE IF EXISTS makers, peeps; 

-- Table Definition
CREATE TABLE makers (
  id SERIAL PRIMARY KEY,
  name text,
  username text,
  email text,
  password text
);

-- Table Definition -:id, :content, :titile, :date_created, :maker_id
CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  title text,
  content text,
  date_created TIMESTAMP,
  maker_id text,
  -- The foreign key name is always maker_id
  maker_id int,
  constraint fk_maker foreign key(maker_id)
    references makers(id)
    on delete cascade
);

---seeding data

INSERT INTO makers (name, username, email, password) VALUES
('Rose Tree', 'petal1', 'rose@petal.com', 'bumbleb33'),
INSERT INTO makers (name, username, email, password) VALUES
('Graham Fillmore', 'Jazziman', 'GF@eastwest.com', '43770');



INSERT INTO peeps (title, content, date_created, makers_id) VALUES
('Monday Yawning', 'Is it possible that', '2023-02-13 12:30:15' 1);
INSERT INTO peeps (title, username, content, created, makers_id) VALUES
('Two Peas in a Pod', 'When I met my pair for the first time', '2022-12-31 11:59:00' 2);

