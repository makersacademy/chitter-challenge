Weekend 4: Chitter Challenge
=================
Features:
-----------------

Aim: To achieve the first 4 user stories
Plan: to use my bookmark challenge and notes for help and to record where I hit blockers with as much context as possible.

Learning objectives from Week 4, I feel I worked on in this challenge: 
The basics of how databases work ( interacting with SQL )
CRUD and RESTful Routes


Attempted User Stories:

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

I think that I have completed these four user stories.
Running RSpec has no failures and 100% test coverage. Rubocop has 2 offenses:
`lib/database_connection.rb:9:3: C: Style/TrivialAccessors: Use attr_reader to define trivial reader methods.
  def self.connection
  ^^^
lib/user.rb:30:33: W: Lint/UnusedMethodArgument: Unused method argument - password.
  def self.authenticate(email:, password:)`

The first offence I am not sure how to change. The second is something I need to fix but ran out of time. 

My log in feature tests was passing when I don't think it should have been and that's recorded in an earlier commit. 

I have not been able to create the unhappy paths for authentication. You can only log in if you enter the right email and password. You get an IndexError page.


I'm unsure if all my feature tests are testing the right things also.


Notes on functionality:
----------------------

* You don't have to be logged in to see the peeps.
  - This is completed - you can choose to go to a chitter feed on the homepage and you don't get a personalised welcome message
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
  - All fields available for setting up but no testing for valid emails etc.
* The username and email are unique.
  - This is not true. There is not checking if that username already exists in the database and no error if it does.
* Peeps (posts to chitter) have the name of the maker and their user handle.
  - This is not true either, you have to enter your name to post a peep (which then does appear in the feed).

To run the code:

- run `bundle install`
- use the comman `rackup -p 4567` to start serve
- visit `http://localhost:4567/`

## Setting up the database

- Install Postgresql with Homebrew `brew install postgresql
- Connect to `psql` (set up admin database to start)
- Create the `chitter` database using `psql` command `\c chitter;` 
- For Peeps and Users table set up refer to db/migrations/01_create_peeps_table.sql and 02_create_users_table.sql
- Revisions to columns are found in `db/migrations`

## Setting up the testing database

- Connect to `psql` 
- Create `chitter_test` database using `psql` command `\c chitter_test;`
- Create table in `psql` using the command in db/migrations
