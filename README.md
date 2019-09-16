# Chitter Challenge - week 4

This is the fourth weekend challenge at Makers Academy where I've been tasked to create "Chitter" which has some  of Twitter's basic functionality. A user can see some 'peeps', and signup to Chitter.

Learning objectives
-------
- Use Capybara for feature tests
- MVC pattern
- HTML and Ruby integration
- HTTP GET/POST methods
- PostgreSQL storing and querying databases


Instructions
-------
* Fork this repo
* Clone to your desired directory
```
$ git clone git@github.com:gabokappa/chitter-challenge.git
$ cd chitter-challenge
```
* Run the command 'bundle' in the project directory to ensure you have all the gems installed.

```
$ bundle
```
Before bundling ensure your Gemfile has the following content:

```
source 'https://rubygems.org'

gem 'capybara'
gem 'pg'
gem 'rake'
gem 'rspec'
gem 'rubocop', '0.71.0'
gem 'sinatra'
gem 'sinatra-flash'

group :test do
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end
```

* Rackup to run the program locally. Open your browser and go to localhost:9292

```
$ rackup
```
Database setup
-------

1) Create a Table in your chosen database for the Chitter users.

```
CREATE TABLE chitter_users (id SERIAL PRIMARY KEY, email VARCHAR(60) UNIQUE, username VARCHAR(60) UNIQUE, name VARCHAR(60), password VARCHAR(60));
```

2) Create a Table to hold the 'peeps'.

```
CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  content VARCHAR(280),
  timestamp timestamp DEFAULT to_timestamp(to_char(current_timestamp,
    'YYYY-MM-DD HH24:MI'), 'YYYY-MM-DD HH24:MI'));
```



## Note to reviewer
At the time of writing core user stories had been met with no bonus functionality (Login verification, and only logged in users allowed to post) Other steps to implement:

- implement a login erb
- validate login by making a query to the database
- raise a flash fail message if above query returns false
- use sessions to record user being logged in and clear session when user logs out
- only let logged in users compose a peep
- create a table in the database that joins peep id with chitter_user username
- create a method in peeps that looks up at the join table and determine the chitter_user username

## Approach
I took the main user stories and dealt with each one in turn, writing both feature tests and unit tests.

```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter
```

```
As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order
```

```
As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```


## ORIGINAL INSTRUCTIONS BELOW

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
