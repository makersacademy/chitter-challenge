Chitter Challenge
=================

## Getting started

1. Clone this repo `git clone git@github.com:Sindex42/chitter-challenge.git`
2. Change directory `cd chitter-challenge`
3. Run bundle to install dependencies `bundle`
4. Install postgresql `brew install postgres`

### Running tests

1. Create the test database `createdb chitter_test;`
2. Set up the test environment tables `rake db:auto_migrate RACK_ENV=test`
3. Run the tests with `rspec` in the project root folder

## Usage

1. Create the development database `createdb chitter_development;`
2. Set up the development environment tables `rake db:auto_migrate`
3. Run rackup to start the server `rackup`
4. Open up a browser and navigate to the following page [http://localhost:9292](http://localhost:9292)

### Signing up

Users can see peeps but cannot submit any without signing up first.

1. Navigate to the index page
2. Click on the 'Sign Up' link
3. Fill in your details and hit 'Submit'

### Submitting a message

1. Navigate to the index page
2. Enter your message in the prompted field and click 'Submit'
3. Repeat as neccessary

## Technologies used

Tech | Description
------------- |-------------
[capybara](https://github.com/teamcapybara/capybara) | Test framework for web development
[data_mapper](http://datamapper.org/) | Ruby ORM |
[database_cleaner](https://github.com/DatabaseCleaner/database_cleaner) | Used for cleaning databases before and after every test
[dm-postgres-adapter](https://github.com/datamapper/dm-postgres-adapter) | postgresql adapter for data_mapper
[sinatra](http://sinatrarb.com/) | [DSL](https://en.wikipedia.org/wiki/Domain-specific_language) for creating web applications in ruby
[sinatra-flash](https://github.com/SFEley/sinatra-flash) | Used for showing error messages for email and username uniqueness validation
[orderly](https://github.com/jmondo/orderly) | Rspec matcher for asserting that this appears_before(that) in rspec request specs
[postgresql](https://www.postgresql.org/) | Object-relational database management system


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

* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Your README should indicate the technologies used, and give instructions on how to install and run the tests.
