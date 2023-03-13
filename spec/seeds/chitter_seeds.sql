
DROP TABLE IF EXISTS peeps;
DROP TABLE IF EXISTS users;

-- for the users table

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username text,
  name text,
  surname text,
  email text,
  pass text,
  posts_amount int
);

TRUNCATE TABLE users RESTART IDENTITY;

INSERT INTO users (username, name, surname, email, pass, posts_amount) 
VALUES
('The Lord Of Chitter', 'Francesco', 'Guglielmi', 'gug.francesco@gmail.com', 'UShallNotPass', 1),
('The Assistant', 'Dobbie', 'none', 'dobbie@email.com', 'ciao', 1);

-- for the peeps table

CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  content text,
  date text,
  time text,
  user_id int,
  constraint fk_user_id foreign key(user_id)
  references users(id)
  on delete cascade
);

INSERT INTO peeps (content, date, time, user_id) 
VALUES 
('Welcome to Chitter! My first web app.', '12/03', '17:04', 1),
('My Lord, what services can I offer you?', '12/03', '17:05', 2);

