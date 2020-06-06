# Chitter weekend challenge

Directions for setting up a database

- Connect to psql
- Create the database using the psql command CREATE DATABASE chitter;
- Connect to the database using the pqsl command \c chitter;
- Run the query we have saved in the file chitter_bd_setup.sql located in db/migrations.

In order to test code you will want to look at setting up a test database. To do this you need to do the above once most, but CREATE DATABASE chitter_test instead:

Along side the table to store peoples 'peeps' you will also need to store user information. If you follow the steps below making a table for both the test and normal accounts.

- Connect to psql
- Connect to the database using the pqsl command \c chitter;
- Run the query we have saved in the file user_info_db_setup.sql located - in db/migrations.
- In order to test code you will want to look at setting up a test database. 