TRUNCATE TABLE users, peeps RESTART IDENTITY;

INSERT INTO users (email, password, name, username, logged_in)
  VALUES ('lou@chitter.com', 'password01', 'Louis', 'lpc', false);

INSERT INTO users (email, password, name, username, logged_in)
  VALUES ('luce@chitter.com', 'password02', 'Lucy', 'leh', false);

INSERT INTO peeps (content, time, user_id)
  VALUES ('First post', '12:00', 1);
  
INSERT INTO peeps (content, time, user_id)
  VALUES ('Second post', '13:00', 1);