refer to https://www.postgresqltutorial.com/postgresql-cheat-sheet/
making a database
make sure u r in psql

CREATE DATABASE chitter_app;

do \c chitter_app 
to connect to the database  (and check if it has been made)

CREATE TABLE peeps (peep_id SERIAL PRIMARY KEY, created_at TIMESTAMP, message_body VARCHAR(60), user_id VARCHAR(60));

 Use psql to create a table called bookmarks in the bookmark_manager database, with two columns: id, a SERIAL PRIMARY KEY, and url, a VARCHAR with a maximum length of 60.

 CREATE [TEMP] TABLE [IF NOT EXISTS] table_name(
   pk SERIAL PRIMARY KEY,
   c1 type(size) NOT NULL,
   c2 type(size) NULL,
   ...
);

\dt to see the table

Connect to psql
Create the database using the psql command CREATE DATABASE bookmark_manager;
Connect to the database using the pqsl command \c bookmark_manager;
Run the query we have saved in the file 01_create_bookmarks_table.sql 