chitter=# INSERT INTO peeps (peep, created_on, username) VALUES ('hello everyone', current_timestamp, 'billy_10');
ERROR:  insert or update on table "peeps" violates foreign key constraint "peeps_username_fkey"
DETAIL:  Key (username)=(billy_10) is not present in table "accounts".



INSERT INTO accounts (username, password, email, logged_in) VALUES ('billy_10', 12345, 'billy@hotmail.com', TRUE);