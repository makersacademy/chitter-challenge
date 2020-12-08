## Chitter Challenge
[![Build Status](https://travis-ci.com/ehwus/chitter-challenge.svg?branch=master)](https://travis-ci.com/ehwus/chitter-challenge)

  Week 4's Weekend Project with Maker's Academy - making a Twitter clone using Ruby.

This was an exercise in using databases with object relational mappers to go between my Ruby/Sinatra codebase and the PostgreSQL databases.

I created two databases for the 'Peeps' and the users, related as every peep contained the User ID as a foreign key. I then built an authentication system and the functionality to see all Peeps on the platform and details about the author and time that the Peep was posted.

I followed TDD principles throughout the process of building the app, and it has 100% test coverage.

I then gave the app a v a p o r w a v e / windows 98 theme for a e s t h e t i c s.

The app is live on Heroku [here](https://aws-chitter.herokuapp.com/) if you'd like to see it in action.

## Usage
The code has been built to run tests on a local PostgreSQL server, 'chitter_test', and then to connect to a remote SQL production server with a URI. This URI needs to be defined in a './.env' file like below before building:

    DATABASE_URL=XXXXXXXXXXXXXXXXXXXX
For security, it's also recommended that you set a secure session secret key in this manner to ensure proper encryption of your users' cookies:

    SESSION_SECRET=XXXXXXXXXXXXXXXXXX

To get running:

 1. Clone this repo
 2. `$ bundle install`
 3. `$ rake setup`
 4. `$ rackup`
 5. Visit localhost:9292 (or the port specified by rack in the terminal) in your web browser.
 6. Enjoy some wholesome Chits and Peeps with your friends!

## Screenshots

![Login page](./screenshots/screenshot1.png)
![Peep feed](./screenshots/screenshot2.png)

## Todo

 - [ ] Email notifications when people are tagged in Peeps
 - [ ] Reply/thread system
 - [X] Favourites

## Brief
  
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

-  [Datamapper wiki](https://en.wikipedia.org/wiki/DataMapper)

-  [Sinatra, PostgreSQL & DataMapper recipe](https://github.com/sinatra/sinatra-recipes/blob/master/databases/postgresql-datamapper.md)

  

**Ruby Object Mapper**

-  [ROM](https://rom-rb.org/)

  

**ActiveRecord**

-  [ActiveRecord ORM](https://guides.rubyonrails.org/active_record_basics.html)

-  [Sinatra, PostgreSQL & ActiveRecord recipe](http://recipes.sinatrarb.com/p/databases/postgresql-activerecord?#article)

  

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

  

Reviewers will potentially be using this [code review rubric](docs/review.md). Referring to this rubric in advance may make the challenge somewhat easier. You should be the judge of how much challenge you want at this moment.

  

Automated Tests:

-----

  

Opening a pull request against this repository will will trigger Travis CI to perform a build of your application and run your full suite of RSpec tests. If any of your tests rely on a connection with your database - and they should - this is likely to cause a problem. The build of your application created by has no connection to the local database you will have created on your machine, so when your tests try to interact with it they'll be unable to do so and will fail.

  

If you want a green tick against your pull request you'll need to configure Travis' build process by adding the necessary steps for creating your database to the `.travis.yml` file.

  

-  [Travis Basics](https://docs.travis-ci.com/user/tutorial/)

-  [Travis - Setting up Databases](https://docs.travis-ci.com/user/database-setup/)

  

Notes on test coverage

----------------------

  

Please ensure you have the following **AT THE TOP** of your spec_helper.rb in order to have test coverage stats generated

on your pull request:

  

```ruby

require  'simplecov'

require  'simplecov-console'

  

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([

SimpleCov::Formatter::Console,

# Want a nice code coverage website? Uncomment this next line!

# SimpleCov::Formatter::HTMLFormatter

])

SimpleCov.start

```

  

You can see your test coverage when you run your tests. If you want this in a graphical form, uncomment the `HTMLFormatter` line and see what happens!
