CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username text,
  email_address text,
  password text
  full_name text
);

CREATE TABLE messages (
  id SERIAL PRIMARY KEY,
  content text,
  time_posted timestamp,
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);

INSERT INTO users (username, email_address, password, full_name) VALUES ('Bloggy_J', 'joe_blogs@gmail.com', 'sxdfhcgjvhk2342','Joe_Bloggs');
INSERT INTO messages (content, time_posted, user_id) VALUES ('This is a short post', '2022-12-01 19:10:25', '1');