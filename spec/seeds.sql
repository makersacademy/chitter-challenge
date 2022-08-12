TRUNCATE TABLE users RESTART IDENTITY;

INSERT INTO users (email, password) VALUES ('duck@makers.com', 'quack!');

TRUNCATE TABLE peeps RESTART IDENTITY;

INSERT INTO peeps (content, timestamp, name, username)
  VALUES ('It is awfully hot today', '2022-08-12 21:55:12.940137 +0100', 'Daffy Duck', '@daffy');
INSERT INTO peeps (content, timestamp, name, username)
  VALUES ('Nice weather for ducks', '2022-08-12 21:56:54.385627 +0100 ', 'Donald Duck', '@donald');
