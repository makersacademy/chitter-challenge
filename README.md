Chitter Chatter
=================

App Brief:
-------

Write a small Twitter clone that will allow the users to post messages to a public stream.

User Stories:
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

* Users don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.

## Database Setup

The Chitter Chatter app requires a Test and Development database, setup instructions for both are as follows:

How to setup the development database from scratch:
1. Connect to psql
2. Create the database using the psql command CREATE DATABASE "chitter";
3. Connect to the database using these commands:
psql
\c chitter;
4. Run the query saved in the file 01_create_chatter_table.sql

How to setup the test database from scratch:
1. Connect to psql
2. Create the database using the psql command CREATE DATABASE "chitter_test";
3. Connect to the database using these commands:
psql
\c chitter_test;
4. Run the query saved in the file 01_create_chatter_table.sql
