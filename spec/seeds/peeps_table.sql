CREATE TABLE IF NOT EXISTS peeps (
  id SERIAL PRIMARY KEY,
  content text,
  time timestamp without time zone,
  maker_id int,
  constraint fk_maker foreign key(maker_id)
    references makers(id)
    on delete cascade
);

TRUNCATE TABLE peeps RESTART IDENTITY;

INSERT INTO peeps ("content", "time", "maker_id") VALUES
( 'Content1', '2023-02-14 10:27:15','1'),
( 'Content2', '2023-02-14 11:27:15','2'),
( 'Content3', '2023-02-15 12:27:15','1');
