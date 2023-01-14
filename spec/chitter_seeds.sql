TRUNCATE TABLE users, peeps RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO users (name, username, email, password) VALUES('Ricki Tarr', 'scalphunter', 'RickiTarr@mi5.com', 'abc123');
INSERT INTO users (name, username, email, password) VALUES('Bill Haydon', 'tailor', 'BillHaydon@kgb.net', 'witchcraft');
INSERT INTO peeps (peep_content, peep_date, user_id) VALUES('I am going to tell you a story...', '20:55 13/01/2023', 1);
INSERT INTO peeps (peep_content, peep_date, user_id) VALUES('Dear, dear Anne...', '20:40 13/01/2023', 2);



