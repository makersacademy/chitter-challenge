DROP TABLE IF EXISTS "public"."users" CASCADE;
DROP TABLE IF EXISTS "public"."posts" CASCADE;
DROP TABLE IF EXISTS "public"."comments" CASCADE;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email text,
  password text,
  name text,
  username text
);

-- Create the second table.
CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  content text,
  created_time timestamp(0),
  user_id int,
  constraint fk_user foreign key(user_id) references users(id) on delete cascade
);

-- Create the thrid table.
CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  content text,
  created_time timestamp(0),
  user_id int,
  post_id int,
  constraint fk_user foreign key(user_id) references users(id) on delete cascade,
  constraint fk_post foreign key(post_id) references posts(id) on delete cascade
);
