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

To start the Challenge I used the below CSC set up. I like using these as I don't have to plan out a rigid path for the application right away. By having an understanding of what methods or responsibilities each class will have along with the data I need to collect, I feel like I have the freedom to change the flow as I progress through the challenge.

<image src='./public/csc.png'>
