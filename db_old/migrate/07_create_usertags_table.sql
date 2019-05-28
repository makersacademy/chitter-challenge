CREATE TABLE usertags
(
  id serial PRIMARY KEY,
  user_id int NOT NULL,
  tag_id int NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  FOREIGN KEY (tag_id) REFERENCES tags(id) ON DELETE CASCADE
);