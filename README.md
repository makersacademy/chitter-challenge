Chitter Challenge
=================

Weekend challenge (week 4) of Makers bootcamp. I have written a basic Twitter clone (Chitter) that allows users to post messages(peeps) to a public stream.

The Chitter database is integrated using PG gem and SQL. The database stores peeps (content, time posted) and users (username, handle) in separate tables. 

I am currently in the middle of updating my views and Peep class so that handle, username are pulled from User and users table rather than peeps. 

Features:
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

Features in process of implementing:
-------

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

Features not yet implemented
-------

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

#### Setting up the database

1. Connect to psql
2. Create the database using the psql command CREATE DATABASE chitter;
3. Connect to the database using the pqsl command \c chitter;
4. Run the query we have saved in the file 01_create_peeps_table.sql
5. Run the query we have saved in the file 04_create_users_table.sql

#### Setting up the test database
1. Create the database to be used when running rspec using the psql command CREATE DATABASE chitter_test;
2. Connect to the database using the pqsl command \c chitter_test;
3. Run the query we have saved in the file 01_create_peeps_table.sql
5. Run the query we have saved in the file 04_create_users_table.sql