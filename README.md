Chitter Challenge
=================

## About this project
Chitter is a Twitter clone web-app built using Ruby and Sinatra. It allows users to sign up, log in, post peeps (like tweets), and comment on peeps. Users can also view their own profile, the profiles of other users, and individual peeps.

## Learnings from this project
This project helped improved my ability to:
- Build a fullstack web application using Ruby and the Sinatra framework
- Create routes, including GET and POST routes
- Use Embedded Ruby (ERB) to dynamically edit HTML view pages
- Create SQL databases and implement routes that interact with and manipulate data in these databases
- Implement user authentication using bcrypt
- Carry out unit and integrations tests using RSpec
- Style websites with CSS

## Installation
### How to install the code
- Clone this repository to your local machine
``git clone git@github.com:atcq9876/chitter-challenge.git``
- Navigate to the project directory
``cd chitter-challenge``
- Install the necessary dependencies
``gem install bundler``
``bundle install``

### How to set up the databases
- Install PostgreSQL database
- Run the following commands in the terminal to create the necessary databases:
``createdb chitter_development``
``createdb chitter_test``
- Run the following commands to set up the tables in the development database:
``psql -h 127.0.0.1 chitter_development < chitter_tables.sql``
- Run the following commands to set up the tables and seeds in the test database:
``psql -h 127.0.0.1 chitter_test < chitter_tables.sql``
``psql -h 127.0.0.1 chitter_test < /spec/seeds_chitter.sql``

### How to run the code
- Run rackup:
``rackup``
- Open your web browser and go to http://localhost:9292/
- You can then navigate the website. Please note that if you're not logged in, you won't be able to post peeps or comment on peeps.

## How to run tests
- Navigate to the project directory: cd chitter
- Run the tests
``rspec``

## Screenshots
To be added:
- App in use
- Tests passing
- Test coverage




Challenge:
-------


We are going to write a small Twitter clone that will allow the users to post messages to a public stream.

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

Notes on functionality:
------

* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Your README should indicate the technologies used, and give instructions on how to install and run the tests.

Bonus:
-----

If you have time you can implement the following:

* In order to start a conversation as a maker I want to reply to a peep from another maker.

And/Or:

* Work on the CSS to make it look good.

Good luck and let the chitter begin!

Code Review
-----------

In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/main/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance may make the challenge somewhat easier.  You should be the judge of how much challenge you want at this moment.
