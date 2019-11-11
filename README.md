Chitter Challenge
=================

How to run:
-------
1. Type 'bundle' into the command line to install gems

2. Type 'psql' to start psql

3. Create a database by typing: CREATE DATABASE chitter;
4. Connect to the database by typing \c chitter;
5. Make a table by typing 'CREATE TABLE peeps(id SERIAL PRIMARY KEY, message VARCHAR(60));'
6. Add a username column by typing 'ALTER TABLE peeps ADD COLUMN "username" VARCHAR(60);'
7. Add a time column by typing 'ALTER TABLE peeps ADD COLUMN post_time VARCHAR(60);'

8. Repeat steps 3 to 6 but with replacing 'chitter' with 'chitter_test'

9. Exit psql by typing \q

User stories:
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
```

Notes on functionality:
------

* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Your README should indicate the technologies used, and give instructions on how to install and run the tests.
