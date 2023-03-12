-- EXAMPLE
-- file: albums_table.sql

-- Replace the table name, columm names and types.

-- Create the table without the foreign key first.
CREATE TABLE artists (
  id SERIAL PRIMARY KEY,
  name text,
);

-- Then the table with the foreign key first.
CREATE TABLE albums (
  id SERIAL PRIMARY KEY,
  title text,
  release_year int,
-- The foreign key name is always {other_table_singular}_id
  artist_id int,
  constraint fk_artist foreign key(artist_id)
    references artists(id)
    on delete cascade
);




-- -- Create the table without the foreign key first.
-- CREATE TABLE peepers (
--   id SERIAL PRIMARY KEY,
--   username text,
--   user_password text,
-- );

-- -- Then the table with the foreign key.
-- CREATE TABLE peeps (
--   id SERIAL PRIMARY KEY,
--   peep_message text,
--   time_of_peep time,
-- -- The foreign key name is always {other_table_singular}_id
--   peeper_id int,
--   constraint fk_peeper foreign key(peeper_id)
--     references peepers(id)
--     on delete cascade
-- );