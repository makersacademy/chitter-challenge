TRUNCATE TABLE users, peeps RESTART IDENTITY;

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO users (email, password, name, username)
  VALUES ('lou@chitter.com', 'password01', 'Louis', 'lpc');

INSERT INTO users (email, password, name, username)
  VALUES ('luce@chitter.com', 'password02', 'Lucy', 'leh');


INSERT INTO peeps (content, time, user_id)
  VALUES ('First post', '12:00', 1);