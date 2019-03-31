CREATE TABLE tags
(
  tag_id int PRIMARY KEY,
  content varchar(60),
  FOREIGN KEY (tag_id) REFERENCES users(id) ON DELETE CASCADE
);