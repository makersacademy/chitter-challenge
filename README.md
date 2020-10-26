# Chitter #

This social media app enables the user to sign up, log in and post peeps that are linked to their account. The site is still under production in terms of styling, however, it is functional. Users can view other users peeps along with the username and the time the peep was posted on the feedpage. The peeps are listed in reverse chronological order to keep the users feed fresh. Users can post a peep, by clicking on a button from the feed page, with up to 250 characters. There is currently a method that is still undergoing work which enables users to view the name associated wit the peep as well as the username.

### Set up:

- Clone this repository
- In your terminal run:
``` 
~ bundle
```

**Setting up your chitter manager database:**

- In your terminal run:
``` 
~ psql postgres
```
- Create your database:
```
postgres=# CREATE DATABASE chitter_manager;
```
- Connect to database:
```
postgres=# \c chitter_manager;
```
- Create a peeps table by running the query in file 01_creating_peep_table.sql in the db/migrations directory
- Add a time column to peep table by running the query in file 02_adding_time_column.sql in the db/migrations directory
- Add a name column to peep table by running the query in file 04_adding_name_column.sql in the db/migrations directory
- Add a username column to peep table by running the query in file 05_adding_username_column.sql in the db/migrations directory

**Setting up your test chitter manager database:**

- In your terminal run:
``` 
~ psql postgres
```
- Create your database:
```
postgres=# CREATE DATABASE chitter_manager_test;
```
- Connect to database:
```
postgres=# \c chitter_manager_test;
```
- Create a peeps table by running the query in file 01_creating_peep_table.sql in the db/migrations directory
- Add a time column to peep table by running the query in file 02_adding_time_column.sql in the db/migrations directory
- Add a name column to peep table by running the query in file 04_adding_name_column.sql in the db/migrations directory
- Add a username column to peep table by running the query in file 05_adding_username_column.sql in the db/migrations directory

**Setting up your chitter account database:**

- In your terminal run:
``` 
~ psql postgres
```
- Create your database:
```
postgres=# CREATE DATABASE chitter_accounts;
```
- Connect to database:
```
postgres=# \c chitter_accounts;
```
- Create an accounts table by running the query in file 03_creating_accounts_table.sql in the db/migrations directory

**Setting up your test chitter account database:**

- In your terminal run:
``` 
~ psql postgres
```
- Create your database:
```
postgres=# CREATE DATABASE chitter_accounts_test;
```
- Connect to database:
```
postgres=# \c chitter_accounts_test;
```
- Create an accounts table by running the query in file 03_creating_accounts_table.sql in the db/migrations directory


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
