# The Challenge

This week's challenge was to create an app similar to twitter, called Chitter.

My project allows:
- Anyone to see all peeps, in reverse chronological order and with the date/time the peep was made
- A user to sign-up to chitter to get an account
- A user to login and logout of their account
- The assigning of the current logged-in user to a peep where someone is logged in
- The restriction of only allowing sign-up if a username/email has not been previously used

My project does not yet (but would like to):
- Allow users to view who peeps were made by
- Allow any kind of tagging of others in a peep
- Implement the sending of an email when someone is tagged in a peep
- Do any error checking for valid email addresses on user sign-up
- Do any error handling if peeps include special characters (e.g. a `'` in a peep may break the database insert)

## Some Key Notes
- I attempted to display the user who created a peep so there is some code commented out where I started this but did not finish it
- When I run rubocop it complains that lines are too long but I don't know how to make this better given the long queries that have to be created
- The test coverage is 98.79%. The live database is not tested during running rspec. I also created an implementation of saving the user_id against the message but I do not have a fully working feature test for it being displayed

## Technologies used

- Capybara and rspec for testing
- Sinatra for the webapp
- PostgreSQL for the database and `PG` gem to connect to it
- BCrypt for encrypting passwords

## Installing the project

- `git clone git@github.com:samanthaixer/chitter-challenge.git`
- `bundle install`

## Database setup

- `CREATE DATABASE chitter;`
- `CREATE DATABASE chitter_test;`

In both databases:
- run `01_create_message_table.sql`
- run `02_create_user_table.sql`

## Testing the code

- Run `rspec` in the root folder
- Run `rackup -p 4567` and visit `http://localhost:4567/chitter` to get started

## Work still to do

Given more time I would like to:

- build in functionality to display the user for each peep
- make the user interface nicer (images?)
- use an ORM Adapter
- fix any rubocop errors related to line length
- look at rake?
- check my feature tests to see if they are well written and have good coverage


Chitter Challenge
=================

* Challenge time: rest of the day and weekend, until Monday 9am
* Feel free to use Google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

Challenge:
-------

As usual please start by forking this repo.

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
