Chitter Challenge
=================

Status:
-------
First three user stories complete. I ran out of time to start the remaining user stories.

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
- See all peeps in reverse chronological order (newest to oldest) :white_check_mark:
- See the time each peep was made :white_check_mark:

**Post a message (peep):** :white_check_mark:
```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter
```

**See all peeps in reverse chronological order (newest to oldest):** :white_check_mark:
```
As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order
```

**See the time each peep was made:** :white_check_mark:
```
As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

Setup instructions:
-------

1. Clone this repo.
2. Run `bundle install`
3. Create a database:
  - `psql` - navigate to postgreSQL
  - `CREATE DATABASE chitter;` - create a database
  - `\c chitter;` - connect to database
  - `CREATE TABLE peeps(id SERIAL PRIMARY KEY, message VARCHAR(140));` - create a 'peeps' table within the database
  - `ALTER TABLE peeps ADD COLUMN time VARCHAR(30);` - add a time column to the 'peeps' table
4. Create a test database:
  - `psql` - navigate to postgreSQL
  - `CREATE DATABASE chitter_test;` - create a test database
  - `\c chitter_test;` - connect to test database
  - `CREATE TABLE peeps(id SERIAL PRIMARY KEY, message VARCHAR(140));` - create a 'peeps' table within the test database
  - `ALTER TABLE peeps ADD COLUMN time VARCHAR(30);` - add a time column to the 'peeps' table
5. `Rspec` to run unit and feature tests
6. `Rackup` to run app then view front end at your local host

Test coverage:
-------
100%

Time spent on challenge:
-------
Saturday - 1 hour
Sunday - 8 hours