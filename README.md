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

The TEST database was setup with the below commands:
```
$ Connect to psql.
psql
$ Run the following commands
SELECT pg_terminate_backend(pg_stat_activity.pid) FROM pg_stat_activity WHERE pg_stat_activity.datname = 'chitter_challenge' AND pid <> pg_backend_pid();
SELECT pg_terminate_backend(pg_stat_activity.pid) FROM pg_stat_activity WHERE pg_stat_activity.datname = 'chitter_challenge_test' AND pid <> pg_backend_pid();
DROP DATABASE IF EXISTS chitter_challenge;
DROP DATABASE IF EXISTS chitter_challenge_test;
$ Quit out of psql
\q
$ Use the Rakefile to create the databases. Enter the following commands in the command line of the terminal.
rake setup
rake test_database_setup
```