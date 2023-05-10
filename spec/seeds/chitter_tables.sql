DROP TABLE IF EXISTS peeps, users;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name text,
  username text,
  email text,
  password text
);

CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  title text,
  content text,
  user_id int,
  constraint fk_user foreign key (user_id)
    references users(id)
    on delete cascade
);

TRUNCATE TABLE users RESTART IDENTITY CASCADE;
TRUNCATE TABLE peeps RESTART IDENTITY CASCADE;

INSERT INTO users (name, username, email, password) VALUES ('Aubrey Salmins', 'aubreysalmins', 'senditon@hotmail.co.uk', '123pswd');
INSERT INTO users (name, username, email, password) VALUES ('Budsy', 'meow-meow', 'wherestheharringtons@feedme.com', 'pswd234');

INSERT INTO peeps (title, content, user_id) VALUES ('Peep 1', 'Its a peep', 1);
INSERT INTO peeps (title, content, user_id) VALUES ('Meep', 'Meow', 2);