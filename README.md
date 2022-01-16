Chitter Challenge
=================

I am doing the chitter challenge which is to create a Twitter clone that allows the user to post messages to a public stream.

First I installed the gems needed to run the web app and testing, update sepc_helper.rb, and setup app.rb and config.ru.
I met the first user story and set up a test environment so test messages don't go into the real database.
I set the result database query in of Peep all to be in reverse order.
I protected agains SQL injection, added the timestamp to peeps.
I created a registration method that takes a password and encyrpts.

Next steps: I would like to implement a login and logout procedure.


Seting up the databases:
----------
Setting up the peeps table in chitter directory:
(This will be used when the application is being run)
1. psql
2. psql CREATE DATABASE chitter;
3. psql \c chitter;
4. Run the query in 01_create_peeps_table.sql
5. Run this query to add the time column 02_add_time_column.sql
6. Run this query to add the username column to the table 03_add_username_column.sql
7. Run this query from the chitter database to create the user table 04_create_user_table


Setting up the peeps table in chitter directory:
(This will be used when the application is being tested)
1. psql
2. psql CREATE DATABASE chitter_test;
3. psql \c chitter_test;
4. Run the query in 01_create_peeps_table.sql
5. Run this query to add the time column 02_add_time_column.sql
6. Run this query to add the username column to the table 03_add_username_column.sql
7. Run this query from the chitter_test database to create the user table 04_create_user_table


User Stories that have been met:
-------

```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

```
