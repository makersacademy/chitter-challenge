CREATE TABLE users (
  id SERIAL PRIMARY KEY,
 username text,
 email text,
 password
);

-- Then the table with the foreign key first.
CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  content text,
  date_created text,
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);