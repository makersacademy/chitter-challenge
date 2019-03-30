Chitter - Matt Thompson
=======================

## Description

This Sinatra web app allows users post to and read from a feed of posted messages (peeps). It also allows users to sign-up and login to control their own posts.

![demo gif]()


#### Technologies used

- Ruby
- PostgreSQL (database manager)
- Rspec (test framework)
- Sinatra (Ruby web framework)
- Capybara (web feature test library)


#### Personal motivation

- Building a web app with a database
- Improved debugging debugging process for web and database applications
- Use of and better understanding of the Object Relational Model (ORM) design pattern
- Set up and use of test and dev database environments


## Steps to download

1. Fork this [repo](https://github.com/mattTea/chitter-challenge)

2. `git clone git@github.com:<userName>/chitter-challenge.git` onto your local machine


## Database setup instructions

1. Connect to psql in terminal `psql postgres`
2. Run `CREATE DATABASE chitter;`
3. Run `psql \c chitter;` (to connect to new db)
4. Create `peeps` table using the query saved in the file `01_create_peeps_table.sql`


## Steps to run

1. Run `ruby app.rb` or `rackup -p 4567` in root project directory

2. Visit `http://localhost:4567`


## To run tests

Run `rspec` directly in root of your local project


## My approach

1. Break down first user stories into an [object model](https://github.com/mattTea/rps-challenge/blob/master/problem/problem_breakdown.md) and simple feature steps

2. Add capybara config requirements into `spec_helper.rb`
    - `config.include Capybara::DSL`
    - `require File.join(File.dirname(__FILE__), '..', 'app.rb')`

3. Add necessary gems to Gemfile (`sinatra` as a minimum at this stage)

4. Write first feature test - testing infrastructure on `home (/)` route

5. Make it pass by following command line error messages
    - `LoadError` requiring `app.rb` controller
    -  Index `"/"` route required

6. Check in client by running `ruby app.rb` and visiting `localhost:4567`

7. Extract `view` by creating `index.erb` view file for `"/"` route

8. Initial commit and push to github

9. Refactors infra test and message to homepage welcome message

10. Test drive first user story (posting a peep) using Capybara feature tests and Rspec unit tests
    - `peeps/new` GET route
    - postgres db and peeps table setup
    - extract `peep` class, requiring `pg` gem
    - `peeps/new` POST route

<!-- Update the following -->

7. Continue with second feature test - testing enter name form

8. Follow red, green, refactor cycle for each feature test

9. Repeat until basic user story functionality is covered

10. Test-drive extracting `Score` class from the controller code into the model, using units tests, ensuring features tests don't break


#### Structure

- Controller: `app.rb`
- Views: `views/<name>.erb`
- Models: `lib/<name>.rb`
- Migrations: `db/<name>.sql`


#### User stories

```
STRAIGHT UP

User story 1: Post a peep
-------------------------
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter


User story 2: See all peeps
---------------------------
As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order


User story 3: See time of peep
------------------------------
As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made


User story 4: Sign-up
---------------------
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter


HARDER

User story 5: Log-in
--------------------
As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter


User story 6: Log-out
---------------------
As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter


ADVANCED

User story 7: Receive email notification
----------------------------------------
As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```


------

------

Original README - Chitter Challenge
===================================

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
