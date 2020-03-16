Chitter Challenge
=================
We are going to write a small Twitter clone that will allow the users to post messages to a public stream.

**Domain Model:**

| CHITTER        | PEEP             | USER             |
| :------------- |:-----------------|:-----------------|
| -------------- |------------------|------------------|
|                | @id              | @id              |
|                | @peep            | @name            |
|                | @post_time       | @username        |
|                | @post_date       | @email           |
|                |                  | @password        |
| -------------- |------------------|------------------|
| #print_peeps   | #time            | #valid_log_in    |
| #post_peep     | #date            |                  |
| #sign_up       |                  |                  |
| #log_in        |                  |                  |
| #log_out       |                  |                  |


**Databases Plan:**

- Table Peeps:

|  id  |    peep   | post_time |  post_date | users_id  |
|------|-----------|-----------|------------|-----------|
|  1   |  'Hello'  |  13:25:00 | 2020-01-14 |     1     |
|  2   |  'World'  |  17:05:00 | 2020-03-12 |     1     |

- Table Users:

|  id  |    name   |   username  |      email      |  password  |
|------|-----------|-------------|-----------------|------------|
|  1   |  'Dino'   | SuperCactus | dino@cactus.com | itsasecret |



**Views Plan:**
```
get '/chitter'            -->  display chitter.erb (link to sign_up - link to log_in - peep list)
get '/chitter/sign_up'    -->  display sign_up.erb (sign_up form)
post '/chitter/sign_up'   -->  redirect to ./chitter/log_in (saves data to users table in DB)
  # at this point redirects to '/chitter/user'
get '/chitter/log_in'     -->  display log_in.erb (log_in form)
post '/chitter/log_in'    -->  redirect to ./chitter/user (authenticates data)
get '/chitter/user'       -->  display user.erb (link to log_out - link to post_peep - peep list)
get '/chitter/post_peep'  -->  display post_peep.erb (post_peep form)
post '/chitter/post_peep' -->  redirect to ./chitter/user (saves peep to peeps table in DB)
post '/chitter/log_out'   -->  redirect to ./chitter (clears log_in data)
```

## Instructions to set up Database:
- Connect to psql
- Create the database using the psql command `CREATE DATABASE chitter;`
- Connect to the database using the pqsl command `\c chitter;`
- Run the query we have saved in the file 01_create_peeps_table.sql
- Run the query we have saved in the file 02_create_users_table.sql

### create a test environment
- Create the database using the psql command `CREATE DATABASE chitter_test;`
- Connect to the database using the pqsl command `\c chitter_test;`
- Run the query we have saved in the file 01_create_peeps_table.sql
- Run the query we have saved in the file 02_create_users_table.sql


**Features:**
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

**Technical Approach:**
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
