Chitter Challenge
=================

Challenge:
-------
Write a small Twitter clone that will allow the users to post messages to a public stream.

## Usage + how to run tests:

   - `cd` into folder
   - Run `bundle`

### Setting up the database:

  - Connect to psql
  - Create the databases using the commands `CREATE DATABASE chitter;` and `CREATE DATABASE chitter_test;`
  - Connect to each database using the respective commands `\c chitter;` and `\c chitter_test;`
  - Run the query saved in the file 01_create_peeps_table.sql for each database

### Running tests:

  - Run `rspec`

### Live View:

  - Run `rackup`


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

Technical Approach:
-----

Integrate a database using the `PG` gem and `SQL` queries. 

## Technologies Used:

* Ruby
* Rspec
* Capybara
* PG
* Postgresql
* Sinatra
* Travis
* Html
* CSS


Notes on functionality:
------

* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Your README should indicate the technologies used, and give instructions on how to install and run the tests.

