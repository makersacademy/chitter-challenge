Chitter Challenge
=================

Challenge:
-------

We are going to write a small Twitter clone that will allow the users to post messages to a public stream.

Features:
-------

```
STRAIGHT UP

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

HARDER

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

ADVANCED

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

Notes on functionality:
------

* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Your README should indicate the technologies used, and give instructions on how to install and run the tests.

To setup the database you'll have to do the following:
* Connect to psql
* Create the database using the psql command 'CREATE DATABASE chitter;'
* Connect to the database using the psql command '\c chitter;'
* Run the query saved in the file 'create_user_table.sql'

To setup the test database you'll have to do the following:
* Connect to psql
* Create the test database using the psql command 'CREATE DATABASE chitter_test;'
* Connect to the database using the psql command '\c chitter_test;'
* Run the query saved in the file 'create_peeps_table.sql'