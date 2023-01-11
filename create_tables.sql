CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  content text,
  date_time timestamp
);

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  first_name text,
  surname text,
  email text,
  username text
);

CREATE TABLE replies (
  post_id int,
  user_id int,
  content text,
  datetime timestamp,
  constraint fk_posts foreign key(post_id) references posts(id) on delete cascade,
  constraint fk_users foreign key(user_id) references users(id) on delete cascade,
  PRIMARY KEY (post_id, user_id)
);