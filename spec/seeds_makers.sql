TRUNCATE TABLE makers, peeps RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO makers (name, username, email, password) VALUES ('name1', 'user1', 'name1@email.com', 'password1');
INSERT INTO makers (name, username, email, password) VALUES ('name2', 'user2', 'name2@email.com', 'password2');

INSERT INTO peeps (peep, time, maker_id) VALUES ('first peep', '2022-11-11 11:11:11', '1');
INSERT INTO peeps (peep, time, maker_id) VALUES ('second peep', '2022-12-12 12:12:12', '1');