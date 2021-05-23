# Project Title
## Chitter

### Motivation

Building a replica of the twitter app that will allow user to
* Sign up and register
* Login or logout
* Post a chirp
* Delete a chirp
* Comment on chirp

### User Stories

As a maker<br>
So that I can see what others are saying<br>  
I want to see all peeps in reverse chronological order<br>

As a user<br>
So I can store bookmark data for later retrieval<br>
I want to add a bookmark to Bookmark Manager<br>

### Bonus


## Build status
Initial commit included
* A README file
* Forked the repo 
* Created a gemfile with dependencies
* Edited spec_helper 
* Created app.rb
* Crated config.ru
* Pass the first test to display a home page.
Removed the homepage display test and added
* Chirps class to return all chirps
* Route and erb files to display all chirps
Created the databases for chitter.
* 3 Chirps are currently stored in chitter.
* 0 Chirps in chitter_test
* Added the both databases anad tables to TablePlus.
Setup RSpec and Capybara to use test databases.
Able to create and add a chirp.
Added a title column to both database tables.
Refactored spec tests and code.
User is now able to delete a chirp.
User is now able to comment on chirps.
After commenting on a chirp, there was an issue with deleting a chirp. Now, whether a chirp is commented on or not, it can be deleted.
Created a users table
Users are now registered and authenticated

## Code style


## Tech/Framework used
* VS Code

## Built with
* Ruby
* Sinatra (http://sinatrarb.com/documentation.html)
* PostgreSQL (https://www.postgresql.org/docs/current/)
* Rspec (https://relishapp.com/rspec)
* Capybara (https://rubydoc.info/github/teamcapybara/capybara/master)
* Shotgun (https://github.com/rtomayko/shotgun)
* Flash (https://gist.github.com/cmkoller/0d3b048b3c4b48ee4955)
* HTML 
* CSS

## Installation

### Setting Up a PostgreSQL Database

Please refer to the files in db/migrations for the database setup.

## Tests

## Screenshots

<img src="./public/images/" width="50%">
<img src="./public/images/" width="50%">

## How to use?

## Credits
* JP Ferreira








Chitter Challenge
=================

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

In this unit, you integrated a database into Bookmark Manager using the `PG` gem and `SQL` queries. You can continue to use this approach when building Chitter Challenge.

If you'd like more technical challenge now, try using an [Object Relational Mapper](https://en.wikipedia.org/wiki/Object-relational_mapping) as the database interface.

Some useful resources:
**DataMapper**
- [Datamapper wiki](https://en.wikipedia.org/wiki/DataMapper)
- [Sinatra, PostgreSQL & DataMapper recipe](https://github.com/sinatra/sinatra-recipes/blob/master/databases/postgresql-datamapper.md)

**Ruby Object Mapper**
- [ROM](https://rom-rb.org/)

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

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance may make the challenge somewhat easier.  You should be the judge of how much challenge you want at this moment.

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
