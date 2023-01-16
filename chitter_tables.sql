CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name text,
  username text,
  email text,
  password text
);

-- Then the table with the foreign key first.
CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  peep_content text,
  peep_date text,
-- The foreign key name is always {other_table_singular}_id
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);