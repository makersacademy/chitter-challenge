DROP TABLE IF EXISTS accounts CASCADE;

-- Create the table without the foreign key first.
CREATE TABLE accounts (
  id SERIAL PRIMARY KEY,
  email text UNIQUE,
  password text,
  name text,
  username text UNIQUE
);

DROP TABLE IF EXISTS peeps;

-- Then the table with the foreign key.
CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  contents text,
  time_posted timestamp,
-- The foreign key name is always {other_table_singular}_id
  account_id int,
  constraint fk_account foreign key(account_id)
    references accounts(id)
    on delete cascade
);
