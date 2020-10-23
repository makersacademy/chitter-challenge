CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  username VARCHAR(20),
  body VARCHAR(200),
  posted_on VARCHAR(20),
  edited_on VARCHAR(20)
);
INSERT INTO peeps (username, body, posted_on) VALUES ('trump', 'BUILD THE WALL!', '2020-10-10 12:35:50');
INSERT INTO peeps (username, body, posted_on) VALUES ('durov', 'Telegram v5.0 is out now!', '2020-08-10 11:54:55');
INSERT INTO peeps (username, body, posted_on) VALUES ('kiriarf', 'Peep is going live this Sunday', '2020-10-22 15:29:29');
INSERT INTO peeps (username, body, posted_on) VALUES ('leo', 'Woof!', '2020-10-22 13:30:29');
INSERT INTO peeps (username, body, posted_on) VALUES ('felix', 'Meow!', '2020-10-22 07:09:22');