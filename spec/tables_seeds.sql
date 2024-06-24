DROP TABLE IF EXISTS users CASCADE;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name text,
  username text,
  email text,
  password varchar
);

DROP TABLE IF EXISTS posts CASCADE;
-- Create the second table.
CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  peep text,
  time timestamp,
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);

DROP TABLE IF EXISTS comments CASCADE;

CREATE TABLE comments (
    id SERIAL PRIMARY KEY,
    comment text,
    time timestamp,
    post_id int,
    constraint fk_post foreign key(post_id)
        references posts(id)
        on delete cascade
);


DROP TABLE IF EXISTS tags CASCADE;

CREATE TABLE tags (
    tag text,
    post_id int,
    user_id int,
    constraint fk_post foreign key(post_id)
    references posts(id)
    on delete cascade,
    constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade,
    PRIMARY KEY (post_id, user_id)
);
