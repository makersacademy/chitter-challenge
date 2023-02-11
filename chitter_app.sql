CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name text,
  email text, 
  username text, 
  password text
);

-- Then the table with the foreign key first.
CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  contents text,
  time timestamp,
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);

-- The foreign key name is always user_id