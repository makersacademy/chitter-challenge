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

--INSERT INTO peeps ("title", "username", "content", "created", "maker_id") VALUES
--('Doolittle', 1989, 1),
---('Surfer Rosa', 1988, 1),
--('Waterloo', 1974, 2);
--above example to demonstrate populating table

