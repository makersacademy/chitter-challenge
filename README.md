Chitter Challenge
=================

Chitter is a Twitter Clone that allows users to post messages (peeps) to Chitter for others to view


User Stories:
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

Notes on functionality:
------

* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.

Setting up the database
--------------

1. Connect to psql
2. Create the database using the psql command CREATE DATABASE chitter;
3. Connect to the database using the pqsl command \c chitter;
4. Run the queries saved in the file 01_create_peeps_table.sql

Setting up the test database
-----------

1. Connect to psql
2. Create the database using the psql command CREATE DATABASE chitter_test;
3. Connect to the database using the pqsl command \c chitter_test;
4. Run the queries saved in the file 01_create_peeps_table.sql

