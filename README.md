Chitter Challenge
=================

### INTRODUCTION

The aim of this project is to build a small Twitter clone that will allow the users to post messages to a public stream.

The project is provided by Makers Academy. It is the fourth weekend challenge and is the culmination of a week spent on the fundamentals of web app development with a database.

### USER STORIES

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

### MOTIVATION

For this challenge I will be focusing on specific goals within the Makers Academy high level goals:

**I can TDD anything**

* Apply the MVC framework Sinatra to build a simple web app.
* Apply a wrapper class/adapter to wrap around an object as an interface to a database.

**I have a methodical approach to solving problems**

* Understand and utilise the MVC frameworks and RESTful routing.

**I can debug anything**

* Being able to debug within an MVC model with an integrated database.

### TECH/FRAMEWORK USED

This project follows the RSpec testing framework using capybara. Find out more about Capybara [here](http://teamcapybara.github.io/capybara/).

`"RSpec is a Behaviour-Driven Development tool for Ruby programmers. BDD is an approach to software development that combines Test-Driven Development, Domain Driven Design, and Acceptance Test-Driven Planning. RSpec helps you do the TDD part of that equation, focusing on the documentation and design aspects of TDD."` [Link](https://relishapp.com/rspec)

`Sinatra` the ruby web framework will be used to develop this app. It will follow the MVC development pattern. Ruby will be used as the programming language and HTML in Sinatra views for the user interface.

`PostgreSQL` has been used for the database. PostgreSQL is a free open-source relational database management system, designed to handle a range of workloads, from single machines to data warehouses or Web services with many concurrent users. [Link](https://www.postgresql.org/)

While developing the app I used the Ruby web server interface, Rack. More info can be found at [Rack](https://rack.github.io/).

### CODE STYLE

[Rubocop](https://github.com/rubocop-hq/rubocop) has been used as a guide.

### GETTING STARTED

* Fork/clone this project
* In the terminal, run bundle to install all the dev dependencies
* In the terminal, type `rackup` to start the server (served on localhost:9292 by default)
* Load up http://localhost:9292/ in your browser of choice

### HOW TO USE THE APP

### IMAGES/SCREENSHOTS

### RUNNING TESTS

## APPROACH

Below is the approach I took to build the Chitter web app. First of all I took each of the user stories and turned them into a domain model. From there I began creating tests to systematically build the web app.

### USER STORY 1

```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter
```

![User Story 1: Domain Model](https://github.com/marbuthnott/chitter-challenge/blob/master/images/user_story_1.jpg?raw=true)

**TEST CASES**

Feature tests:

-[X] A user can add multiple peeps and view them.

`peep` unit tests:

-[X] Creates a new peep.
-[X] Returns a list of peeps.

### USER STORY 2

```
As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order
```

**TEST CASES**

Feature tests:

-[X] A user sees the posts in reverse chronological order.

### USER STORY 3

```
As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

Feature tests:

-[X] A user can see the time a peep was made.

`peep` unit tests:

-[X] Creates a new peep with a timestamp.

### USER STORY 4
```
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter
```

![User Story 4: Domain Model](https://github.com/marbuthnott/chitter-challenge/blob/master/images/user_story_4.jpg?raw=true)

Feature tests:

-[X] A user can sign up to Chitter.

`user` unit tests:

-[X] It can create a new user.
-[X] It creates a new user and stores the data in a users table.
-[X] It can find a user by id.

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
