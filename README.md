Chitter Challenge
=================

Challenge:
-------
A small Twitter clone that will allow the users to post messages to a public stream.


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

Getting started
------

1. Clone this repo 'git clone git@github.com:emanuelegorga/chitter-challenge.git'
2. Change directory 'cd chitter-challenge'
3. Install dependencies through 'bundle'
4. Install postgresql through 'brew install postgres'

Run the tests
------
1. Create a test database 'createdb chitter_test'
2. Set up the test tables 'rake db:auto_migrate RACK_ENV=test'
3. Run the tests 'rspec'

How to use it
------
1. Create a development database 'createdb chitter_development'
2. Set up the development tables 'rake db:auto_migrate'
3. Run the server through 'rackup'
4. Navigate [here](http://localhost:9292)

The app
------
1. Sign Up
2. Write your peeps
3. You can see your peeps in your profile page or have a look at all peeps created by other users in the index.

Technical Approach and technologies I used:
-----
* sinatra - To create the web app using Ruby;
* postgresql - Database;
* database_cleaner - Cleans up the database for each test ran;
* data_mapper - Ruby ORM;
* capybara - Test frameworks used for web developent.
