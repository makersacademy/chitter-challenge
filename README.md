# Chitter Challenge

This is my response to the 'weekend challenge' of Week 4 of Makers Academy. For full details of what the challenge involved, see 'APPENDIX' below.

## Instructions for developers

Note that you will need postgreSQL installed.

1) `$ git clone github.com:jonsanders101/chitter-challenge.git`
2) Navigate to `chitter-challenge`
3) `$ bundle`
4) `$ createdb chitter_development` - creates a database
5) `$ createdb chitter_test`- creates a database specifically for testing
6) `$ rake db:auto_migrate` - creates tables in your development
7) `$ rake db:auto_migrate RACK_ENV=test` - creates tables in your test database
8) `$ rackup`
9) Visit 'http://localhost:9292/' in a web browser

## Usage

This app is hosted on Heroku and can be accessed by clicking [here](https://chitter-app2468.herokuapp.com/).

## Technologies used

* Ruby
  * Server-side language
* Sinatra
  * Web Framework
* PostgreSQL
  * Database
* DataMapper
  * ORM
* BCrypt
  * Encryption gem for passwords

##### For Testing

* RSpec
* Capybara

## Running tests

Run `rspec`

100% test coverage.

## Main Weaknesses & Areas to Improve

* Files aren't added to the LOAD_PATH. Instead, `require_relative`s are used. There may be unnecessary `require` statements or inconsistencies in the use of these which should be reviewed.
* Directory structure needs reviewing, particularly `./lib` and the unit tests.
* Route names do not follow RESTful conventions
* Sinatra 'flash' messages should be used for alerts, such as incorrect login details or to notify the user has logged out
* No handling for Peeps longer than 140 characters
* The following error is undiagnosed: `~/.rvm/gems/ruby-2.4.2/gems/data_objects-0.10.17/lib/data_objects/pooling.rb:149: warning: constant ::Fixnum is deprecated`
* When launching the app through `$ ruby ./app/chitter_app.rb` rather than through `$ rackup`, the following unresolved error is returned: /.rvm/rubies/ruby-2.4.2/lib/ruby/2.4.0/rubygems/specification.rb:2293:in `raise_if_conflicts': Unable to activate dm-serializer-1.2.2, because json-2.1.0 conflicts with json (~> 1.6) (Gem::ConflictError)``
* 'signup_spec' doesn't test that a password has been added to the database or that a new session is added when the user has logged in
* Tag links should be interpolated into the Peep message, not listed afterwards. I recognise there are straightforward ways of achieving this through the Rails `link_to` method.
* Controllers are all in one file and should be split across several
* Singleton pattern for Peep Deck should be used

## Ways I Would Extend this project

* CSS styling
* Password reset
* Password confirmation
* Email alerts
* Tag users in Peeps
* Reply to Peeps
* "Peep" out profanity
* Allow user to login with email or username
* Split Peeps over multiple pages

## APPENDIX

Chitter Challenge
=================

* Challenge time: rest of the day and weekend, until Monday 9am
* Feel free to use google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

Challenge:
-------

As usual please start by forking this repo.

We are going to write a little Twitter clone that will allow the users to post messages to a public stream.

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

* Drive the creation of your app using tests - either cucumber or rspec as you prefer
* Use data mapper and postgres to save the data.
* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a user name (e.g. sam@makersacademy.com, s3cr3t, Samuel Russell Hampden Joseph, tansaku).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Use bcrypt to secure the passwords.
* You only can peep if you are logged in.
* Please ensure that you update your README to indicate the technologies used, and give instructions on how to install and run the tests
* Finally submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am

Bonus:
-----

If you have time you can implement the following:

* In order to start a conversation as a maker I want to reply to a peep from another maker.

And/Or:

* Work on the css to make it look good (we all like beautiful things).

Good luck and let the chitter begin!

Code Review
-----------

In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance may make the challenge somewhat easier.  You should be the judge of how much challenge you want this weekend.

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
