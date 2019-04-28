Chitter Challenge
=================

Outline
-------

To create an app where people can post messages to a public stream. 

Features:
-------

User Stories

```
STRAIGHT UP

As a Maker, I want to post a message (peep) to chitter, so that I can let people know what I am doing  


As a maker, I want to see all peeps in reverse chronological order, so that I can see what others are saying  


As a Maker, I want to see the time at which it was made, so that I can better appreciate the context of a peep


As a Maker, so that I can post messages on Chitter as me, I want to sign up for Chitter

HARDER

As a Maker, I want to log in to Chitter, so that only I can post messages on Chitter as me


As a Maker, I want to log out of Chitter, so that I can avoid others posting messages on Chitter as me


ADVANCED

As a Maker, I want to receive an email if I am tagged in a Peep, so that I can stay constantly tapped in to the shouty box of Chitter

```

Technical Approach:
-----
To build an application using Sinatra which integrates a database using the 'PG' gem and 'SQL' queries. 
I will make an attempt to incorporate an Object Relational Mapper as the database interface. 

If you'd like more technical challenge this weekend, try using an [Object Relational Mapper]

Notes on functionality:
------

* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.

Setup instructions:
------

$ git clone https://github.com/CarlyJ88/chitter_challenge
$ bundle
$ rake setup
$ rake migrate
$ rspec
$ rackup


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
