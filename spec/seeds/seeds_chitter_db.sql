DROP TABLE IF EXISTS "public"."posts";
CREATE SEQUENCE IF NOT EXISTS posts_id_seq;

DROP TABLE IF EXISTS "public"."users";
CREATE SEQUENCE IF NOT EXISTS users_id_seq;



CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username text
);

-- Create the second table.
CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  post_content text,
  author_id int,
  time_posted time,
  constraint fk_users foreign key(author_id) references users(id)
);

INSERT INTO "public"."users"("id", "username") VALUES
(1, 'Joe'),
(2, 'Joseph');


INSERT INTO "public"."posts"("id","post_content","author_id","time_posted") VALUES
(1, 'This is post num 1', 1, '15:13:00'),
(2, 'This is second post', 2, '14:13:30');
