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
  ts timestamp,
  user_id int,
  constraint fk_user foreign key(user_id) references users(id) on delete cascade
);

-- Create the thrid table.
CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  content text,
  ts timestamp,
  user_id int,
  post_id int,
  constraint fk_user foreign key(user_id) references users(id) on delete cascade,
  constraint fk_post foreign key(post_id) references posts(id) on delete cascade
);

INSERT INTO users (email,password,name,username) VALUES 
('abc@gmail.com','123','Luke','luke'),
('efg@gmail.com','456','Ryan','ryan'),
('ijk@gmail.com','789','Jenny','jenny');

INSERT INTO posts (content, ts, user_id) VALUES
('First content',current_timestamp,1),
('Second content',current_timestamp,1),
('Thrid content',current_timestamp,2);

INSERT INTO comments (content,ts,user_id,post_id) VALUES
('First comment',current_timestamp,2,1),
('Second comment',current_timestamp,3,1);
