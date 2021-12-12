refer to https://www.postgresqltutorial.com/postgresql-cheat-sheet/

Connect to psql
CREATE DATABASE chitter;
\c chitter 

CREATE TABLE peeps (peep_id SERIAL PRIMARY KEY, created_at TIMESTAMP, message_body VARCHAR(60), user_id VARCHAR(60));

<!-- create a database for testing purposes -->
