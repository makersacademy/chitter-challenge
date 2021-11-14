Chitter Challenge
=================

Challenge:
-------

Write a small Twitter clone that will allow the users to post messages to a public stream.

Notes on functionality:
------

* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Your README should indicate the technologies used, and give instructions on how to install and run the tests.

User stories:
-------

**Checklist:**
- Post a message (peep) ::white_check_mark::
- See all peeps in reverse chronological order (newest to oldest) :construction:
- See the time each peep was made
- MORE STORIES TO FOLLOW BUT I'M STARTING WITH THE FIRST THREE TO BEGIN WITH

**Post a message (peep):** :white_check_mark:
```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter
```

**See all peeps in reverse chronological order (newest to oldest):** :construction:
```
As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order
```

**See the time each peep was made:**
```
As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

Setup instructions:
-------

THINGS TO INCLUDE HERE:

- How to setup the project. For example...
- Clone the repo
- Run bundle install
- rspec to run tests
- rackup to run app and view at local host
- Create the database
- Create the test database
- Anything else another developer would need to get started?

## Create a database

- `psql` - navigate to postgreSQL
- `CREATE DATABASE chitter;` - create a database
- `\c chitter;` - connect to database
- `CREATE TABLE peeps(id SERIAL PRIMARY KEY, message VARCHAR(140));` - create a 'peeps' table within the database
- `\dt` - list the tables, you should see 'peeps'

## Create a test database

- `psql` - navigate to postgreSQL
- `CREATE DATABASE chitter_test;` - create a test database
- `\c chitter_test;` - connect to test database
- `CREATE TABLE peeps(id SERIAL PRIMARY KEY, message VARCHAR(140));` - create a 'peeps' table within the test database
- `\dt` - list the tables, you should see 'peeps'
