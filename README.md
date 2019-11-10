Chitter Challenge
=================

## Setup
* Make sure postgres is installed
* Install gems in Gemfile using `bundle install`
* Create database 'chitter' (see db_setup.sql)
* DataMapper will automatically create the necessary tables in 'chitter' when the server starts
* If you cloned the original repo, you may need to delete Gemfile.lock and reinstall the latest versions of the gems in order for DataMapper to work
* Run `rspec` from the root directory to see test results and coverage

## Features
### COMPLETED
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
```
### IN PROGRESS
```
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter
```
Users can be created, and peeps need a user ID to be created.  
Current user is stored in session.  
Tests are not all passing:
* Unit tests for User are passing
* Unit tests on Peep will pass if run in isolation, i.e. `rspec spec/peep_spec.rb`
* If tests are all run together with `rspec`, unit tests on Peep will fail
* Problems creating peeps for testing, as each peep needs a valid user ID, but
  each user ID has to be unique

### TO DO
```
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

### Notes on functionality:
* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Your README should indicate the technologies used, and give instructions on how to install and run the tests.
