Chitter Challenge
=================

Challenge:
-------

To write a small Twitter clone that will allow the users to post messages to a public stream.

Features:
-------

```
User Story 1:
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

User Story 2:
As a Maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

User Story 3:
As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

User Story 4:
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

Technical Approach:
-----

It uses an approach that integrates a database using the `PG` gem and `SQL` queries. 

## Database set up
1) Connect to psql
2) Create the database using the psql command CREATE DATABASE chitter_challenge;
3) Connect to the database using the pqsl command \c chitter_challenge;
4) Run the query we have saved in the file 01_create_chitter_table.sql
5) Use the PG gem to connect ruby application to the Postgres SQL database
6) Set up a testing environment separate from the dev environment
7) Repeat steps above for the database and create database "chitter_challenge_test"

Notes on functionality:
------

* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Your README should indicate the technologies used, and give instructions on how to install and run the tests.


Notes on test coverage
----------------------

The following as at the top of spec_helper.rb in order to have test coverage stats generated
on your pull request:

```ruby
require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start
```

You can see the test coverage when you run tests. If you want this in a graphical form, uncomment the `HTMLFormatter` line and see what happens!
