[![Build Status](https://travis-ci.org/cmb84scd/chitter-challenge.svg?branch=master)](https://travis-ci.org/cmb84scd/chitter-challenge)

## This is my Chitter Challenge!
This is Makers Academy's week 4 weekend challenge.

### How to use
To use clone this repo and then do the following:
```
run 'bundle'
set up databases (see below)
run 'ruby app.rb'
open browser and go to localhost:XXXX
nb: XXXX is the port number eg 4567
```
#### How to set up the database
1. Connect to psql
2. Create the database using the psql command CREATE DATABASE chitter;
3. Connect to the database using the psql command \c chitter;
4. Run the query we have saved in the file 01_create_peeps_table.sql
5. Run the query we have saved in the file 02_create_users_table.sql

#### How to set up the test database
1. Connect to psql
2. Create the database using the psql command CREATE DATABASE chitter_test;
3. Connect to the database using the psql command \c chitter_test;
4. Run the query we have saved in the file 01_create_peeps_table.sql
5. Run the query we have saved in the file 02_create_users_table.sql

### User stories and requirements
These are <a href="#userstories">here</a>

### How it went
I was reasonably happy with the progress I made. However, while doing the user sign up functionality I hit upon some bugs and as a result, I didn't get any further. With some help in the ensuing week I did fix these so the user can now sign up but the password is not protected. I think I might also have a database issue so this is something I'll have to look into, along with completing sign up. I'd also like to do sign-in/sign-out as well. Overall, I'm happy with what I achieved and in fixing the bugs I feel like I now have a better understanding of how certain parts of the code works.

##### Edit: 22/7/2020
I have now encrypted the password using BCrypt as well as doing sign-in and sign-out functionality. I also sorted Travis but in doing so I discovered that I did indeed have a problem with my database. I created it with a capital letter at the start and as a result it has caused me a lot of problems. Yes, the tests and app knew the database was there so everything worked but because psql defaults the database names to lowercase, Travis didn't like me. I was even unable to rename or drop the database locally due to this problem so I created new ones and pointed my app to them, which in turn made Travis happy. I've definitely learnt a lot from doing this challenge and am really glad I went back to it.

<a name="userstories"></a>
Challenge:
-------

We are going to write a small Twitter clone that will allow the users to post messages to a public stream. The user stories are as follows:<br><br>
STRAIGHT UP
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
```
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter
```
HARDER
```
As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter
```
```
As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter
```
ADVANCED
```
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
