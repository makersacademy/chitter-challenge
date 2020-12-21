Creating project databases

1 - Log in to postgreSQL
enter into Terminal: psql postgres

2 - Create a database
enter: CREATE DATABASE "chitter_members";

3 - Ensure database has been created and therefore listed
enter: \l

4 - Connect to the new database
enter: \c chitter_members;

5 - Create the table within the database
enter: CREATE TABLE chitter_members_data(id SERIAL PRIMARY KEY, url VARCHAR(60));

6 - See the contents of the table
enter: SELECT * FROM chitter_members_data;
