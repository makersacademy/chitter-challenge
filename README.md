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
```

Notes on functionality:
------

* You don't have to be logged in to see the peeps.
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.

How to set up the application:
------

$ git clone https://github.com/tansaku/chitter_challenge
$ bundle
$ rake setup
$ rake migrate
$ rspec
$ rackup


Database setup 
------

Use the following commands:
```
$ Connect to psql.
psql
$ Create the database.
CREATE DATABASE Chitter-Challenge;
$ Connect to the database.
\c chitter_challenge;
$ Run the query we have saved in the file '01_create_chitter_table.sql'.
```

The TEST database was setup with the below commands:
```
CREATE DATABASE chitter_challenge_test;
CREATE TABLE chitter(id SERIAL PRIMARY KEY, time VARCHAR, message VARCHAR(280)); 
```
