# Chitter Challenge

Small Twitter clone that allows the users to post messages to a public stream. Users can see all peeps (messages) without signing up/signing in. Users can sign up for Chitter accounts (username and email must be unique) and can log in and log out to use the app. All peeps are shown with the user's name, username, and time of post.

## Getting Started

### 1. Run Bundle Install

Before you run the program, make sure your gems are up to date by running:

```
$ bundle install
```

### 2. Database Setup 
 
* Install the postgresql command-line package (```$ brew postgres ```)
* Start postgres and set it to run automatically when your computer starts. (See the instructions in the output that brew shows when it's installing postgres.)

#### Create Database & Tables

```
$ psql postgres
$ postgres=# CREATE DATABASE "chitter_app";
$ postgres=# \c chitter_app;
```

```
$ chitter_app=# CREATE TABLE users(id SERIAL PRIMARY KEY, username VARCHAR(20), email VARCHAR(60), password VARCHAR(20), name VARCHAR(20));
$ chitter_app=# \dt
```

```
$ chitter_app=# CREATE TABLE peeps(id SERIAL PRIMARY KEY, text VARCHAR(250), timestamp TIMESTAMP, user_id INTEGER REFERENCES users(id));
$ chitter_app=# \dt
```

#### Create Test Database & Tables

```
$ psql postgres
$ postgres=# CREATE DATABASE "chitter_app_test";
$ postgres=# \c chitter_app_test;
```

```
$ chitter_app_testp=# CREATE TABLE users(id SERIAL PRIMARY KEY, username VARCHAR(20), email VARCHAR(60), password VARCHAR(20), name VARCHAR(20));
$ chitter_app_test=# \dt
```

```
$ chitter_app_test=# CREATE TABLE peeps(id SERIAL PRIMARY KEY, text VARCHAR(250), timestamp TIMESTAMP, user_id INTEGER REFERENCES users(id));
$ chitter_app_test=# \dt
```

## Running the program

### Start Server

```sh
$ rackup -p 4567
```

### View in Browser

```
localhost:4567
```

## Running the tests

To run tests for this program, run:

```
$ rspec
```


## Built With

* Sinatra
* PostgreSQL
* Capybara

## User Stories

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

=================

Technical Approach:
-----

This week you integrated a database into Bookmark Manager using the `PG` gem and `SQL` queries. You can continue to use this approach when building Chitter Challenge.

If you'd like more technical challenge this weekend, try using an [Object Relational Mapper](https://en.wikipedia.org/wiki/Object-relational_mapping) as the database interface.

Some useful resources:
**DataMapper**
- [DataMapper ORM](https://datamapper.org/)
- [Sinatra, PostgreSQL & DataMapper recipe](http://recipes.sinatrarb.com/p/databases/postgresql-datamapper)

**ActiveRecord**
- [ActiveRecord ORM](https://guides.rubyonrails.org/active_record_basics.html)
- [Sinatra, PostgreSQL & ActiveRecord recipe](http://recipes.sinatrarb.com/p/databases/postgresql-activerecord?#article)

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
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance may make the challenge somewhat easier.  You should be the judge of how much challenge you want this weekend.

Automated Tests:
-----

Opening a pull request against this repository will will trigger Travis CI to perform a build of your application and run your full suite of RSpec tests. If any of your tests rely on a connection with your database - and they should - this is likely to cause a problem. The build of your application created by has no connection to the local database you will have created on your machine, so when your tests try to interact with it they'll be unable to do so and will fail.

If you want a green tick against your pull request you'll need to configure Travis' build process by adding the necessary steps for creating your database to the `.travis.yml` file.

- [Travis Basics](https://docs.travis-ci.com/user/tutorial/)
- [Travis - Setting up Databases](https://docs.travis-ci.com/user/database-setup/)

Notes on test coverage
----------------------

Please ensure you have the following **AT THE TOP** of your spec_helper.rb in order to have test coverage stats generated
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

You can see your test coverage when you run your tests. If you want this in a graphical form, uncomment the `HTMLFormatter` line and see what happens!
