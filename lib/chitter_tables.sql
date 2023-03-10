-- file: chitter_table.sql

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name text,
  username TEXT,
  password TEXT,
  email TEXT
);

CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  content TEXT,
  timestamp TIMESTAMP,
  tags TEXT,
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);

--NOTE: Password will be encrypted using hash algoritm SHA-256
INSERT INTO users (name, username, password, email)
VALUES ('John Doe', 'johndoe', 'password123', 'johndoe@example.com'),
('Jane Smith', 'janesmith', 'abc123', 'janesmith@example.com'),
('Bob Johnson', 'bobj', 'def456', 'bobj@example.com');

INSERT INTO peeps (content, timestamp, tags, user_id)
VALUES ('Just had the best burger ever!', '2022-09-01 12:30:00', 'food,burger', 1),
('Can''t wait for the weekend!', '2022-09-02 16:45:00', 'weekend', 2),
('Excited to start my new job!', '2022-09-03 09:00:00', 'work,newjob', 3),
('Watching the game with friends tonight', '2022-09-04 20:15:00', 'sports', 1),
('Trying out a new recipe for dinner', '2022-09-05 18:00:00', 'food,recipe', 2),
('Just finished a great workout', '2022-09-06 07:30:00', 'fitness', 3);